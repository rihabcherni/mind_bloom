const Case = require('../models/Case');
const PDFService = require('../services/pdfService');
const path = require('path');

// @desc    Generate and download diagnosis report
// @route   GET /api/reports/:caseId/download
// @access  Private
const downloadReport = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.caseId)
      .populate('parentId', 'firstName lastName email relationToChild')
      .populate('doctorId', 'firstName lastName');

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    // Vérifier l'autorisation
    if (req.user.userType === 'parent') {
      if (caseItem.parentId._id.toString() !== req.user._id.toString()) {
        return res.status(403).json({ message: 'Not authorized' });
      }
    }

    // Vérifier que le diagnostic existe
    if (!caseItem.diagnosis) {
      return res.status(400).json({ message: 'Diagnosis not yet available' });
    }

    // Générer le PDF
    const pdfPath = await PDFService.generateDiagnosisReport(caseItem);

    // Envoyer le fichier
    const fullPath = path.join(__dirname, '../..', pdfPath);
    res.download(fullPath, `diagnosis_${caseItem.childFirstName}_${caseItem.childLastName}.pdf`);

  } catch (error) {
    console.error('Error generating report:', error);
    res.status(500).json({ message: error.message });
  }
};

// @desc    Get report URL (for mobile apps)
// @route   GET /api/reports/:caseId/url
// @access  Private
const getReportUrl = async (req, res) => {
  try {
    const caseItem = await Case.findById(req.params.caseId)
      .populate('parentId', 'firstName lastName email relationToChild')
      .populate('doctorId', 'firstName lastName');

    if (!caseItem) {
      return res.status(404).json({ message: 'Case not found' });
    }

    if (req.user.userType === 'parent') {
      if (caseItem.parentId._id.toString() !== req.user._id.toString()) {
        return res.status(403).json({ message: 'Not authorized' });
      }
    }

    if (!caseItem.diagnosis) {
      return res.status(400).json({ message: 'Diagnosis not yet available' });
    }

    const pdfPath = await PDFService.generateDiagnosisReport(caseItem);

    res.json({ 
      reportUrl: `${req.protocol}://${req.get('host')}${pdfPath}`,
      filename: `diagnosis_${caseItem.childFirstName}_${caseItem.childLastName}.pdf`
    });

  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  downloadReport,
  getReportUrl
};