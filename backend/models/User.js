const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema({
  firstName: {
    type: String,
    required: true,
    trim: true
  },
  lastName: {
    type: String,
    required: true,
    trim: true
  },
  email: {
    type: String,
    required: true,
    unique: true,
    lowercase: true,
    trim: true
  },
  password: {
    type: String,
    required: true,
    minlength: 6
  },
  userType: {
    type: String,
    enum: ['doctor', 'parent'],
    required: true
  },
  dateOfBirth: {
    type: Date,
    required: true
  },
  sex: {
    type: String,
    enum: ['male', 'female', 'other'],
    required: true
  },
  medicalLicenseNumber: {
    type: String,
    required: function () { return this.userType === 'doctor'; }
  },
  relationToChild: {
    type: String,
    enum: ['mother', 'father', 'teacher', 'other'],
    required: function () { return this.userType === 'parent'; }
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});
userSchema.pre('save', async function () {
  if (!this.isModified('password')) return;
  this.password = await bcrypt.hash(this.password, 10);
});
userSchema.methods.comparePassword = async function (candidatePassword) {
  return await bcrypt.compare(candidatePassword, this.password);
};

module.exports = mongoose.model('User', userSchema);
