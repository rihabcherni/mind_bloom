const User = require('../models/User');
const jwt = require('jsonwebtoken');
const { asyncHandler } = require('../middleware/errorHandler');

const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: '30d' });
};
const register = asyncHandler(async (req, res) => {
  const {
    firstName,
    lastName,
    email,
    password,
    userType,
    dateOfBirth,
    sex,
    medicalLicenseNumber,
    relationToChild
  } = req.body;

  if (!firstName || !lastName || !email || !password || !userType) {
    res.status(400);
    throw new Error('Please provide all required fields');
  }
  const userExists = await User.findOne({ email });
  if (userExists) {
    res.status(400);
    throw new Error('User already exists');
  }
  const userData = { firstName, lastName, email, password, userType, dateOfBirth, sex };
  if (userType === 'doctor') {
    if (!medicalLicenseNumber) {
      res.status(400);
      throw new Error('Medical license number is required for doctors');
    }
    userData.medicalLicenseNumber = medicalLicenseNumber;
  } else if (userType === 'parent') {
    if (!relationToChild) {
      res.status(400);
      throw new Error('Relation to child is required for parents');
    }
    userData.relationToChild = relationToChild;
  }
  const user = await User.create(userData);
  if (user) {
    res.status(201).json({
      _id: user._id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      userType: user.userType,
      token: generateToken(user._id)
    });
  } else {
    res.status(400);
    throw new Error('Invalid user data');
  }
});
const login = asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    res.status(400);
    throw new Error('Please provide email and password');
  }
  const user = await User.findOne({ email });
  if (user && (await user.comparePassword(password))) {
    res.json({
      _id: user._id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      userType: user.userType,
      token: generateToken(user._id)
    });
  } else {
    res.status(401);
    throw new Error('Invalid email or password');
  }
});
const getMe = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id).select('-password');
  if (!user) {
    res.status(404);
    throw new Error('User not found');
  }
  res.json(user);
});
module.exports = {
  register,
  login,
  getMe
};