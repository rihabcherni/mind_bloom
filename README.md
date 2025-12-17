<p align="center"> 
  <span style="font-size:30px;">🧠 Mind Bloom</span><br>
  <span style="font-size:12px;">ADHD (Attention Deficit Hyperactivity Disorder) Diagnostic & Care App</span>
</p>

<div align="center">
  <img src="frontend/assets/images/logo.jpg" width="200" alt="Mind Bloom Logo"/>
  <br>
  <strong>Helping You Understand Your Child Better</strong>
  <br><br>

[![Flutter](https://img.shields.io/badge/Flutter-3.35-02569B?logo=flutter)](https://flutter.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-22.x-339933?logo=node.js)](https://nodejs.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-8.2-47A248?logo=mongodb)](https://www.mongodb.com/)

</div>

---

## About the Application

**Mind Bloom** is a mobile application designed to facilitate early detection, diagnosis, and monitoring of ADHD in children.

It connects parents with healthcare professionals, enabling:

* 🤖 **AI-based preliminary screening**
* 🎥 **Behavioral analysis** through video submissions
* 🩺 **Medical assessments** by certified doctors
* 💬 **Real-time communication**
* 📄 **Diagnostic reports** in PDF format
* 📊 **Continuous monitoring** and follow-up

### Objectives

* 🧠 **Early detection** via guided questionnaires
* 🎥 **Behavioral observation** through video
* 🩺 **Professional diagnosis** by certified doctors
* 📊 **Case tracking** and report generation
* 🌍 **Multi-language support** (EN / FR / AR)
* 🎮 **Educational games** for concentration improvement
* 🌓 **Dark/Light mode** for visual comfort

---

## ✨ Key Features

### 👨‍👩‍👧 For Parents

* ✅ Account creation and child profile management
* 🤖 AI-powered chatbot with guided screening
* 📊 Automatic severity scoring
* 🎥 Upload behavioral observation videos
* 📤 Submit cases to doctors
* 🔔 Receive additional test requests
* 📋 Receive final diagnosis with downloadable PDF
* 💬 ADHD assistant chatbot via Groq API
* 🌍 Multi-language interface (EN / FR / AR)

### 🩺 For Doctors

* 🔐 Secure login and personalized dashboard
* 📊 Cases automatically sorted by severity (High 🔴 / Medium 🟠 / Low 🟢)
* 📁 Access full case details
* 🎥 Watch submitted videos
* 📝 Request customized additional tests
* ✍️ Write diagnoses and recommendations
* 📤 Send final conclusions to parents

### 🎮 Concentration Games (4 Games)

* 🧩 Designed to improve attention and focus
* 🎯 Adapted for children with ADHD
* 📈 Progress tracking
* 🏆 Motivating reward system

### 🛠️ Technical Features

* 🔒 JWT authentication with secure tokens
* 🔑 Password hashing with Bcrypt
* ✅ Server-side input validation
* 🛡️ CORS protection configured
* 🌓 Dark/Light mode support
* 🔔 Real-time notifications
* ☁️ Cloud storage for videos
* 🎨 Modern UI/UX (violet & white theme)
* ✨ Smooth animations
* 📱 Responsive across all devices

---

## 🎨 Application Design

### Color Theme

* **Primary:** Violet (#7B2CBF)
* **Secondary:** White (#FFFFFF)
* **Text:** Dark Violet / Black

---

## 📱 Application Screens & Functionality

### Getting Started

<div align="center">
  <img src="screenshots/welcome/splash_screen.jpg" width="200" alt="Splash Screen"/>
  <img src="screenshots/welcome/about1.jpg" width="200" alt="About Screen"/>
  <img src="screenshots/welcome/about2.jpg" width="200" alt="About2 Screen"/>
  <img src="screenshots/welcome/about3.jpg" width="200" alt="About3 Screen"/>
</div>
The app begins with an animated splash screen featuring the Mind Bloom logo, transitioning to educational carousel screens that introduce ADHD information and app features. An educational section provides valuable information about ADHD, helping parents better understand the condition and available support resources.

### 🔐 Authentication Flow
<div align="center">
  <img src="screenshots/auth/welcome_screen.jpg" width="200" alt="Welcome Screen"/>
  <img src="screenshots/auth/login_screen.jpg" width="200" alt="Login Screen"/>
  <img src="screenshots/auth/login_v_screen.jpg" width="200" alt="Login Screen"/>  
  <img src="screenshots/auth/login.jpg" width="200" alt="Login Screen"/>  
  <img src="screenshots/auth/role_screen.jpg" width="200" alt="Login Screen"/>  
  <img src="screenshots/auth/register_doctor.jpg" width="200" alt="Login Screen"/>
  <img src="screenshots/auth/register_parent.jpg" width="200" alt="Login Screen"/>
</div>
Users then reach the welcome screen where they can choose to login or create a new account. The login interface automatically detects user type (Parent or Doctor) based on credentials, while the registration flow allows profile selection with customized forms for each user type. All authentication is secured with JWT tokens and encrypted password storage.

### 👨‍👩‍👧 Parent Experience
Parents access a personalized dashboard displaying all their submitted cases with real-time status tracking. To initiate a new assessment, they enter their child's information including name, age, gender, and school grade. The AI-powered chatbot then conducts an interactive screening session with guided ADHD-related questions, automatically calculating a severity score based on responses to determine case priority.

<div align="center">
  <img src="screenshots/parent/parent_home.jpg" width="200" alt="Parent Home"/>
  <img src="screenshots/parent/add-kids.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/details-case.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/details-case2.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/details-case3.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/details-case4.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/details-case5.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/modifier-case.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/modifie-case.jpg" width="200" alt="Child Information"/>
</div>

<div align="center">
  <img src="screenshots/parent/questionnaire/q000.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q00.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q0.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q1.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q2.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q3.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q4.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/parent/questionnaire/q5.jpg" width="200" alt="Case Details"/>
</div>

After completing the questionnaire, parents upload a behavioral observation video of their child. The system generates a comprehensive case summary including child information, chatbot answers, and video for submission to doctors. Parents can track all their cases, receive notifications when doctors request additional tests or provide diagnoses, and download final diagnostic reports in PDF format.

  #### Chatbot Screening
<div align="center">
  <img src="screenshots/chatbot/chatbot0.jpg" width="200" alt="Chatbot Screening"/>
  <img src="screenshots/chatbot/chatbot1.jpg" width="200" alt="Chatbot Screening 1"/>
  <img src="screenshots/chatbot/chatbot2.jpg" width="200" alt="Chatbot Screening 2"/>
  <img src="screenshots/chatbot/chatbot3.jpg" width="200" alt="Chatbot Screening 3"/>
  <img src="screenshots/chatbot/chatbot4.jpg" width="200" alt="Chatbot Screening 5"/>
  <img src="screenshots/chatbot/chatbot6.jpg" width="200" alt="Chatbot Screening 6"/>
  <img src="screenshots/chatbot/chatbot7.jpg" width="200" alt="Chatbot Screening 7"/>
  <img src="screenshots/chatbot/chatbot8.jpg" width="200" alt="Chatbot Screening 8"/>
</div>


### Games
<div align="center">
  <img src="screenshots/game/game1.jpg" width="200" alt="game 1"/>
  <img src="screenshots/game/game2.jpg" width="200" alt="game 2"/>
  <img src="screenshots/game/game3.jpg" width="200" alt="game 3"/>
  <img src="screenshots/game/game4.jpg" width="200" alt="game 5"/>
  <img src="screenshots/game/game6.jpg" width="200" alt="game 6"/>
  <img src="screenshots/game/game7.jpg" width="200" alt="game 7"/>
  <img src="screenshots/game/game8.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game9.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game10.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game11.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game12.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game13.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game14.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game15.jpg" width="200" alt="game 8"/>
  <img src="screenshots/game/game16.jpg" width="200" alt="game 8"/>
</div>

### 🩺 Doctor Experience
Doctors access a specialized dashboard where cases are automatically prioritized and color-coded by severity: High (🔴), Medium (🟠), and Low (🟢). Each case provides complete access to child profiles, parent information, chatbot screening responses, and behavioral videos. Doctors can either request additional customized tests with specific instructions or provide a final diagnosis. The diagnostic interface allows doctors to write detailed conclusions, medical notes, and recommendations, which are automatically formatted into professional PDF reports and delivered to parents with instant notifications.

<div align="center">
  <img src="screenshots/doctor/dashboard.jpg" width="200" alt="Doctor Dashboard"/>
  <img src="screenshots/doctor/cas-0.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-1.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-2.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-3.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-4.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-5.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-6.jpg" width="200" alt="Case Details"/>
  <img src="screenshots/doctor/cas-7.jpg" width="200" alt="Case Details"/>
  <img src="screenshots//doctor/notification.jpg" width="200" alt="Notification"/>
</div>

### ⚙️ Additional Features

<div align="center">
  <img src="screenshots/notifications.jpg" width="200" alt="Notifications"/>
  <img src="screenshots/settings.jpg" width="200" alt="Settings"/>
</div>

The application includes a comprehensive notification system that alerts users in real-time about case updates, doctor responses, and test requests. Settings allow users to customize their experience with dark/light mode toggle, language selection (English, French, Arabic).
</div>

The application includes a comprehensive notification system that alerts users in real-time about case updates, doctor responses, and test requests. Settings allow users to customize their experience with dark/light mode toggle, language selection (English, French, Arabic) and profile management. An educational section provides valuable information about ADHD, helping parents better understand the condition and available support resources.

---

## 📁 Project Structure


mind-bloom/
├── frontend/                 # Flutter mobile app
│   ├── lib/
│   │   ├── constants/       # Constants and configuration
│   │   ├── models/          # Data models
│   │   ├── providers/       # State management
│   │   ├── screens/         # Application screens
│   │   ├── services/        # API services
│   │   ├── widgets/         # Reusable components
│   │   ├── games/           # 4 concentration games
│   │   ├── i18n/            # Translation files
│   │   └── main.dart        # Entry point
│   ├── assets/
│   │   ├── images/          # Images and logo
│   │   └── translations/    # Language files
│   └── pubspec.yaml
│
├── backend/                 # Node.js API
│   ├── models/              # MongoDB models
│   ├── routes/              # API routes
│   ├── controllers/         # Business logic
│   ├── middleware/          # Auth & validation
│   ├── config/              # Configuration
│   ├── services/            # Services (Groq API)
│   ├── uploads/             # Video storage
│   └── server.js            # Express server
│
├── screenshots/             # Application screenshots
└── README.md                # Documentation


---

## 🚀 Installation

### Prerequisites

- Node.js 22.x or higher
- Flutter 3.35 or higher
- MongoDB 8.2 or higher
- Groq API account (for AI chatbot)

### Backend Setup


bash
git clone https://github.com/yourusername/mind-bloom.git
cd mind-bloom/backend
npm install
cp .env.example .env


Edit .env:


env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/mindbloom
JWT_SECRET=your_super_secret_jwt_key
NODE_ENV=development
GROQ_API_KEY=your_groq_api_key_here


Run server:


bash
npm run dev


### Frontend Setup


bash
cd mind-bloom/frontend
flutter pub get


Configure API endpoint in lib/constants/app_constants.dart:


dart
static const String baseUrl = 'http://localhost:5000/api';


Run app:


bash
flutter devices
flutter run


---

## 🌍 Multi-language Support

The application supports 3 languages:

* 🇬🇧 **English**
* 🇫🇷 **French**
* 🇹🇳 **Tunisian Arabic**

---

<div align="center">
  <strong>Made with ❤️ for children and families</strong>
  <br>
  <sub>Mind Bloom © 2025 - All rights reserved</sub>
</div>