const multer = require('multer');
const path = require('path');
const fs = require('fs');

const uploadsDir = path.join(__dirname, '../uploads/videos');
if (!fs.existsSync(uploadsDir)) {
  fs.mkdirSync(uploadsDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/videos/');
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});

const fileFilter = (req, file, cb) => {
  // Accept based on file extension as well as MIME type
  const allowedMimeTypes = [
    'video/mp4',
    'video/mpeg',
    'video/quicktime',
    'video/x-msvideo',
    'video/x-ms-wmv',
    'video/webm',
    'video/3gpp',
    'video/3gpp2',
    'application/octet-stream' // Sometimes mobile devices send this
  ];

  const allowedExtensions = ['.mp4', '.mov', '.avi', '.wmv', '.webm', '.3gp', '.mkv'];
  const fileExtension = path.extname(file.originalname).toLowerCase();

  console.log('File info:', {
    originalname: file.originalname,
    mimetype: file.mimetype,
    extension: fileExtension
  });

  // Check both MIME type and file extension
  if (allowedMimeTypes.includes(file.mimetype) || allowedExtensions.includes(fileExtension)) {
    cb(null, true);
  } else {
    cb(new Error(`Invalid file type. Received: ${file.mimetype}, Extension: ${fileExtension}`), false);
  }
};

const upload = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 100 * 1024 * 1024 // 100MB
  }
});

module.exports = upload;