# 🧠 Mind Bloom

**ADHD (Attention Deficit Hyperactivity Disorder) Diagnostic & Care App**

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

## 📖 About the Application

**Mind Bloom** is a comprehensive mobile application designed to facilitate early detection, diagnosis, and monitoring of ADHD in children. The platform bridges the gap between concerned parents and certified healthcare professionals, providing a seamless digital environment for ADHD assessment and care.

It connects parents with healthcare professionals, enabling:

* 🎥 **Behavioral analysis** through video submissions - Observe real-world child behavior
* 🩺 **Medical assessments** by certified doctors - Professional evaluation and diagnosis
* 💬 **Real-time communication** - Instant notifications and updates
* 📄 **Diagnostic reports** in PDF format - Comprehensive, downloadable medical reports
* 📊 **Continuous monitoring** and follow-up - Track progress over time

### 🎯 Objectives

* 🧠 **Early detection** via guided questionnaires - Identify potential ADHD symptoms early
* 🎥 **Behavioral observation** through video - Capture authentic behavioral patterns
* 🩺 **Professional diagnosis** by certified doctors - Ensure accurate medical evaluation
* 📊 **Case tracking** and report generation - Maintain comprehensive medical records
* 🌍 **Multi-language support** (EN / FR / AR) - Accessible to diverse communities
* 🎮 **Educational games** for concentration improvement - Therapeutic gaming activities
* 🌓 **Dark/Light mode** for visual comfort - Customizable user interface

---

## ✨ Key Features

### 👨‍👩‍👧 For Parents

* ✅ **Account creation and child profile management** - Securely store multiple child profiles
* 🤖 **AI-powered chatbot with guided screening** - Interactive ADHD assessment via Groq API
* 📊 **Automatic severity scoring** - Cases prioritized based on symptom severity (High 🔴 / Medium 🟠 / Low 🟢)
* 🎥 **Upload behavioral observation videos** - Share real-world behavioral footage with doctors
* 📤 **Submit cases to doctors** - Send complete assessment packages for professional review
* 🔔 **Receive additional test requests** - Get notified when doctors need more information
* 📋 **Receive final diagnosis with downloadable PDF** - Access comprehensive diagnostic reports
* 💬 **ADHD assistant chatbot via Groq API** - Get instant answers to ADHD-related questions
* 🌍 **Multi-language interface** (EN / FR / AR) - Switch between English, French, and Arabic seamlessly

### 🩺 For Doctors

* 🔐 **Secure login and personalized dashboard** - Protected access to patient information
* 📊 **Cases automatically sorted by severity** (High 🔴 / Medium 🟠 / Low 🟢) - Prioritize urgent cases
* 📁 **Access full case details** - View complete patient history, chatbot responses, and parent information
* 🎥 **Watch submitted videos** - Analyze behavioral patterns through video observations
* 📝 **Request customized additional tests** - Ask for specific assessments or information
* ✍️ **Write diagnoses and recommendations** - Create detailed medical evaluations
* 📤 **Send final conclusions to parents** - Deliver professional diagnostic reports with treatment recommendations

### 🎮 Concentration Games (4 Educational Games)

Mind Bloom includes four specially designed therapeutic games to help children with ADHD improve their attention span, focus, and cognitive skills:

**Game Features:**
* 🧩 **Memory Match Game** - Enhances visual memory and pattern recognition
* 🎯 **Focus Challenge** - Improves sustained attention and reaction time
* 📈 **Progress tracking** - Monitor improvement over time
* 🏆 **Motivating reward system** - Earn achievements and badges
* 🎮 **Age-appropriate difficulty levels** - Adaptive challenges for different skill levels
* 🌈 **Colorful, engaging interface** - Child-friendly design with smooth animations

### 🛠️ Technical Features

* 🔒 **JWT authentication with secure tokens** - Industry-standard security protocols
* 🔑 **Password hashing with Bcrypt** - Encrypted credential storage
* ✅ **Server-side input validation** - Comprehensive data validation and sanitization
* 🛡️ **CORS protection configured** - Secure cross-origin resource sharing
* 🌓 **Dark/Light mode support** - Reduces eye strain and improves accessibility
* 🔔 **Real-time notifications** - Instant updates on case status changes
* ☁️ **Cloud storage for videos** - Reliable video upload and streaming
* 🎨 **Modern UI/UX** (violet & white theme) - Professional, calming design aesthetic
* ✨ **Smooth animations** - Polished transitions and interactions
* 📱 **Responsive across all devices** - Optimized for phones and tablets

---

## 🎨 Application Design

### Color Theme

The application uses a carefully selected color palette designed to be calming and professional:

* **Primary:** Violet (#7B2CBF) - Represents wisdom, creativity, and mental wellness
* **Secondary:** White (#FFFFFF) - Provides clarity and cleanliness
* **Accent:** Light Purple - For highlights and interactive elements
* **Text:** Dark Violet / Black - Ensures optimal readability
* **Status Colors:**
  * 🔴 High Severity: Red
  * 🟠 Medium Severity: Orange
  * 🟢 Low Severity: Green

---

## 📱 Application Screens & Functionality

### 🌟 Getting Started

<div align="center">
  <img src="screenshots/welcome/splash_screen.jpg" width="200" alt="Splash Screen"/>
  <img src="screenshots/welcome/about1.jpg" width="200" alt="About Screen"/>
  <img src="screenshots/welcome/about2.jpg" width="200" alt="About2 Screen"/>
  <img src="screenshots/welcome/about3.jpg" width="200" alt="About3 Screen"/>
</div>

The app begins with an animated splash screen featuring the Mind Bloom logo with a smooth fade-in effect, transitioning to educational carousel screens that introduce ADHD information and app features. These onboarding screens provide:

* **ADHD Overview** - Basic information about Attention Deficit Hyperactivity Disorder
* **App Features** - How Mind Bloom can help families
* **Getting Started** - Quick guide to using the application

An educational section provides valuable information about ADHD symptoms, diagnosis criteria, and treatment options, helping parents better understand the condition and available support resources.

### 🔐 Authentication Flow

<div align="center">
  <img src="screenshots/auth/welcome_screen.jpg" width="200" alt="Welcome Screen"/>
  <img src="screenshots/auth/login_screen.jpg" width="200" alt="Login Screen"/>
  <img src="screenshots/auth/login_v_screen.jpg" width="200" alt="Login Validation Screen"/>  
  <img src="screenshots/auth/login.jpg" width="200" alt="Login Form"/>  
  <img src="screenshots/auth/role_screen.jpg" width="200" alt="Role Selection Screen"/>  
  <img src="screenshots/auth/register_doctor.jpg" width="200" alt="Doctor Registration"/>
  <img src="screenshots/auth/register_parent.jpg" width="200" alt="Parent Registration"/>
</div>

**Authentication Process:**

1. **Welcome Screen** - Users choose to login or create a new account
2. **Role Selection** - Select between Parent or Doctor account type
3. **Registration Forms:**
   * **Parent Registration** - Collects name, email, phone number, and password
   * **Doctor Registration** - Requires medical credentials, specialization, license number, and verification documents
4. **Login Interface** - Automatically detects user type based on credentials
5. **Security Features:**
   * JWT token-based authentication
   * Encrypted password storage with Bcrypt
   * Session management
   * Secure password reset functionality

All authentication is secured with industry-standard encryption and validation to protect sensitive medical information.

### 👨‍👩‍👧 Parent Experience

<div align="center">
  <img src="screenshots/parent/parent_home.jpg" width="200" alt="Parent Home"/>
  <img src="screenshots/parent/add-kids.jpg" width="200" alt="Child Information"/>
  <img src="screenshots/parent/add-kids1.jpg" width="200" alt="Child Information Form"/>
  <img src="screenshots/parent/details-case.jpg" width="200" alt="Case Overview"/>
  <img src="screenshots/parent/details-case1.jpg" width="200" alt="Case Details 1"/>
  <img src="screenshots/parent/details-case2.jpg" width="200" alt="Case Details 2"/>
  <img src="screenshots/parent/details-case3.jpg" width="200" alt="Case Details 3"/>
  <img src="screenshots/parent/details-case4.jpg" width="200" alt="Case Details 4"/>
  <img src="screenshots/parent/details-case5.jpg" width="200" alt="Case Details 5"/>
  <img src="screenshots/parent/modifier-case.jpg" width="200" alt="Edit Case"/>
</div>

**Parent Dashboard Features:**

* **Case Management** - View all submitted cases with color-coded severity indicators
* **Status Tracking** - Real-time updates on case progress (Pending, In Review, Additional Tests Requested, Diagnosed)
* **Child Profiles** - Manage multiple children with individual medical histories

**Creating a New Assessment:**

1. **Child Information Entry:**
   * Full name
   * Date of birth / Age
   * Gender
   * School grade level
   * Medical history notes

2. **AI Chatbot Screening** - Interactive questionnaire covering:
   * Attention and focus patterns
   * Hyperactivity indicators
   * Impulsivity behaviors
   * Social interactions
   * Academic performance
   * Sleep patterns and routines

3. **Automatic Severity Calculation:**
   * **High (🔴)** - Severe symptoms requiring immediate attention
   * **Medium (🟠)** - Moderate symptoms needing professional evaluation
   * **Low (🟢)** - Mild symptoms for routine assessment

4. **Video Upload** - Record and submit behavioral observation videos (supports multiple formats, up to 100MB)

5. **Case Submission** - Send complete assessment package to doctors for review

**Ongoing Case Management:**

* **Receive Notifications** - Alerts for doctor responses, test requests, and diagnoses
* **View Diagnosis** - Access final medical evaluation with recommendations
* **Download PDF Reports** - Save comprehensive diagnostic documents for medical records
* **Edit Cases** - Update information before doctor review

#### 🤖 Chatbot Screening

Intelligent chatbot powered by Groq API, conducts a comprehensive ADHD through natural conversation.

<div align="center">
  <img src="screenshots/chatbot/chatbot0.jpg" width="200" alt="Chatbot Welcome"/>
  <img src="screenshots/chatbot/chatbot1.jpg" width="200" alt="Chatbot Question 1"/>
  <img src="screenshots/chatbot/chatbot2.jpg" width="200" alt="Chatbot Question 2"/>
  <img src="screenshots/chatbot/chatbot3.jpg" width="200" alt="Chatbot Question 3"/>
  <img src="screenshots/chatbot/chatbot4.jpg" width="200" alt="Chatbot Question 5"/>
  <img src="screenshots/chatbot/chatbot6.jpg" width="200" alt="Chatbot Question 6"/>
  <img src="screenshots/chatbot/chatbot7.jpg" width="200" alt="Chatbot Question 7"/>
  <img src="screenshots/chatbot/chatbot8.jpg" width="200" alt="Chatbot Summary"/>
</div>


### 🎮 Concentration Games

Mind Bloom includes four games to help children with ADHD develop crucial cognitive skills:
<div align="center">
  <img src="screenshots/game/game1.jpg" width="200" alt="Game Menu"/>
  <img src="screenshots/game/game2.jpg" width="200" alt="Memory Game"/>
  <img src="screenshots/game/game3.jpg" width="200" alt="Focus Challenge"/>
  <img src="screenshots/game/game4.jpg" width="200" alt="Number Sequence"/>
  <img src="screenshots/game/game6.jpg" width="200" alt="Color Sort"/>
  <img src="screenshots/game/game7.jpg" width="200" alt="Game Progress"/>
  <img src="screenshots/game/game8.jpg" width="200" alt="Achievement Screen"/>
  <img src="screenshots/game/game9.jpg" width="200" alt="Level Complete"/>
  <img src="screenshots/game/game10.jpg" width="200" alt="High Scores"/>
  <img src="screenshots/game/game11.jpg" width="200" alt="Reward System"/>
  <img src="screenshots/game/game12.jpg" width="200" alt="Game Settings"/>
  <img src="screenshots/game/game13.jpg" width="200" alt="Instructions"/>
  <img src="screenshots/game/game14.jpg" width="200" alt="Gameplay 1"/>
  <img src="screenshots/game/game15.jpg" width="200" alt="Gameplay 2"/>
  <img src="screenshots/game/game16.jpg" width="200" alt="Victory Screen"/>
</div>

**Game Benefits:**
* 📈 **Progress Tracking** - Monitor skill improvement over time
* 🏆 **Achievement System** - Unlock badges and rewards
* 📊 **Performance Statistics** - View detailed gameplay analytics
* 🎯 **Adaptive Difficulty** - Games adjust to child's skill level
* ⏱️ **Session Management** - Recommended play durations to prevent overstimulation

### 🩺 Doctor Experience

<div align="center">
  <img src="screenshots/doctor/dashboard.jpg" width="200" alt="Doctor Dashboard"/>
  <img src="screenshots/doctor/cas-0.jpg" width="200" alt="Case List"/>
  <img src="screenshots/doctor/cas-1.jpg" width="200" alt="Case Details Overview"/>
  <img src="screenshots/doctor/cas-2.jpg" width="200" alt="Patient Information"/>
  <img src="screenshots/doctor/cas-3.jpg" width="200" alt="Chatbot Responses"/>
  <img src="screenshots/doctor/cas-4.jpg" width="200" alt="Video Review"/>
  <img src="screenshots/doctor/cas-5.jpg" width="200" alt="Additional Tests"/>
  <img src="screenshots/doctor/cas-6.jpg" width="200" alt="Diagnosis Form"/>
  <img src="screenshots/doctor/cas-7.jpg" width="200" alt="Final Report"/>
  <img src="screenshots/doctor/notification.jpg" width="200" alt="Doctor Notifications"/>
</div>

**Doctor Dashboard Features:**

* **Prioritized Case Queue** - Cases automatically sorted by severity:
  * 🔴 **High Priority** - Severe cases requiring immediate attention
  * 🟠 **Medium Priority** - Moderate cases for timely review
  * 🟢 **Low Priority** - Routine assessments

* **Comprehensive Case View:**
  * Complete child profile and medical history
  * Parent contact information
  * Full chatbot questionnaire responses
  * Behavioral observation videos with playback controls
  * Previous medical records (if available)
  * Timeline of case activities

**Doctor Actions:**

1. **Request Additional Tests:**
   * Specify required assessments or information
   * Provide clear instructions to parents
   * Set deadlines for submissions
   * Track test completion status

2. **Provide Diagnosis:**
   * **Diagnostic Conclusion** - ADHD type classification (Predominantly Inattentive, Predominantly Hyperactive-Impulsive, Combined Type)
   * **Severity Assessment** - Mild, Moderate, or Severe
   * **Medical Notes** - Detailed clinical observations
   * **Recommendations** - Treatment options, therapy suggestions, medication if appropriate
   * **Follow-up Plan** - Monitoring schedule and next steps
   * **Lifestyle Advice** - Educational, dietary, and behavioral recommendations

3. **Generate Reports:**
   * Automatically formatted PDF diagnostic reports
   * Professional medical document formatting
   * Includes all relevant case information
   * Digitally signed by doctor
   * Instantly delivered to parent with notification

**Notification System:**
* New case assignments
* Parent responses to test requests
* Case updates and changes
* Urgent priority cases

### ⚙️ Additional Features

<div align="center">
  <img src="screenshots/settings.jpg" width="200" alt="Settings Menu"/>
</div>

**Settings & Customization:**

* **Appearance:**
  * 🌓 **Dark/Light Mode Toggle** - Reduce eye strain with dark theme

* **Language Selection:**
  * 🇬🇧 **English** - Full interface translation
  * 🇫🇷 **French** - Complete French localization
  * 🇹🇳 **Arabic** - Right-to-left Arabic support

---

## 📁 Project Structure

```
mind-bloom/
├── frontend/                 # Flutter mobile app
│   ├── lib/
│   │   ├── constants/       # App-wide constants and configuration
│   │   ├── models/          # Data models (User, Case, Child, etc.)
│   │   ├── providers/       # State management with Provider
│   │   ├── screens/         # All application screens
│   │   │   ├── auth/        # Authentication screens
│   │   │   ├── parent/      # Parent-specific screens
│   │   │   ├── doctor/      # Doctor-specific screens
│   │   │   ├── chatbot/     # AI chatbot interface
│   │   │   └── settings/    # Settings and preferences
│   │   ├── services/        # API communication services
│   │   ├── widgets/         # Reusable UI components
│   │   ├── games/           # 4 concentration games
│   │   ├── i18n/            # Internationalization files
│   │   └── main.dart        # Application entry point
│   ├── assets/
│   │   ├── images/          # Images, icons, and logo
│   │   ├── animations/      # Lottie animations
│   │   └── translations/    # JSON language files (en, fr, ar)
│   └── pubspec.yaml         # Flutter dependencies
│
├── backend/                 # Node.js/Express API server
│   ├── models/              # MongoDB/Mongoose models
│   │   ├── User.js          # User model (Parent/Doctor)
│   │   ├── Child.js         # Child profile model
│   │   ├── Case.js          # Case/assessment model
│   │   └── Notification.js  # Notification model
│   ├── routes/              # Express API routes
│   │   ├── auth.js          # Authentication routes
│   │   ├── cases.js         # Case management routes
│   │   ├── users.js         # User profile routes
│   │   └── notifications.js # Notification routes
│   ├── controllers/         # Business logic controllers
│   ├── middleware/          # Authentication & validation middleware
│   │   ├── auth.js          # JWT verification
│   │   └── validation.js    # Input validation
│   ├── config/              # Configuration files
│   │   ├── database.js      # MongoDB connection
│   │   └── jwt.js           # JWT configuration
│   ├── services/            # External service integrations
│   │   ├── groqService.js   # Groq AI API integration
│   │   └── pdfService.js    # PDF report generation
│   ├── uploads/             # Video and file storage
│   ├── utils/               # Utility functions
│   └── server.js            # Express server entry point
│
├── screenshots/             # Application screenshots for documentation
│   ├── welcome/            # Onboarding screens
│   ├── auth/               # Authentication screens
│   ├── parent/             # Parent interface screenshots
│   ├── doctor/             # Doctor interface screenshots
│   ├── chatbot/            # Chatbot conversation screenshots
│   ├── game/               # Game screenshots
│   └── notifications.jpg   # Notification examples
│
└── README.md               # Project documentation
```

---

## 🚀 Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** 22.x or higher - [Download](https://nodejs.org/)
- **Flutter** 3.35 or higher - [Installation Guide](https://flutter.dev/docs/get-started/install)
- **MongoDB** 8.2 or higher - [Download](https://www.mongodb.com/try/download/community)
- **Groq API** account - [Sign up](https://console.groq.com/) for AI chatbot functionality
- **Android Studio** or **Xcode** - For mobile app development
- **Git** - For version control

### Backend Setup

1. **Clone the repository:**

```bash
git clone https://github.com/yourusername/mind-bloom.git
cd mind-bloom/backend
```

2. **Install dependencies:**

```bash
npm install
```

3. **Edit the `.env` file with your configuration:**

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/mindbloom

# Authentication
JWT_SECRET=your_super_secret_jwt_key_here_min_32_characters
JWT_EXPIRE=7d

# Groq AI API (for chatbot)
GROQ_API_KEY=your_groq_api_key_here
```

4. **Run the backend server:**

```bash
# Development mode with auto-reload
npm run dev

# Production mode
npm start
```

The backend API will be running at `http://localhost:5000`

### Frontend Setup

1. **Navigate to frontend directory:**

```bash
cd mind-bloom/frontend
```

2. **Install Flutter dependencies:**

```bash
flutter pub get
```

3. **Check available devices:**

```bash
flutter devices
```

4. **Run the application:**

```bash
# Run on default device
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in release mode for better performance
flutter run --release
```
---

## 🌍 Multi-language Support

The application supports 3 languages with complete interface translation:

* 🇹🇳 **Tunisian Arabic** Default language
* 🇬🇧 **English**
* 🇫🇷 **French**

**Language Switching:**
Users can change the application language anytime through Settings → Language → Select preferred language. The interface updates instantly without requiring app restart.

---

## 🔒 Security Features

* **JWT Authentication** - Secure token-based authentication
* **Password Encryption** - Bcrypt hashing with salt rounds
* **Input Validation** - Server-side validation of all inputs
* **SQL Injection Prevention** - Parameterized queries with Mongoose
* **Secure File Upload** - File type and size validation

---

## 🙏 Acknowledgments

* **Groq AI** - For powerful AI chatbot capabilities
* **Flutter Team** - For the excellent cross-platform framework
* **MongoDB** - For reliable database solutions
* **Medical Consultants** - For ADHD assessment guidance

---

<div align="center">
  <strong>Made with ❤️ for children and families</strong>
  <br>
  <sub>Mind Bloom © 2025 - All rights reserved</sub>
  <br><br>
  <em>"Empowering families through early detection and expert care"</em>
</div>