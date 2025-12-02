const Case = require('../models/Case');
const User = require('../models/User');
const NotificationService = require('../services/notificationService');

// @desc    Create new case
// @route   POST /api/cases
// @access  Private (Parent only)
const createCase = async (req, res) => {
  try {
    const {
      childFirstName,
      childLastName,
      childSex,
      childAge,
      scholarYear,
      screeningAnswers,
      gravityScore
    } = req.body;

    const newCase = await Case.create({
      childFirstName,
      childLastName,
      childSex,
      childAge,
      scholarYear,
      parentId: req.user._id,
      screeningAnswers,
      gravityScore,
      status: 'waiting_for_doctor'
    });

    // ✅ NOUVEAU : Notifier tous les docteurs
    await NotificationService.notifyNewCase(
      newCase._id,
      `${childFirstName} ${childLastName}`,
      gravityScore
    );

    res.status(201).json(newCase);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Upload video to case
// @route   POST /api/cases/:id/video
// @access  Private (Parent only)
const uploadVideo = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Not authorized' });
    }

    if (!req.file) {
      return res.status(400).json({ message: 'No video file uploaded' });
    }

    caseItem.videoUrl = `/uploads/videos/${req.file.filename}`;
    caseItem.videoUploadDate = Date.now();
    await caseItem.save();

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get parent's cases
// @route   GET /api/cases/my-cases
// @access  Private (Parent only)
const getMyCases = async (req, res) => {
  try {
    const cases = await Case.find({ parentId: req.user._id })
      .sort({ createdAt: -1 });
    res.json(cases);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get all cases for doctor
// @route   GET /api/cases/doctor-cases
// @access  Private (Doctor only)
const getDoctorCases = async (req, res) => {
  try {
    const cases = await Case.find()
      .populate('parentId', 'firstName lastName email relationToChild')
      .sort({
        gravityScore: -1,
        createdAt: -1
      });

    const sortedCases = cases.sort((a, b) => {
      const order = { high: 0, medium: 1, low: 2 };
      return order[a.gravityScore] - order[b.gravityScore];
    });

    res.json(sortedCases);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get single case details
// @route   GET /api/cases/:id
// @access  Private
const getCaseById = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.id)
      .populate('parentId', 'firstName lastName email relationToChild')
      .populate('doctorId', 'firstName lastName medicalLicenseNumber');

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    if (req.user.userType === 'parent' &&
      caseItem.parentId._id.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Not authorized' });
    }

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Doctor assigns themselves to case
// @route   PUT /api/cases/:id/assign
// @access  Private (Doctor only)
const assignCase = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    caseItem.doctorId = req.user._id;
    await caseItem.save();

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Doctor submits diagnosis
// @route   PUT /api/cases/:id/diagnosis
// @access  Private (Doctor only)
const submitDiagnosis = async (req, res) => {
  try {
    const { summary, advice, recommendation } = req.body;
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    const doctor = await User.findById(req.user._id);

    caseItem.diagnosis = {
      summary,
      advice,
      recommendation,
      doctorName: `Dr. ${doctor.firstName} ${doctor.lastName}`,
      completedAt: Date.now()
    };
    caseItem.status = 'diagnosis_ready';
    await caseItem.save();

    // ✅ NOUVEAU : Notifier le parent
    await NotificationService.notifyDiagnosisReady(
      caseItem.parentId,
      caseItem._id,
      `${caseItem.childFirstName} ${caseItem.childLastName}`
    );

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Doctor requests additional test
// @route   PUT /api/cases/:id/request-test
// @access  Private (Doctor only)
const requestAdditionalTest = async (req, res) => {
  try {
    const { testType, instructions } = req.body;
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    caseItem.additionalTestRequest = {
      testType,
      instructions,
      requestedAt: Date.now()
    };
    caseItem.status = 'additional_test_required';
    await caseItem.save();

    // ✅ NOUVEAU : Notifier le parent
    await NotificationService.notifyAdditionalTestRequested(
      caseItem.parentId,
      caseItem._id,
      `${caseItem.childFirstName} ${caseItem.childLastName}`,
      testType
    );

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    Parent submits additional test response
// @route   PUT /api/cases/:id/test-response
// @access  Private (Parent only)
const submitTestResponse = async (req, res) => {
  try {
    const { answers } = req.body;
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Not authorized' });
    }

    caseItem.additionalTestResponse = {
      answers,
      submittedAt: Date.now()
    };

    if (req.file) {
      caseItem.additionalTestResponse.videoUrl = `/uploads/videos/${req.file.filename}`;
    }

    caseItem.status = 'waiting_for_reply';
    await caseItem.save();

    // ✅ NOUVEAU : Notifier le docteur assigné
    if (caseItem.doctorId) {
      await NotificationService.notifyTestResponseSubmitted(
        caseItem.doctorId,
        caseItem._id,
        `${caseItem.childFirstName} ${caseItem.childLastName}`
      );
    }

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  createCase,
  uploadVideo,
  getMyCases,
  getDoctorCases,
  getCaseById,
  assignCase,
  submitDiagnosis,
  requestAdditionalTest,
  submitTestResponse
};