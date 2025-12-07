# 🧠 Mind Bloom – ADHD (Attention Deficit Hyperactivity Disorder) Diagnostic & Care App

<div align="center">

<img src="frontend/assets/images/logo.jpg" width="250" alt="Mind Bloom Logo"/>

**Helping You Understand Your Child Better**

[![Flutter](https://img.shields.io/badge/Flutter-3.35-02569B?logo=flutter)](https://flutter.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-22.x-339933?logo=node.js)](https://nodejs.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-8.2-47A248?logo=mongodb)](https://www.mongodb.com/)

</div>

---

## 🎯 About the App

**Mind Bloom** is a mobile application designed to support early detection, diagnosis, and monitoring of ADHD in children.
The platform connects parents with medical professionals, enabling:

* AI-based preliminary screening
* Behavioral video analysis
* Doctor-reviewed assessments
* Real-time communication
* PDF diagnosis reports
* Ongoing monitoring and follow-up

### Objectives

* 🧠 **Early Detection** through guided questionnaires
* 🎥 **Behavioral Observation** via video submissions
* 🩺 **Professional Diagnosis** by certified doctors
* 📊 **Case Tracking & Reports**
* 🌍 **Multi-language Support** (EN / FR / AR)

---

## ✨ Key Features

### 👨‍👩‍👧 **For Parents**

* Create account & manage child profile
* AI-guided chatbot screening
* Severity scoring system
* Upload observation videos
* Submit cases to doctors
* Receive additional test requests
* Receive final diagnosis & downloadable PDF report
* Notification system
* Multi-language interface

### 🩺 **For Doctors**

* Login and access personalized dashboard
* Cases automatically sorted by severity (High / Medium / Low)
* Access full case details
* Watch submitted videos
* Request additional tests
* Write diagnosis & recommendations
* Send final conclusions to parents

### 🛠️ **Technical Features**

* Secure authentication (JWT)
* Dark/Light theme support
* Real-time notifications
* Cloud storage for videos
* Modern UI/UX (Violet theme)
* Smooth animations
* Responsive across all devices

---

## 📸 Screenshots

### 🔐 Authentication Flow

<div align="center">
  <img src="screenshots/splash_screen.png" width="250"/>
  <img src="screenshots/welcome_screen.png" width="250"/>
  <img src="screenshots/login_screen.png" width="250"/>
</div>

### 👨‍👩‍👧 Parent Experience

<div align="center">
  <img src="screenshots/parent_home.png" width="250"/>
  <img src="screenshots/child_info.png" width="250"/>
  <img src="screenshots/chatbot_screening.png" width="250"/>
</div>

<div align="center">
  <img src="screenshots/video_upload.png" width="250"/>
  <img src="screenshots/case_submitted.png" width="250"/>
  <img src="screenshots/parent_cases.png" width="250"/>
</div>

### 🩺 Doctor Experience

<div align="center">
  <img src="screenshots/doctor_home.png" width="250"/>
  <img src="screenshots/case_details.png" width="250"/>
  <img src="screenshots/diagnosis_form.png" width="250"/>
</div>

### ⚙️ Additional Features

<div align="center">
  <img src="screenshots/notifications.png" width="250"/>
  <img src="screenshots/settings.png" width="250"/>
  <img src="screenshots/about_adhd.png" width="250"/>
</div>

---

## 📁 Project Structure

```
mind-bloom/
├── frontend/                 # Flutter mobile app
│   ├── lib/
│   │   ├── constants/       
│   │   ├── models/          
│   │   ├── providers/       
│   │   ├── screens/         
│   │   ├── services/        
│   │   ├── widgets/         
│   │   └── main.dart        
│   ├── assets/images/       
│   └── pubspec.yaml         
│
├── backend/                 # Node.js API
│   ├── models/              
│   ├── routes/              
│   ├── controllers/         
│   ├── middleware/          
│   ├── config/              
│   ├── uploads/             
│   └── server.js           
│
├── screenshots/             
└── README.md                
```

---

## 🚀 Installation & Setup

### 📦 Prerequisites

* Flutter **3.24+**
* Node.js **18+**
* MongoDB **6.0+**
* VS Code or Android Studio
* Git

---

## 🛠️ Backend Setup (Node.js)

```bash
git clone https://github.com/yourusername/mind-bloom.git
cd mind-bloom/backend
npm install
```

### Configure environment variables

```bash
cp .env.example .env
```

Edit `.env`:

```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/mindbloom
JWT_SECRET=your_super_secret_jwt_key
NODE_ENV=development
```

### Run server

```bash
npm run dev
```

---

## 📱 Frontend Setup (Flutter)

```bash
cd mind-bloom/frontend
flutter pub get
```

### Configure API endpoint

Edit: `lib/constants/app_constants.dart`

```dart
static const String baseUrl = 'http://localhost:5000/api';
```

### Run app

```bash
flutter devices
flutter run
```

---

## 🔐 Security

* JWT authentication
* Bcrypt password hashing
* Input validation
* HTTPS recommended in production
* Upload size limits

---

## 👨‍💻 Authors

* **IEEE ENSIT**

---

## 🔮 Future Enhancements

* [ ] Advanced AI-based video analysis
* [ ] Community space for parents

---

<div align="center">
  <strong>Made with ❤️ for children and families</strong>
</div>

---

