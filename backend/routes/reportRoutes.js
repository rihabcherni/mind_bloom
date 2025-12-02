const express = require('express');
const router = express.Router();
const { downloadReport, getReportUrl } = require('../controllers/reportController');
const { protect } = require('../middleware/auth');

router.get('/:caseId/download', protect, downloadReport);
router.get('/:caseId/url', protect, getReportUrl);

module.exports = router;