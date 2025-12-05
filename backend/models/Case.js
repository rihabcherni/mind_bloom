const mongoose = require('mongoose');

const caseSchema = new mongoose.Schema({
  // Child Information
  childFirstName: {
    type: String,
    required: true,
    trim: true
  },
  childLastName: {
    type: String,
    required: true,
    trim: true
  },
  childSex: {
    type: String,
    enum: ['male', 'female'],
    required: true
  },
  childAge: {
    type: Number,
    required: true
  },
  scholarYear: {
    type: String,
    required: true
  },

  // Parent Information
  parentId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },

  // Assigned Doctor
  doctorId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    default: null
  },

  // Chatbot Screening Answers
  screeningAnswers: [{
    question: String,
    answer: String
  }],

  // Gravity Score (computed by chatbot)
  gravityScore: {
    type: String,
    enum: ['low', 'medium', 'high'],
    required: true
  },

  // Video Upload
  videoUrl: {
    type: String,
    default: null
  },
  videoUploadDate: {
    type: Date
  },

  // Case Status
  status: {
    type: String,
    enum: ['waiting_for_doctor', 'additional_test_required', 'waiting_for_reply', 'completed', 'diagnosis_ready'],
    default: 'waiting_for_doctor'
  },

  // Additional Test Request
  additionalTestRequest: {
    testType: String,
    instructions: String,
    requestedAt: Date
  },

  // Additional Test Response
  additionalTestResponse: {
    videoUrl: String,
    answers: [{
      question: String,
      answer: String
    }],
    submittedAt: Date
  },

  // Doctor's Diagnosis
  diagnosis: {
    summary: String,
    advice: String,
    recommendation: String,
    doctorName: String,
    completedAt: Date
  },

  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
});

// Update updatedAt on save
caseSchema.pre('save', function (next) {
  this.updatedAt = Date.now();
});

module.exports = mongoose.model('Case', caseSchema);