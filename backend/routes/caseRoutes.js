/**
 * @swagger
 * tags:
 *   name: Cases
 *   description: Case management
 */

/**
 * @swagger
 * /api/cases:
 *   post:
 *     summary: Create a new case (Parent only)
 *     tags: [Cases]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       201:
 *         description: Case created
 */

/**
 * @swagger
 * /api/cases/{id}/video:
 *   post:
 *     summary: Upload a video for a case
 *     tags: [Cases]
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               video:
 *                 type: string
 *                 format: binary
 *     responses:
 *       200:
 *         description: Video uploaded
 */

const express = require('express');
const router = express.Router();
const {
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
} = require('../controllers/caseController');
const { protect, restrictTo } = require('../middleware/auth');
const upload = require('../config/multer');
router.post('/', protect, restrictTo('parent'), createCase);
router.post('/:id/video', protect, restrictTo('parent'), upload.single('video'), uploadVideo);
router.get('/my-cases', protect, restrictTo('parent'), getMyCases);
router.put('/:id/test-response', protect, restrictTo('parent'), upload.single('video'), submitTestResponse);

router.put('/:id', protect, restrictTo('parent'), updateCase);
router.delete('/:id', protect, restrictTo('parent'), deleteCase);

router.get('/doctor-cases', protect, restrictTo('doctor'), getDoctorCases);
router.put('/:id/assign', protect, restrictTo('doctor'), assignCase);
router.put('/:id/diagnosis', protect, restrictTo('doctor'), submitDiagnosis);
router.put('/:id/request-test', protect, restrictTo('doctor'), requestAdditionalTest);
router.get('/:id', protect, getCaseById);

module.exports = router;