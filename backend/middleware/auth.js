const jwt = require('jsonwebtoken');
const User = require('../models/User');

const protect = async (req, res, next) => {
  let token;

  if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
    token = req.headers.authorization.split(' ')[1];

    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      const user = await User.findById(decoded.id).select('-password');

      if (!user) {
        res.status(401).json({ message: 'User not found' });
        return;
      }

      req.user = user;
      next();
    } catch (error) {
      console.error('Auth middleware error:', error);
      res.status(401).json({ message: 'Not authorized, token failed' });
    }
  } else {
    res.status(401).json({ message: 'Not authorized, no token' });
  }
};

const restrictTo = (...userTypes) => {
  return (req, res, next) => {
    if (!req.user) {
      res.status(401).json({ message: 'User not found' });
      return;
    }
    if (!userTypes.includes(req.user.userType)) {
      res.status(403).json({ message: 'No permission' });
      return;
    }
    next();
  };
};

module.exports = { protect, restrictTo };
