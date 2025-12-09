// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(age) => "${age} years old";

  static String m1(count) => "${count}d ago";

  static String m2(count) => "${count}h ago";

  static String m3(count) => "${count}min ago";

  static String m4(age) => "${age} years";

  static String m5(childName) =>
      "Do you really want to delete ${childName}\'s case?";

  static String m6(error) => "Error: ${error}";

  static String m7(error) => "Error: ${error}";

  static String m8(error) => "Error loading case: ${error}";

  static String m9(error) => "Error downloading report: ${error}";

  static String m10(errorMessage) => "Error during recording: ${errorMessage}";

  static String m11(errorMessage) => "Error during selection: ${errorMessage}";

  static String m12(level) => "SEVERITY ${level}";

  static String m13(childName) =>
      "Hello! I will ask you some questions about ${childName}\'s behavior. Please answer honestly to help us provide the best assessment.";

  static String m14(current, total) => "Question ${current}/${total}";

  static String m15(count) => "${count} unread";

  static String m16(childName) =>
      "Great! Now please upload a short video (max 5 minutes) of ${childName} doing an activity such as homework, playing, or drawing. This will help the doctor better understand the behavior.";

  static String m17(name) => "Welcome, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutADHD": MessageLookupByLibrary.simpleMessage("About ADHD"),
    "additional_test_coming_soon": MessageLookupByLibrary.simpleMessage(
      "Feature coming soon",
    ),
    "additional_test_instructions": MessageLookupByLibrary.simpleMessage(
      "Instructions:",
    ),
    "additional_test_response": MessageLookupByLibrary.simpleMessage(
      "Additional Test Response",
    ),
    "additional_test_submit": MessageLookupByLibrary.simpleMessage(
      "Submit Response",
    ),
    "additional_test_title": MessageLookupByLibrary.simpleMessage(
      "Additional Test",
    ),
    "additional_test_type": MessageLookupByLibrary.simpleMessage("Test Type"),
    "adhdAboutTitle": MessageLookupByLibrary.simpleMessage("About ADHD"),
    "adhdActiveBreaks": MessageLookupByLibrary.simpleMessage(
      "Encourage regular active breaks",
    ),
    "adhdBrainChemistry": MessageLookupByLibrary.simpleMessage(
      "Chemical imbalance in the brain",
    ),
    "adhdCausesDescription": MessageLookupByLibrary.simpleMessage(
      "Factors that may contribute to ADHD development",
    ),
    "adhdCausesTitle": MessageLookupByLibrary.simpleMessage("Possible Causes"),
    "adhdChatbotGreeting": MessageLookupByLibrary.simpleMessage(
      "Hello! I am your ADHD expert assistant. Ask me your questions about Attention Deficit Hyperactivity Disorder. How can I help you today?",
    ),
    "adhdChatbotTitle": MessageLookupByLibrary.simpleMessage(
      "Smart ADHD Assistant",
    ),
    "adhdErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Sorry, an error occurred. Please try again.",
    ),
    "adhdGenetics": MessageLookupByLibrary.simpleMessage(
      "Genetic and hereditary factors",
    ),
    "adhdHyperactivity": MessageLookupByLibrary.simpleMessage(
      "Hyperactivity: restlessness, inability to stay seated",
    ),
    "adhdImpulsivity": MessageLookupByLibrary.simpleMessage(
      "Impulsivity: interrupting, acting without thinking",
    ),
    "adhdInattention": MessageLookupByLibrary.simpleMessage(
      "Inattention: difficulty focusing, frequent forgetfulness",
    ),
    "adhdParentsDescription": MessageLookupByLibrary.simpleMessage(
      "How to support a child with ADHD daily",
    ),
    "adhdParentsTitle": MessageLookupByLibrary.simpleMessage(
      "Tips for Parents",
    ),
    "adhdPregnancyComplications": MessageLookupByLibrary.simpleMessage(
      "Pregnancy complications",
    ),
    "adhdPrenatalExposure": MessageLookupByLibrary.simpleMessage(
      "Prenatal exposure to substances",
    ),
    "adhdRewardSystem": MessageLookupByLibrary.simpleMessage(
      "Reward positive behavior",
    ),
    "adhdRoutine": MessageLookupByLibrary.simpleMessage(
      "Create a stable daily routine",
    ),
    "adhdSchoolCooperation": MessageLookupByLibrary.simpleMessage(
      "Collaborate with school and specialists",
    ),
    "adhdSchoolProblems": MessageLookupByLibrary.simpleMessage(
      "School and social challenges",
    ),
    "adhdSendHint": MessageLookupByLibrary.simpleMessage(
      "Ask your question about ADHD...",
    ),
    "adhdSuggestedQuestion_1": MessageLookupByLibrary.simpleMessage(
      "What are the symptoms of ADHD?",
    ),
    "adhdSuggestedQuestion_2": MessageLookupByLibrary.simpleMessage(
      "How is ADHD diagnosed?",
    ),
    "adhdSuggestedQuestion_3": MessageLookupByLibrary.simpleMessage(
      "What treatments are available?",
    ),
    "adhdSuggestedQuestion_4": MessageLookupByLibrary.simpleMessage(
      "Is ADHD hereditary?",
    ),
    "adhdSuggestedQuestionsTitle": MessageLookupByLibrary.simpleMessage(
      "Suggested questions:",
    ),
    "adhdSymptomsDescription": MessageLookupByLibrary.simpleMessage(
      "Signs that may indicate ADHD in a child",
    ),
    "adhdSymptomsTitle": MessageLookupByLibrary.simpleMessage("ADHD Symptoms"),
    "adjustPreferences": MessageLookupByLibrary.simpleMessage(
      "Adjust your preferences",
    ),
    "advice": MessageLookupByLibrary.simpleMessage("Advice"),
    "age": m0,
    "ageRange": MessageLookupByLibrary.simpleMessage(
      "Age must be between 3 and 18",
    ),
    "agoDays": m1,
    "agoHours": m2,
    "agoMinutes": m3,
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Mind Bloom"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "behavior_info": MessageLookupByLibrary.simpleMessage(
      "Next, you will answer a series of questions about your child\'s behavior.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "caseDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Case deleted successfully",
    ),
    "caseDetails_title": MessageLookupByLibrary.simpleMessage("Case Details"),
    "caseUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Case updated successfully",
    ),
    "case_not_found": MessageLookupByLibrary.simpleMessage("Case Not Found"),
    "case_review_info": MessageLookupByLibrary.simpleMessage(
      "Your case will be reviewed by a doctor who will provide a diagnosis.",
    ),
    "case_submitted": MessageLookupByLibrary.simpleMessage(
      "Case submitted successfully!",
    ),
    "casesSortedBySeverity": MessageLookupByLibrary.simpleMessage(
      "Cases Sorted by Severity",
    ),
    "child_age": MessageLookupByLibrary.simpleMessage("Age"),
    "child_age_years": m4,
    "child_class": MessageLookupByLibrary.simpleMessage("Class"),
    "child_gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "child_gender_female": MessageLookupByLibrary.simpleMessage("Girl"),
    "child_gender_male": MessageLookupByLibrary.simpleMessage("Boy"),
    "child_info_description": MessageLookupByLibrary.simpleMessage(
      "Please provide accurate information to help us better understand your child.",
    ),
    "child_info_header": MessageLookupByLibrary.simpleMessage(
      "Tell us about your child",
    ),
    "child_info_title": MessageLookupByLibrary.simpleMessage(
      "Child Information",
    ),
    "child_name": MessageLookupByLibrary.simpleMessage("Name"),
    "child_profile": MessageLookupByLibrary.simpleMessage("Child Profile"),
    "chooseAccountType": MessageLookupByLibrary.simpleMessage(
      "Select the account type you want to create",
    ),
    "chooseProfile": MessageLookupByLibrary.simpleMessage(
      "Choose your profile",
    ),
    "confirmDeleteCase": m5,
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("Confirm Deletion"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "continue_screening": MessageLookupByLibrary.simpleMessage(
      "Continue Screening",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "diagnosis_advice": MessageLookupByLibrary.simpleMessage("Advice"),
    "diagnosis_concluded": MessageLookupByLibrary.simpleMessage(
      "Conclude Diagnosis",
    ),
    "diagnosis_date": MessageLookupByLibrary.simpleMessage("Date"),
    "diagnosis_doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
    "diagnosis_recommendation": MessageLookupByLibrary.simpleMessage(
      "Recommendation",
    ),
    "diagnosis_submitted": MessageLookupByLibrary.simpleMessage(
      "Diagnosis Submitted Successfully",
    ),
    "diagnosis_summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "diagnosis_title": MessageLookupByLibrary.simpleMessage("Diagnosis"),
    "disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
    "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
    "doctorRegistration": MessageLookupByLibrary.simpleMessage(
      "Doctor Registration",
    ),
    "doctorSubtitle": MessageLookupByLibrary.simpleMessage(
      "Healthcare professional",
    ),
    "doctor_case_details": MessageLookupByLibrary.simpleMessage("Case Details"),
    "download_report": MessageLookupByLibrary.simpleMessage("Download Report"),
    "download_report_error": MessageLookupByLibrary.simpleMessage(
      "Error downloading report",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editCase": MessageLookupByLibrary.simpleMessage("Edit Case"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "enabled": MessageLookupByLibrary.simpleMessage("Enabled"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterAge": MessageLookupByLibrary.simpleMessage("Enter the age"),
    "enterEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "enterFirstName": MessageLookupByLibrary.simpleMessage(
      "Enter the first name",
    ),
    "enterLastName": MessageLookupByLibrary.simpleMessage(
      "Enter the last name",
    ),
    "enterSchoolYear": MessageLookupByLibrary.simpleMessage(
      "e.g., CP, CE1, 6th grade",
    ),
    "error": m6,
    "errorMessage": m7,
    "error_api_case": m8,
    "error_api_report": m9,
    "error_loading_case": MessageLookupByLibrary.simpleMessage(
      "Failed to load",
    ),
    "error_recording": m10,
    "error_selection": m11,
    "father": MessageLookupByLibrary.simpleMessage("Father"),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "firstNameTooShort": MessageLookupByLibrary.simpleMessage(
      "First name must be at least 2 characters",
    ),
    "french": MessageLookupByLibrary.simpleMessage("French"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "goToHomeScreen": MessageLookupByLibrary.simpleMessage("Go to home"),
    "gravity": m12,
    "greeting": m13,
    "high": MessageLookupByLibrary.simpleMessage("High"),
    "highPriority": MessageLookupByLibrary.simpleMessage("High Priority"),
    "instructions": MessageLookupByLibrary.simpleMessage("Instructions"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
    "invalidNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number",
    ),
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lastNameTooShort": MessageLookupByLibrary.simpleMessage(
      "Last name must be at least 2 characters",
    ),
    "level": MessageLookupByLibrary.simpleMessage("Level"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Log in"),
    "loginEmailEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "loginEmailHint": MessageLookupByLibrary.simpleMessage("your@email.com"),
    "loginEmailInvalid": MessageLookupByLibrary.simpleMessage("Invalid email"),
    "loginEmailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "loginFailed": MessageLookupByLibrary.simpleMessage("Login failed"),
    "loginForgotPassword": MessageLookupByLibrary.simpleMessage(
      "Forgot password?",
    ),
    "loginLink": MessageLookupByLibrary.simpleMessage("Login"),
    "loginOr": MessageLookupByLibrary.simpleMessage("OR"),
    "loginPasswordEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "loginPasswordHint": MessageLookupByLibrary.simpleMessage("••••••••"),
    "loginPasswordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "loginRegisterButton": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "loginWelcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "loginWelcomeDescription": MessageLookupByLibrary.simpleMessage(
      "Log in to continue",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "low": MessageLookupByLibrary.simpleMessage("Low"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "manageConsultations": MessageLookupByLibrary.simpleMessage(
      "Manage your consultations",
    ),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "medicalLicenseNumber": MessageLookupByLibrary.simpleMessage(
      "Medical License Number",
    ),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "mother": MessageLookupByLibrary.simpleMessage("Mother"),
    "myPreviousCases": MessageLookupByLibrary.simpleMessage(
      "My Previous Cases",
    ),
    "newCasesWillAppearHere": MessageLookupByLibrary.simpleMessage(
      "New Cases Will Appear Here",
    ),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noCasesAvailable": MessageLookupByLibrary.simpleMessage(
      "No Cases Available",
    ),
    "noCasesYet": MessageLookupByLibrary.simpleMessage("No cases yet"),
    "noNotifications": MessageLookupByLibrary.simpleMessage("No notifications"),
    "noUnreadNotifications": MessageLookupByLibrary.simpleMessage(
      "No unread notifications",
    ),
    "no_video_uploaded": MessageLookupByLibrary.simpleMessage(
      "No video uploaded",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "parent": MessageLookupByLibrary.simpleMessage("Parent"),
    "parentRegistration": MessageLookupByLibrary.simpleMessage(
      "Parent Registration",
    ),
    "parentSubtitle": MessageLookupByLibrary.simpleMessage(
      "Guardian or teacher",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "personalize": MessageLookupByLibrary.simpleMessage("Personalize"),
    "pleaseEnterAge": MessageLookupByLibrary.simpleMessage(
      "Please enter the age",
    ),
    "pleaseEnterFirstName": MessageLookupByLibrary.simpleMessage(
      "Please enter the first name",
    ),
    "pleaseEnterLastName": MessageLookupByLibrary.simpleMessage(
      "Please enter the last name",
    ),
    "pleaseEnterSchoolYear": MessageLookupByLibrary.simpleMessage(
      "Please enter the school year",
    ),
    "pleaseSelectDateOfBirth": MessageLookupByLibrary.simpleMessage(
      "Please select your date of birth",
    ),
    "question_1": MessageLookupByLibrary.simpleMessage(
      "Does your child have trouble focusing on tasks?",
    ),
    "question_2": MessageLookupByLibrary.simpleMessage(
      "Does he/she frequently lose things?",
    ),
    "question_3": MessageLookupByLibrary.simpleMessage(
      "Does he/she show hyperactivity or impulsivity?",
    ),
    "question_4": MessageLookupByLibrary.simpleMessage(
      "Does he/she often interrupt others?",
    ),
    "question_5": MessageLookupByLibrary.simpleMessage(
      "Are there any school performance issues?",
    ),
    "question_6": MessageLookupByLibrary.simpleMessage(
      "Is the behavior present in more than one environment (home and school)?",
    ),
    "question_number": m14,
    "read_video": MessageLookupByLibrary.simpleMessage("Play Video"),
    "recommendations": MessageLookupByLibrary.simpleMessage("Recommendations"),
    "record": MessageLookupByLibrary.simpleMessage("Record"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registrationFailed": MessageLookupByLibrary.simpleMessage(
      "Registration failed",
    ),
    "relationWithChild": MessageLookupByLibrary.simpleMessage(
      "Relation with Child",
    ),
    "request_test": MessageLookupByLibrary.simpleMessage("Request Test"),
    "request_test_button": MessageLookupByLibrary.simpleMessage("Request Test"),
    "requiredField": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "scholarYear": MessageLookupByLibrary.simpleMessage("School Year"),
    "screening_questionnaire_answers": MessageLookupByLibrary.simpleMessage(
      "Questionnaire Answers:",
    ),
    "screening_results_title": MessageLookupByLibrary.simpleMessage(
      "Screening Results",
    ),
    "screening_title": MessageLookupByLibrary.simpleMessage("ADHD Screening"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
    "select_video_error": MessageLookupByLibrary.simpleMessage(
      "Please upload a video before submitting",
    ),
    "send_test": MessageLookupByLibrary.simpleMessage(
      "Test request sent successfully!",
    ),
    "sending": MessageLookupByLibrary.simpleMessage("Sending..."),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "severity": MessageLookupByLibrary.simpleMessage("Case Severity"),
    "sexe": MessageLookupByLibrary.simpleMessage("Sex"),
    "showUnreadOnly": MessageLookupByLibrary.simpleMessage("Unread only"),
    "startNewCase": MessageLookupByLibrary.simpleMessage("Start New Case"),
    "statusAdditionalTestRequired": MessageLookupByLibrary.simpleMessage(
      "Additional Test Required",
    ),
    "statusCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "statusDiagnosisReady": MessageLookupByLibrary.simpleMessage(
      "Diagnosis Ready",
    ),
    "statusWaitingForDoctor": MessageLookupByLibrary.simpleMessage(
      "Waiting for Doctor",
    ),
    "statusWaitingForReply": MessageLookupByLibrary.simpleMessage(
      "Waiting for Reply",
    ),
    "status_title": MessageLookupByLibrary.simpleMessage("Case Status"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "submit_diagnosis": MessageLookupByLibrary.simpleMessage(
      "Submit Diagnosis",
    ),
    "submit_video": MessageLookupByLibrary.simpleMessage("Submit to doctor"),
    "summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "tdah_questionnaire": MessageLookupByLibrary.simpleMessage(
      "ADHD Questionnaire",
    ),
    "teacher": MessageLookupByLibrary.simpleMessage("Teacher"),
    "test_type": MessageLookupByLibrary.simpleMessage("Test Type"),
    "test_type_hint": MessageLookupByLibrary.simpleMessage(
      "e.g.: Concentration Test",
    ),
    "totalCases": MessageLookupByLibrary.simpleMessage("Total Cases"),
    "unreadCount": m15,
    "updateButton": MessageLookupByLibrary.simpleMessage("Save"),
    "updateChildInfo": MessageLookupByLibrary.simpleMessage(
      "Update Child Information",
    ),
    "updateChildInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Update the child\'s information",
    ),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "video_instructions": m16,
    "video_selected": MessageLookupByLibrary.simpleMessage("Video selected!"),
    "welcomeParent": m17,
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Helping You Understand Your Child Better",
    ),
    "years": MessageLookupByLibrary.simpleMessage("years"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "youAreUpToDate": MessageLookupByLibrary.simpleMessage(
      "You are up to date!",
    ),
  };
}
