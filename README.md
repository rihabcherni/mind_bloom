# 🧠 Mind Bloom - ADHD Diagnostic & Care Mobile App

<div align="center">

![Mind Bloom Logo](assets/logo.jpg)

**Helping You Understand Your Child Better**

[![Flutter](https://img.shields.io/badge/Flutter-3.24-02569B?logo=flutter)](https://flutter.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-18.x-339933?logo=node.js)](https://nodejs.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-6.0-47A248?logo=mongodb)](https://www.mongodb.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

[Features](#-features) • [Screenshots](#-screenshots) • [Tech Stack](#-tech-stack) • [Installation](#-installation) • [Architecture](#-architecture)

</div>

---

## 📋 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Installation](#-installation)
- [API Documentation](#-api-documentation)
- [Database Schema](#-database-schema)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 About

**Mind Bloom** is a comprehensive mobile application designed to facilitate ADHD diagnosis and monitoring in children. The platform connects parents with medical professionals through an intelligent screening system, providing personalized assessments and ongoing care.

### Key Objectives

- 🏥 **Early Detection**: AI-powered chatbot for preliminary ADHD screening
- 👨‍⚕️ **Professional Diagnosis**: Direct connection between parents and doctors
- 📊 **Comprehensive Assessment**: Video analysis and questionnaire-based evaluation
- 📱 **Easy Communication**: Real-time notifications and test requests
- 📈 **Progress Tracking**: Monitor child development over time

---

## ✨ Features

### For Parents

- ✅ **Interactive Chatbot Screening**: AI-guided ADHD questionnaire
- 📹 **Video Upload**: Submit behavioral videos for professional review
- 📊 **Case Management**: Track all submissions and diagnoses
- 🔔 **Real-time Notifications**: Instant updates on case status
- 📄 **Downloadable Reports**: PDF diagnosis reports
- 🌍 **Multi-language Support**: French, Arabic, and English

### For Doctors

- 🎯 **Priority-based Queue**: Cases sorted by severity (High/Medium/Low)
- 📋 **Comprehensive Case View**: Full patient history and assessments
- 🎬 **Video Analysis**: Review behavioral videos
- 💬 **Additional Tests**: Request supplementary evaluations
- 📝 **Diagnosis Submission**: Provide detailed conclusions and recommendations
- 📊 **Dashboard Analytics**: Overview of all cases and statistics

### Technical Features

- 🔐 **Secure Authentication**: JWT-based authentication system
- 🌙 **Dark Mode Support**: Complete light/dark theme implementation
- 📱 **Responsive Design**: Beautiful UI with modern animations
- ☁️ **Cloud Storage**: Video and document management
- 🔄 **Real-time Updates**: Instant synchronization across devices
- 🎨 **Modern UI/UX**: Violet-themed design with smooth transitions

---

## 📱 Screenshots

### Authentication Flow

<div align="center">
  <img src="screenshots/splash_screen.png" width="250" alt="Splash Screen"/>
  <img src="screenshots/welcome_screen.png" width="250" alt="Welcome Screen"/>
  <img src="screenshots/login_screen.png" width="250" alt="Login Screen"/>
</div>

**Splash Screen** | **Welcome Screen** | **Login Screen**

<div align="center">
  <img src="screenshots/user_type_selection.png" width="250" alt="User Type"/>
  <img src="screenshots/register_doctor.png" width="250" alt="Doctor Registration"/>
  <img src="screenshots/register_parent.png" width="250" alt="Parent Registration"/>
</div>

**User Type Selection** | **Doctor Registration** | **Parent Registration**

### Parent Experience

<div align="center">
  <img src="screenshots/parent_home.png" width="250" alt="Parent Home"/>
  <img src="screenshots/child_info.png" width="250" alt="Child Info"/>
  <img src="screenshots/chatbot_screening.png" width="250" alt="Chatbot"/>
</div>

**Parent Dashboard** | **Child Information** | **Chatbot Screening**

<div align="center">
  <img src="screenshots/video_upload.png" width="250" alt="Video Upload"/>
  <img src="screenshots/case_submitted.png" width="250" alt="Case Submitted"/>
  <img src="screenshots/parent_cases.png" width="250" alt="My Cases"/>
</div>

**Video Upload** | **Case Submitted** | **My Cases**

### Doctor Experience

<div align="center">
  <img src="screenshots/doctor_home.png" width="250" alt="Doctor Dashboard"/>
  <img src="screenshots/case_details.png" width="250" alt="Case Details"/>
  <img src="screenshots/diagnosis_form.png" width="250" alt="Diagnosis Form"/>
</div>

**Doctor Dashboard** | **Case Details** | **Diagnosis Form**

### Additional Features

<div align="center">
  <img src="screenshots/notifications.png" width="250" alt="Notifications"/>
  <img src="screenshots/settings.png" width="250" alt="Settings"/>
  <img src="screenshots/about_adhd.png" width="250" alt="About ADHD"/>
</div>

**Notifications** | **Settings** | **About ADHD**

---

## 🛠 Tech Stack

### Frontend - Flutter

```yaml
Framework: Flutter 3.24+
Language: Dart 3.0+
State Management: Provider
UI Components: Material Design 3
Animations: Custom animations with AnimationController
Internationalization: flutter_intl
```

**Key Dependencies:**
- `provider` - State management
- `http` - API communication
- `image_picker` - Video/image selection
- `shared_preferences` - Local storage
- `flutter_secure_storage` - Secure token storage
- `intl` - Internationalization

### Backend - Node.js + Express

```javascript
Runtime: Node.js 18.x
Framework: Express.js 4.x
Authentication: JWT (jsonwebtoken)
File Upload: Multer
Validation: express-validator
```

**Key Dependencies:**
- `express` - Web framework
- `mongoose` - MongoDB ODM
- `jsonwebtoken` - JWT authentication
- `bcryptjs` - Password hashing
- `multer` - File upload handling
- `cors` - Cross-origin resource sharing
- `dotenv` - Environment configuration

### Database - MongoDB

```
Database: MongoDB 6.0+
ODM: Mongoose 8.x
Cloud Service: MongoDB Atlas (optional)
```

**Collections:**
- `users` - User accounts (doctors/parents)
- `cases` - ADHD assessment cases
- `notifications` - User notifications
- `videos` - Video metadata

---

## 🏗 Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Flutter Mobile App                    │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Parent     │  │    Doctor    │  │    Shared    │  │
│  │   Screens    │  │   Screens    │  │  Components  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                          │                               │
│                    Provider State                        │
└──────────────────────────┼──────────────────────────────┘
                           │ HTTP/REST
                           ▼
┌─────────────────────────────────────────────────────────┐
│                  Express.js REST API                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │     Auth     │  │    Cases     │  │    Uploads   │  │
│  │  Middleware  │  │   Routes     │  │   (Multer)   │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└──────────────────────────┼──────────────────────────────┘
                           │ Mongoose ODM
                           ▼
┌─────────────────────────────────────────────────────────┐
│                      MongoDB Atlas                       │
│     Users  │  Cases  │  Notifications  │  Videos        │
└─────────────────────────────────────────────────────────┘
```

### Project Structure

```
mind-bloom/
├── frontend/                 # Flutter application
│   ├── lib/
│   │   ├── constants/       # App constants & colors
│   │   ├── models/          # Data models
│   │   ├── providers/       # State management
│   │   ├── screens/         # UI screens
│   │   ├── services/        # API services
│   │   ├── widgets/         # Reusable widgets
│   │   └── main.dart        # App entry point
│   ├── assets/
│   │   ├── images/          # Images & illustrations
│   │   └── fonts/           # Custom fonts
│   └── pubspec.yaml         # Dependencies
│
├── backend/                 # Node.js API
│   ├── src/
│   │   ├── models/          # Mongoose schemas
│   │   ├── routes/          # API routes
│   │   ├── controllers/     # Business logic
│   │   ├── middleware/      # Auth & validation
│   │   ├── config/          # Configuration
│   │   └── utils/           # Helper functions
│   ├── uploads/             # Uploaded files
│   ├── .env                 # Environment variables
│   └── server.js            # Server entry point
│
├── screenshots/             # App screenshots
└── README.md               # This file
```

---

## 🚀 Installation

### Prerequisites

- **Flutter SDK**: 3.24 or higher
- **Node.js**: 18.x or higher
- **MongoDB**: 6.0+ (local or MongoDB Atlas)
- **IDE**: VS Code or Android Studio
- **Git**: For version control

### Backend Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/mind-bloom.git
cd mind-bloom/backend
```

2. **Install dependencies**
```bash
npm install
```

3. **Configure environment variables**
```bash
cp .env.example .env
```

Edit `.env`:
```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/mindbloom
JWT_SECRET=your_super_secret_jwt_key_here
NODE_ENV=development
```

4. **Start MongoDB** (if running locally)
```bash
mongod --dbpath /path/to/data/db
```

5. **Run the server**
```bash
# Development mode with auto-reload
npm run dev

# Production mode
npm start
```

Server will run on `http://localhost:5000`

### Frontend Setup

1. **Navigate to frontend directory**
```bash
cd ../frontend
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Configure API endpoint**

Edit `lib/constants/app_constants.dart`:
```dart
static const String baseUrl = 'http://localhost:5000/api';
// For Android emulator: 'http://10.0.2.2:5000/api'
// For iOS simulator: 'http://localhost:5000/api'
// For physical device: 'http://YOUR_IP:5000/api'
```

4. **Run the app**
```bash
# Check connected devices
flutter devices

# Run on specific device
flutter run -d <device_id>

# Run in release mode
flutter run --release
```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

---

## 📚 API Documentation

### Base URL
```
http://localhost:5000/api
```

### Authentication Endpoints

#### Register User
```http
POST /auth/register
Content-Type: application/json

{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john@example.com",
  "password": "SecurePass123!",
  "userType": "parent",
  "dateOfBirth": "1990-01-01",
  "sex": "male",
  "relationToChild": "father"  // for parents
  // OR
  "medicalLicenseNumber": "ML12345"  // for doctors
}
```

#### Login
```http
POST /auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "SecurePass123!"
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "507f1f77bcf86cd799439011",
    "firstName": "John",
    "lastName": "Doe",
    "userType": "parent"
  }
}
```

### Case Management Endpoints

#### Create Case
```http
POST /cases
Authorization: Bearer {token}
Content-Type: application/json

{
  "childFirstName": "Emma",
  "childLastName": "Doe",
  "childAge": 8,
  "childSex": "female",
  "scholarYear": "3rd Grade",
  "screeningAnswers": [
    {
      "question": "Does your child have trouble focusing?",
      "answer": "Yes"
    }
  ],
  "gravityScore": "medium"
}
```

#### Upload Video
```http
POST /cases/:caseId/video
Authorization: Bearer {token}
Content-Type: multipart/form-data

video: <file>
```

#### Get Doctor Cases
```http
GET /cases/doctor
Authorization: Bearer {token}

Response:
[
  {
    "id": "507f1f77bcf86cd799439011",
    "childFullName": "Emma Doe",
    "childAge": 8,
    "gravityScore": "medium",
    "status": "waiting_for_doctor",
    "createdAt": "2024-01-15T10:30:00Z"
  }
]
```

#### Submit Diagnosis
```http
POST /cases/:caseId/diagnosis
Authorization: Bearer {token}
Content-Type: application/json

{
  "summary": "Based on the assessment...",
  "advice": "Recommend behavioral therapy...",
  "recommendation": "Schedule follow-up in 3 months"
}
```

### Notification Endpoints

#### Get Notifications
```http
GET /notifications?unreadOnly=true
Authorization: Bearer {token}

Response:
[
  {
    "id": "507f1f77bcf86cd799439011",
    "type": "diagnosis_ready",
    "title": "Diagnosis Ready",
    "message": "Dr. Smith has completed the diagnosis",
    "isRead": false,
    "createdAt": "2024-01-15T10:30:00Z"
  }
]
```

---

## 🗄 Database Schema

### User Model
```javascript
{
  _id: ObjectId,
  firstName: String,
  lastName: String,
  email: String (unique),
  password: String (hashed),
  userType: String (enum: ['doctor', 'parent']),
  dateOfBirth: Date,
  sex: String (enum: ['male', 'female', 'other']),
  
  // Doctor specific
  medicalLicenseNumber: String,
  
  // Parent specific
  relationToChild: String (enum: ['mother', 'father', 'teacher', 'other']),
  
  createdAt: Date,
  updatedAt: Date
}
```

### Case Model
```javascript
{
  _id: ObjectId,
  parentId: ObjectId (ref: 'User'),
  doctorId: ObjectId (ref: 'User'),
  
  // Child information
  childFirstName: String,
  childLastName: String,
  childAge: Number,
  childSex: String,
  scholarYear: String,
  
  // Screening
  screeningAnswers: [{
    question: String,
    answer: String
  }],
  gravityScore: String (enum: ['low', 'medium', 'high']),
  
  // Media
  videoUrl: String,
  
  // Status
  status: String (enum: [
    'waiting_for_doctor',
    'additional_test_required',
    'waiting_for_reply',
    'diagnosis_ready',
    'completed'
  ]),
  
  // Diagnosis
  diagnosis: {
    summary: String,
    advice: String,
    recommendation: String,
    submittedAt: Date
  },
  
  // Additional test
  additionalTestRequest: {
    testType: String,
    instructions: String,
    requestedAt: Date
  },
  
  additionalTestResponse: {
    answers: [{
      question: String,
      answer: String
    }],
    videoUrl: String,
    submittedAt: Date
  },
  
  createdAt: Date,
  updatedAt: Date
}
```

### Notification Model
```javascript
{
  _id: ObjectId,
  userId: ObjectId (ref: 'User'),
  caseId: ObjectId (ref: 'Case'),
  type: String (enum: [
    'diagnosis_ready',
    'additional_test_requested',
    'new_case',
    'test_response_submitted'
  ]),
  title: String,
  message: String,
  isRead: Boolean,
  createdAt: Date
}
```

---

## 👥 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Coding Standards

- Follow Flutter/Dart style guide
- Use meaningful variable names
- Comment complex logic
- Write unit tests for new features
- Update documentation

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Authors

- **Your Name** - *Initial work* - [YourGitHub](https://github.com/yourusername)

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- MongoDB team for the database
- All contributors and testers
- Medical professionals who provided insights

---

## 📞 Support

For support, email support@mindbloom.com or join our Slack channel.

---

## 🔮 Future Enhancements

- [ ] AI-powered video analysis
- [ ] Multilingual chatbot
- [ ] Telemedicine integration
- [ ] Progress tracking graphs
- [ ] Parent community forum
- [ ] Export to EMR systems
- [ ] Wearable device integration
- [ ] Offline mode support

---

<div align="center">

**Made with ❤️ for children and families**

[⬆ Back to Top](#-mind-bloom---adhd-diagnostic--care-platform)

</div>