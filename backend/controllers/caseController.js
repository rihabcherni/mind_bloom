const Case = require('../models/Case');
const User = require('../models/User');
const NotificationService = require('../services/notificationService');
const path = require('path');
const fs = require('fs');

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
const uploadVideo = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Cas non trouvé' });
    }

    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Non autorisé' });
    }

    if (!req.file) {
      return res.status(400).json({ message: 'Aucune vidéo uploadée' });
    }

    // Supprimer l'ancienne vidéo si elle existe
    if (caseItem.videoUrl) {
      const oldVideoPath = path.join(__dirname, '..', caseItem.videoUrl);
      if (fs.existsSync(oldVideoPath)) {
        fs.unlinkSync(oldVideoPath);
      }
    }

    caseItem.videoUrl = `/uploads/videos/${req.file.filename}`;
    caseItem.videoUploadDate = Date.now();
    await caseItem.save();

    res.json({
      message: 'Vidéo uploadée avec succès',
      videoUrl: caseItem.videoUrl,
      case: caseItem
    });
  } catch (error) {
    // Supprimer le fichier en cas d'erreur
    if (req.file) {
      const filePath = path.join(__dirname, '../uploads/videos', req.file.filename);
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
      }
    }
    res.status(500).json({ message: error.message });
  }
};
const getMyCases = async (req, res) => {
  try {
    const cases = await Case.find({ parentId: req.user._id })
      .sort({ createdAt: -1 });
    res.json(cases);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
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
const submitTestResponse = async (req, res) => {
  try {
    const { answers } = req.body;
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Cas non trouvé' });
    }

    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Non autorisé' });
    }

    // Parser les réponses si elles sont en string
    const parsedAnswers = typeof answers === 'string' ? JSON.parse(answers) : answers;

    caseItem.additionalTestResponse = {
      answers: parsedAnswers,
      submittedAt: Date.now()
    };

    // Ajouter la vidéo si elle existe
    if (req.file) {
      caseItem.additionalTestResponse.videoUrl = `/uploads/videos/${req.file.filename}`;
    }

    caseItem.status = 'waiting_for_reply';
    await caseItem.save();

    // Notifier le docteur
    if (caseItem.doctorId) {
      await NotificationService.notifyTestResponseSubmitted(
        caseItem.doctorId,
        caseItem._id,
        `${caseItem.childFirstName} ${caseItem.childLastName}`
      );
    }

    res.json({
      message: 'Réponse au test soumise avec succès',
      case: caseItem
    });
  } catch (error) {
    if (req.file) {
      const filePath = path.join(__dirname, '../uploads/videos', req.file.filename);
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
      }
    }
    res.status(500).json({ message: error.message });
  }
};
const updateCase = async (req, res) => {
  try {
    const {
      childFirstName,
      childLastName,
      childSex,
      childAge,
      scholarYear
    } = req.body;

    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    // Vérifier que c'est le parent propriétaire
    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Not authorized' });
    }

    // Empêcher la modification si le cas a déjà un diagnostic
    if (caseItem.status === 'diagnosis_ready' || caseItem.status === 'completed') {
      return res.status(400).json({
        message: 'Cannot edit a case that has been diagnosed'
      });
    }

    // Mettre à jour les champs
    if (childFirstName) caseItem.childFirstName = childFirstName;
    if (childLastName) caseItem.childLastName = childLastName;
    if (childSex) caseItem.childSex = childSex;
    if (childAge) caseItem.childAge = childAge;
    if (scholarYear) caseItem.scholarYear = scholarYear;

    caseItem.updatedAt = Date.now();
    await caseItem.save();

    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
const deleteCase = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.id);

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    // Vérifier que c'est le parent propriétaire
    if (caseItem.parentId.toString() !== req.user._id.toString()) {
      return res.status(403).json({ message: 'Not authorized' });
    }

    // Empêcher la suppression si le cas a un diagnostic
    if (caseItem.status === 'diagnosis_ready' || caseItem.status === 'completed') {
      return res.status(400).json({
        message: 'Cannot delete a case that has been diagnosed'
      });
    }

    await Case.findByIdAndDelete(req.params.id);

    res.json({ message: 'Case deleted successfully' });
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
  submitTestResponse,
  updateCase,
  deleteCase
};