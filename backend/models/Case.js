const mongoose = require('mongoose');

const caseSchema = new mongoose.Schema({
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
  parentId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  doctorId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    default: null
  },
  screeningAnswers: [{
    question: String,
    answer: String
  }],
  gravityScore: {
    type: String,
    enum: ['low', 'medium', 'high'],
    required: true
  },
  videoUrl: {
    type: String,
    default: null
  },
  videoUploadDate: {
    type: Date
  },
  status: {
    type: String,
    enum: ['waiting_for_doctor', 'additional_test_required', 'waiting_for_reply', 'completed', 'diagnosis_ready'],
    default: 'waiting_for_doctor'
  },
  additionalTestRequest: {
    testType: String,
    instructions: String,
    requestedAt: Date
  },
  additionalTestResponse: {
    videoUrl: String,
    answers: [{
      question: String,
      answer: String
    }],
    submittedAt: Date
  },
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
caseSchema.pre('save', function (next) {
  this.updatedAt = Date.now();
});
module.exports = mongoose.model('Case', caseSchema);