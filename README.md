# 🧠 Mind Bloom - ADHD (Attention Deficit Hyperactivity Disorder) Diagnostic & Care Mobile App

<div align="center">

![Mind Bloom Logo](assets/images/logo.jpg)

**Helping You Understand Your Child Better**

[![Flutter](https://img.shields.io/badge/Flutter-3.9-02569B?logo=flutter)](https://flutter.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-18.x-339933?logo=node.js)](https://nodejs.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-8.2-47A248?logo=mongodb)](https://www.mongodb.com/)

</div>

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
│   │   └── images/          # Images & illustrations
│   └── pubspec.yaml         # Dependencies
│
├── backend/                 # Node.js API
│   ├── models/              # Mongoose schemas
│   ├── routes/              # API routes
│   ├── controllers/         # Business logic
│   ├── middleware/          # Auth & validation
│   ├── config/              # Configuration
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
---

## 👨‍💻 Authors

- **IEEE ENSIT** 
---

## 🔮 Future Enhancements

- [ ] AI-powered video analysis
- [ ] Parent community forum

---

<div align="center">
    **Made with ❤️ for children and families**
</div>





















































**Mind Bloom** is a Flutter mobile application designed to help parents and doctors collaborate in the early identification of ADHD-related behaviors in children.

Parents complete a guided chatbot questionnaire and upload a short behavior video. Doctors receive the case, review all materials, request additional tests, and send back a diagnosis with recommendations. A final PDF report is also provided.

This repository includes:


---

## ✨ Key Features

### 👨‍👩‍👧 Parent Features

* Create account & log in
* Start a new ADHD screening case
* Chatbot-guided questions (severity scoring included)
* Upload child observation video
* Submit case to doctor
* Receive additional test requests
* Receive final diagnosis + PDF report

### 🩺 Doctor Features

* Login as doctor
* Dashboard showing cases sorted by severity (High / Medium / Low)
* View complete case details
* Watch uploaded videos
* Request additional tests
* Write diagnosis + recommendations
* Send final conclusion to parent

---

## 📁 Suggested Project Structure

```
mind-bloom/
├─ frontend-flutter/
│  ├─ lib/
│  ├─ assets/
│  │  ├─ screenshots/
│  │  │  ├─ welcome.png
│  │  │  ├─ create_account.png
│  │  │  ├─ parent_home.png
│  │  │  ├─ chatbot_screening.png
│  │  │  └─ doctor_dashboard.png
│  └─ pubspec.yaml
├─ backend-node/
│  ├─ src/
│  ├─ routes/
│  ├─ controllers/
│  ├─ models/
│  └─ package.json
└─ README.md
```

---

## 📸 Screenshots (add your images here)

Place screenshots in `frontend-flutter/assets/screenshots/` then reference them:

```
![Welcome Screen](frontend-flutter/assets/screenshots/welcome.png)
![Create Account](frontend-flutter/assets/screenshots/create_account.png)
![Parent Home](frontend-flutter/assets/screenshots/parent_home.png)
![Chatbot Screening](frontend-flutter/assets/screenshots/chatbot_screening.png)
![Doctor Dashboard](frontend-flutter/assets/screenshots/doctor_dashboard.png)
```

---

## 🚀 Tech Stack

* **Flutter (Dart)** — Mobile frontend
* **Node.js + Express** — Backend REST API
* **MongoDB** — Database (Atlas or local)
* **File Storage** — Local uploads or AWS S3
* **Auth** — JWT
* **PDF Generation** — pdfkit / puppeteer / html-pdf

---

## 🛠️ Installation & Setup

### Backend Setup (Node.js)

1. Navigate to backend folder:

```bash
cd backend-node
```

2. Copy `.env.example` → `.env` and configure:

```
PORT=4000
MONGO_URI=mongodb://localhost:27017/mindbloom
JWT_SECRET=your_secret_key
UPLOADS_DIR=./uploads
```

3. Install dependencies:

```bash
npm install
```

4. Start server:

```bash
npm run dev
```

---

### Frontend Setup (Flutter)

1. Navigate to Flutter folder:

```bash
cd frontend-flutter
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run app:

```bash
flutter run
```

Make sure to update your API base URL in `lib/config.dart`.

---

## 🔌 REST API Overview

### **Authentication**

* `POST /api/auth/register` — Parent or Doctor
* `POST /api/auth/login` — Returns JWT

### **Parent Endpoints**

* `POST /api/cases` — Create ADHD case
* `GET /api/cases` — List parent cases
* `GET /api/cases/:id` — View case

### **Doctor Endpoints**

* `GET /api/doctor/cases` — View all cases (sorted by severity)
* `GET /api/doctor/cases/:id` — Case details
* `POST /api/doctor/cases/:id/conclusion` — Send diagnosis
* `POST /api/doctor/cases/:id/request-test` — Ask for additional test

### **File Upload**

* `POST /api/uploads/video` — Upload video

---

## 🗄️ Database Models

### **User Schema**

```js
{
  firstName,
  lastName,
  email,
  passwordHash,
  role: 'parent' | 'doctor',
  doctorProfile: { licenseNumber },
  parentProfile: { relationToChild }
}
```

### **Case Schema**

```js
{
  parentId,
  child: {
    firstName, lastName, sex, age, scholarYear
  },
  answers: [{ questionId, answer }],
  severityScore,
  videoUrl,
  status: 'new'|'additional_test'|'waiting'|'completed',
  doctorNotes: [],
  createdAt,
  updatedAt
}
```

---

## 🔐 Security

* JWT authentication
* Password hashing (bcrypt)
* Input validation on all routes
* HTTPS recommended in production
* Video upload size limits

---

## 📄 PDF Report Generation

Doctors can generate a full ADHD evaluation report.

Recommended endpoint:

```
GET /api/cases/:id/report
```

This returns a downloadable PDF.

---

## 🧪 Testing

* Backend: Jest + Supertest
* Flutter: Widget tests

---

## 📦 Deployment

* Backend → Render / Railway / VPS
* Database → MongoDB Atlas
* Videos → AWS S3
* Flutter → Play Store / App Store

---

## 🤝 Contributing

Pull requests are welcome. Please follow coding standards and include tests.

---

## 📬 Contact

**Rihab Cherni** — [rihabcherni235@gmail.com](mailto:rihabcherni235@gmail.com)

---

*README generated automatically — edit as needed.*
