const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const path = require('path');
const { errorHandler } = require('./middleware/errorHandler');
const connectDB = require('./config/database');

dotenv.config();

connectDB();

const app = express();
const { swaggerUi, swaggerSpec } = require("./config/swagger");

app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

console.log("📘 Swagger Docs available at: http://localhost:5000/api/docs");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/uploads', express.static(path.join(__dirname, '../uploads')));
app.use('/reports', express.static(path.join(__dirname, '../reports')));

const fs = require('fs');
const uploadsDir = path.join(__dirname, './uploads/videos');
const reportsDir = path.join(__dirname, './reports');

if (!fs.existsSync(uploadsDir)) {
  fs.mkdirSync(uploadsDir, { recursive: true });
}
if (!fs.existsSync(reportsDir)) {
  fs.mkdirSync(reportsDir, { recursive: true });
}
app.use('/api/auth', require('./routes/authRoutes'));
app.use('/api/cases', require('./routes/caseRoutes'));
app.use('/api/notifications', require('./routes/notificationRoutes'));
app.use('/api/reports', require('./routes/reportRoutes'));

app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'Mind Bloom API is running' });
});
app.use((req, res, next) => {
  res.status(404).json({ message: 'Route not found' });
});
app.use(errorHandler);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
  console.log(`📊 Environment: ${process.env.NODE_ENV}`);
});