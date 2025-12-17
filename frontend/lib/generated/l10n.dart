// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mind Bloom`
  String get appTitle {
    return Intl.message('Mind Bloom', name: 'appTitle', desc: '', args: []);
  }

  /// `Helping You Understand Your Child Better`
  String get welcomeSubtitle {
    return Intl.message(
      'Helping You Understand Your Child Better',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `About ADHD`
  String get adhdAboutTitle {
    return Intl.message(
      'About ADHD',
      name: 'adhdAboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `ADHD Symptoms`
  String get adhdSymptomsTitle {
    return Intl.message(
      'ADHD Symptoms',
      name: 'adhdSymptomsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Signs that may indicate ADHD in a child`
  String get adhdSymptomsDescription {
    return Intl.message(
      'Signs that may indicate ADHD in a child',
      name: 'adhdSymptomsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Possible Causes`
  String get adhdCausesTitle {
    return Intl.message(
      'Possible Causes',
      name: 'adhdCausesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Factors that may contribute to ADHD development`
  String get adhdCausesDescription {
    return Intl.message(
      'Factors that may contribute to ADHD development',
      name: 'adhdCausesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tips for Parents`
  String get adhdParentsTitle {
    return Intl.message(
      'Tips for Parents',
      name: 'adhdParentsTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to support a child with ADHD daily`
  String get adhdParentsDescription {
    return Intl.message(
      'How to support a child with ADHD daily',
      name: 'adhdParentsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Inattention: difficulty focusing, frequent forgetfulness`
  String get adhdInattention {
    return Intl.message(
      'Inattention: difficulty focusing, frequent forgetfulness',
      name: 'adhdInattention',
      desc: '',
      args: [],
    );
  }

  /// `Hyperactivity: restlessness, inability to stay seated`
  String get adhdHyperactivity {
    return Intl.message(
      'Hyperactivity: restlessness, inability to stay seated',
      name: 'adhdHyperactivity',
      desc: '',
      args: [],
    );
  }

  /// `Impulsivity: interrupting, acting without thinking`
  String get adhdImpulsivity {
    return Intl.message(
      'Impulsivity: interrupting, acting without thinking',
      name: 'adhdImpulsivity',
      desc: '',
      args: [],
    );
  }

  /// `School and social challenges`
  String get adhdSchoolProblems {
    return Intl.message(
      'School and social challenges',
      name: 'adhdSchoolProblems',
      desc: '',
      args: [],
    );
  }

  /// `Genetic and hereditary factors`
  String get adhdGenetics {
    return Intl.message(
      'Genetic and hereditary factors',
      name: 'adhdGenetics',
      desc: '',
      args: [],
    );
  }

  /// `Chemical imbalance in the brain`
  String get adhdBrainChemistry {
    return Intl.message(
      'Chemical imbalance in the brain',
      name: 'adhdBrainChemistry',
      desc: '',
      args: [],
    );
  }

  /// `Prenatal exposure to substances`
  String get adhdPrenatalExposure {
    return Intl.message(
      'Prenatal exposure to substances',
      name: 'adhdPrenatalExposure',
      desc: '',
      args: [],
    );
  }

  /// `Pregnancy complications`
  String get adhdPregnancyComplications {
    return Intl.message(
      'Pregnancy complications',
      name: 'adhdPregnancyComplications',
      desc: '',
      args: [],
    );
  }

  /// `Create a stable daily routine`
  String get adhdRoutine {
    return Intl.message(
      'Create a stable daily routine',
      name: 'adhdRoutine',
      desc: '',
      args: [],
    );
  }

  /// `Encourage regular active breaks`
  String get adhdActiveBreaks {
    return Intl.message(
      'Encourage regular active breaks',
      name: 'adhdActiveBreaks',
      desc: '',
      args: [],
    );
  }

  /// `Reward positive behavior`
  String get adhdRewardSystem {
    return Intl.message(
      'Reward positive behavior',
      name: 'adhdRewardSystem',
      desc: '',
      args: [],
    );
  }

  /// `Collaborate with school and specialists`
  String get adhdSchoolCooperation {
    return Intl.message(
      'Collaborate with school and specialists',
      name: 'adhdSchoolCooperation',
      desc: '',
      args: [],
    );
  }

  /// `Go to home`
  String get goToHomeScreen {
    return Intl.message(
      'Go to home',
      name: 'goToHomeScreen',
      desc: '',
      args: [],
    );
  }

  /// `About ADHD`
  String get aboutADHD {
    return Intl.message('About ADHD', name: 'aboutADHD', desc: '', args: []);
  }

  /// `Welcome`
  String get loginWelcome {
    return Intl.message('Welcome', name: 'loginWelcome', desc: '', args: []);
  }

  /// `Log in to continue`
  String get loginWelcomeDescription {
    return Intl.message(
      'Log in to continue',
      name: 'loginWelcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmailLabel {
    return Intl.message('Email', name: 'loginEmailLabel', desc: '', args: []);
  }

  /// `your@email.com`
  String get loginEmailHint {
    return Intl.message(
      'your@email.com',
      name: 'loginEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get loginEmailEmpty {
    return Intl.message(
      'Please enter your email',
      name: 'loginEmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get loginEmailInvalid {
    return Intl.message(
      'Invalid email',
      name: 'loginEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPasswordLabel {
    return Intl.message(
      'Password',
      name: 'loginPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `••••••••`
  String get loginPasswordHint {
    return Intl.message(
      '••••••••',
      name: 'loginPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get loginPasswordEmpty {
    return Intl.message(
      'Please enter your password',
      name: 'loginPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginButton {
    return Intl.message('Log in', name: 'loginButton', desc: '', args: []);
  }

  /// `OR`
  String get loginOr {
    return Intl.message('OR', name: 'loginOr', desc: '', args: []);
  }

  /// `Create an account`
  String get loginRegisterButton {
    return Intl.message(
      'Create an account',
      name: 'loginRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Choose your profile`
  String get chooseProfile {
    return Intl.message(
      'Choose your profile',
      name: 'chooseProfile',
      desc: '',
      args: [],
    );
  }

  /// `Select the account type you want to create`
  String get chooseAccountType {
    return Intl.message(
      'Select the account type you want to create',
      name: 'chooseAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message('Doctor', name: 'doctor', desc: '', args: []);
  }

  /// `Healthcare professional`
  String get doctorSubtitle {
    return Intl.message(
      'Healthcare professional',
      name: 'doctorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message('Parent', name: 'parent', desc: '', args: []);
  }

  /// `Guardian or teacher`
  String get parentSubtitle {
    return Intl.message(
      'Guardian or teacher',
      name: 'parentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Personalize`
  String get personalize {
    return Intl.message('Personalize', name: 'personalize', desc: '', args: []);
  }

  /// `Adjust your preferences`
  String get adjustPreferences {
    return Intl.message(
      'Adjust your preferences',
      name: 'adjustPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Enabled`
  String get enabled {
    return Intl.message('Enabled', name: 'enabled', desc: '', args: []);
  }

  /// `Disabled`
  String get disabled {
    return Intl.message('Disabled', name: 'disabled', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `French`
  String get french {
    return Intl.message('French', name: 'french', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login`
  String get loginLink {
    return Intl.message('Login', name: 'loginLink', desc: '', args: []);
  }

  /// `Relation with Child`
  String get relationWithChild {
    return Intl.message(
      'Relation with Child',
      name: 'relationWithChild',
      desc: '',
      args: [],
    );
  }

  /// `Mother`
  String get mother {
    return Intl.message('Mother', name: 'mother', desc: '', args: []);
  }

  /// `Father`
  String get father {
    return Intl.message('Father', name: 'father', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `Please select your date of birth`
  String get pleaseSelectDateOfBirth {
    return Intl.message(
      'Please select your date of birth',
      name: 'pleaseSelectDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Registration`
  String get doctorRegistration {
    return Intl.message(
      'Doctor Registration',
      name: 'doctorRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Parent Registration`
  String get parentRegistration {
    return Intl.message(
      'Parent Registration',
      name: 'parentRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Medical License Number`
  String get medicalLicenseNumber {
    return Intl.message(
      'Medical License Number',
      name: 'medicalLicenseNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message('Select Date', name: 'selectDate', desc: '', args: []);
  }

  /// `Please enter your email`
  String get enterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Sex`
  String get sexe {
    return Intl.message('Sex', name: 'sexe', desc: '', args: []);
  }

  /// `Registration failed`
  String get registrationFailed {
    return Intl.message(
      'Registration failed',
      name: 'registrationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {name}`
  String welcomeParent(Object name) {
    return Intl.message(
      'Welcome, $name',
      name: 'welcomeParent',
      desc: '',
      args: [name],
    );
  }

  /// `Start New Case`
  String get startNewCase {
    return Intl.message(
      'Start New Case',
      name: 'startNewCase',
      desc: '',
      args: [],
    );
  }

  /// `My Previous Cases`
  String get myPreviousCases {
    return Intl.message(
      'My Previous Cases',
      name: 'myPreviousCases',
      desc: '',
      args: [],
    );
  }

  /// `No cases yet`
  String get noCasesYet {
    return Intl.message('No cases yet', name: 'noCasesYet', desc: '', args: []);
  }

  /// `{age} years old`
  String age(Object age) {
    return Intl.message('$age years old', name: 'age', desc: '', args: [age]);
  }

  /// `Waiting for Doctor`
  String get statusWaitingForDoctor {
    return Intl.message(
      'Waiting for Doctor',
      name: 'statusWaitingForDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Additional Test Required`
  String get statusAdditionalTestRequired {
    return Intl.message(
      'Additional Test Required',
      name: 'statusAdditionalTestRequired',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for Reply`
  String get statusWaitingForReply {
    return Intl.message(
      'Waiting for Reply',
      name: 'statusWaitingForReply',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get statusCompleted {
    return Intl.message(
      'Completed',
      name: 'statusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis Ready`
  String get statusDiagnosisReady {
    return Intl.message(
      'Diagnosis Ready',
      name: 'statusDiagnosisReady',
      desc: '',
      args: [],
    );
  }

  /// `Case Details`
  String get caseDetails_title {
    return Intl.message(
      'Case Details',
      name: 'caseDetails_title',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Failed to load`
  String get error_loading_case {
    return Intl.message(
      'Failed to load',
      name: 'error_loading_case',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Case Status`
  String get status_title {
    return Intl.message(
      'Case Status',
      name: 'status_title',
      desc: '',
      args: [],
    );
  }

  /// `Child Information`
  String get child_info_title {
    return Intl.message(
      'Child Information',
      name: 'child_info_title',
      desc: '',
      args: [],
    );
  }

  /// `{age} years`
  String child_age_years(Object age) {
    return Intl.message(
      '$age years',
      name: 'child_age_years',
      desc: '',
      args: [age],
    );
  }

  /// `Gender`
  String get child_gender {
    return Intl.message('Gender', name: 'child_gender', desc: '', args: []);
  }

  /// `Boy`
  String get child_gender_male {
    return Intl.message('Boy', name: 'child_gender_male', desc: '', args: []);
  }

  /// `Girl`
  String get child_gender_female {
    return Intl.message(
      'Girl',
      name: 'child_gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get child_class {
    return Intl.message('Class', name: 'child_class', desc: '', args: []);
  }

  /// `Screening Results`
  String get screening_results_title {
    return Intl.message(
      'Screening Results',
      name: 'screening_results_title',
      desc: '',
      args: [],
    );
  }

  /// `Questionnaire Answers:`
  String get screening_questionnaire_answers {
    return Intl.message(
      'Questionnaire Answers:',
      name: 'screening_questionnaire_answers',
      desc: '',
      args: [],
    );
  }

  /// `Additional Test`
  String get additional_test_title {
    return Intl.message(
      'Additional Test',
      name: 'additional_test_title',
      desc: '',
      args: [],
    );
  }

  /// `Test Type`
  String get additional_test_type {
    return Intl.message(
      'Test Type',
      name: 'additional_test_type',
      desc: '',
      args: [],
    );
  }

  /// `Instructions:`
  String get additional_test_instructions {
    return Intl.message(
      'Instructions:',
      name: 'additional_test_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Submit Response`
  String get additional_test_submit {
    return Intl.message(
      'Submit Response',
      name: 'additional_test_submit',
      desc: '',
      args: [],
    );
  }

  /// `Feature coming soon`
  String get additional_test_coming_soon {
    return Intl.message(
      'Feature coming soon',
      name: 'additional_test_coming_soon',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis_title {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis_title',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get diagnosis_doctor {
    return Intl.message('Doctor', name: 'diagnosis_doctor', desc: '', args: []);
  }

  /// `Date`
  String get diagnosis_date {
    return Intl.message('Date', name: 'diagnosis_date', desc: '', args: []);
  }

  /// `Summary`
  String get diagnosis_summary {
    return Intl.message(
      'Summary',
      name: 'diagnosis_summary',
      desc: '',
      args: [],
    );
  }

  /// `Advice`
  String get diagnosis_advice {
    return Intl.message('Advice', name: 'diagnosis_advice', desc: '', args: []);
  }

  /// `Recommendation`
  String get diagnosis_recommendation {
    return Intl.message(
      'Recommendation',
      name: 'diagnosis_recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Error downloading report`
  String get download_report_error {
    return Intl.message(
      'Error downloading report',
      name: 'download_report_error',
      desc: '',
      args: [],
    );
  }

  /// `Download Report`
  String get download_report {
    return Intl.message(
      'Download Report',
      name: 'download_report',
      desc: '',
      args: [],
    );
  }

  /// `Error loading case: {error}`
  String error_api_case(Object error) {
    return Intl.message(
      'Error loading case: $error',
      name: 'error_api_case',
      desc: '',
      args: [error],
    );
  }

  /// `Error downloading report: {error}`
  String error_api_report(Object error) {
    return Intl.message(
      'Error downloading report: $error',
      name: 'error_api_report',
      desc: '',
      args: [error],
    );
  }

  /// `ADHD Screening`
  String get screening_title {
    return Intl.message(
      'ADHD Screening',
      name: 'screening_title',
      desc: '',
      args: [],
    );
  }

  /// `Hello! I will ask you some questions about {childName}'s behavior. Please answer honestly to help us provide the best assessment.`
  String greeting(Object childName) {
    return Intl.message(
      'Hello! I will ask you some questions about $childName\'s behavior. Please answer honestly to help us provide the best assessment.',
      name: 'greeting',
      desc: '',
      args: [childName],
    );
  }

  /// `Submit to doctor`
  String get submit_video {
    return Intl.message(
      'Submit to doctor',
      name: 'submit_video',
      desc: '',
      args: [],
    );
  }

  /// `Sending...`
  String get sending {
    return Intl.message('Sending...', name: 'sending', desc: '', args: []);
  }

  /// `Please upload a video before submitting`
  String get select_video_error {
    return Intl.message(
      'Please upload a video before submitting',
      name: 'select_video_error',
      desc: '',
      args: [],
    );
  }

  /// `Video selected!`
  String get video_selected {
    return Intl.message(
      'Video selected!',
      name: 'video_selected',
      desc: '',
      args: [],
    );
  }

  /// `Great! Now please upload a short video (max 5 minutes) of {childName} doing an activity such as homework, playing, or drawing. This will help the doctor better understand the behavior.`
  String video_instructions(Object childName) {
    return Intl.message(
      'Great! Now please upload a short video (max 5 minutes) of $childName doing an activity such as homework, playing, or drawing. This will help the doctor better understand the behavior.',
      name: 'video_instructions',
      desc: '',
      args: [childName],
    );
  }

  /// `Your case will be reviewed by a doctor who will provide a diagnosis.`
  String get case_review_info {
    return Intl.message(
      'Your case will be reviewed by a doctor who will provide a diagnosis.',
      name: 'case_review_info',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Record`
  String get record {
    return Intl.message('Record', name: 'record', desc: '', args: []);
  }

  /// `Does your child have trouble focusing on tasks?`
  String get question_1 {
    return Intl.message(
      'Does your child have trouble focusing on tasks?',
      name: 'question_1',
      desc: '',
      args: [],
    );
  }

  /// `Does he/she frequently lose things?`
  String get question_2 {
    return Intl.message(
      'Does he/she frequently lose things?',
      name: 'question_2',
      desc: '',
      args: [],
    );
  }

  /// `Does he/she show hyperactivity or impulsivity?`
  String get question_3 {
    return Intl.message(
      'Does he/she show hyperactivity or impulsivity?',
      name: 'question_3',
      desc: '',
      args: [],
    );
  }

  /// `Does he/she often interrupt others?`
  String get question_4 {
    return Intl.message(
      'Does he/she often interrupt others?',
      name: 'question_4',
      desc: '',
      args: [],
    );
  }

  /// `Are there any school performance issues?`
  String get question_5 {
    return Intl.message(
      'Are there any school performance issues?',
      name: 'question_5',
      desc: '',
      args: [],
    );
  }

  /// `Is the behavior present in more than one environment (home and school)?`
  String get question_6 {
    return Intl.message(
      'Is the behavior present in more than one environment (home and school)?',
      name: 'question_6',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Case submitted successfully!`
  String get case_submitted {
    return Intl.message(
      'Case submitted successfully!',
      name: 'case_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Error during recording: {errorMessage}`
  String error_recording(Object errorMessage) {
    return Intl.message(
      'Error during recording: $errorMessage',
      name: 'error_recording',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Error during selection: {errorMessage}`
  String error_selection(Object errorMessage) {
    return Intl.message(
      'Error during selection: $errorMessage',
      name: 'error_selection',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Question {current}/{total}`
  String question_number(Object current, Object total) {
    return Intl.message(
      'Question $current/$total',
      name: 'question_number',
      desc: '',
      args: [current, total],
    );
  }

  /// `Manage your consultations`
  String get manageConsultations {
    return Intl.message(
      'Manage your consultations',
      name: 'manageConsultations',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Deletion`
  String get confirmDeletion {
    return Intl.message(
      'Confirm Deletion',
      name: 'confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete {childName}'s case?`
  String confirmDeleteCase(Object childName) {
    return Intl.message(
      'Do you really want to delete $childName\'s case?',
      name: 'confirmDeleteCase',
      desc: '',
      args: [childName],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Case deleted successfully`
  String get caseDeletedSuccessfully {
    return Intl.message(
      'Case deleted successfully',
      name: 'caseDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String error(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'error',
      desc: '',
      args: [error],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Hello! I am your ADHD expert assistant. Ask me your questions about Attention Deficit Hyperactivity Disorder. How can I help you today?`
  String get adhdChatbotGreeting {
    return Intl.message(
      'Hello! I am your ADHD expert assistant. Ask me your questions about Attention Deficit Hyperactivity Disorder. How can I help you today?',
      name: 'adhdChatbotGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Ask your question about ADHD...`
  String get adhdSendHint {
    return Intl.message(
      'Ask your question about ADHD...',
      name: 'adhdSendHint',
      desc: '',
      args: [],
    );
  }

  /// `Suggested questions:`
  String get adhdSuggestedQuestionsTitle {
    return Intl.message(
      'Suggested questions:',
      name: 'adhdSuggestedQuestionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, an error occurred. Please try again.`
  String get adhdErrorMessage {
    return Intl.message(
      'Sorry, an error occurred. Please try again.',
      name: 'adhdErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `What are the symptoms of ADHD?`
  String get adhdSuggestedQuestion_1 {
    return Intl.message(
      'What are the symptoms of ADHD?',
      name: 'adhdSuggestedQuestion_1',
      desc: '',
      args: [],
    );
  }

  /// `How is ADHD diagnosed?`
  String get adhdSuggestedQuestion_2 {
    return Intl.message(
      'How is ADHD diagnosed?',
      name: 'adhdSuggestedQuestion_2',
      desc: '',
      args: [],
    );
  }

  /// `What treatments are available?`
  String get adhdSuggestedQuestion_3 {
    return Intl.message(
      'What treatments are available?',
      name: 'adhdSuggestedQuestion_3',
      desc: '',
      args: [],
    );
  }

  /// `Is ADHD hereditary?`
  String get adhdSuggestedQuestion_4 {
    return Intl.message(
      'Is ADHD hereditary?',
      name: 'adhdSuggestedQuestion_4',
      desc: '',
      args: [],
    );
  }

  /// `Smart ADHD Assistant`
  String get adhdChatbotTitle {
    return Intl.message(
      'Smart ADHD Assistant',
      name: 'adhdChatbotTitle',
      desc: '',
      args: [],
    );
  }

  /// `SEVERITY {level}`
  String gravity(Object level) {
    return Intl.message(
      'SEVERITY $level',
      name: 'gravity',
      desc: '',
      args: [level],
    );
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `Case Details`
  String get doctor_case_details {
    return Intl.message(
      'Case Details',
      name: 'doctor_case_details',
      desc: '',
      args: [],
    );
  }

  /// `Submit Diagnosis`
  String get submit_diagnosis {
    return Intl.message(
      'Submit Diagnosis',
      name: 'submit_diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Advice`
  String get advice {
    return Intl.message('Advice', name: 'advice', desc: '', args: []);
  }

  /// `Recommendations`
  String get recommendations {
    return Intl.message(
      'Recommendations',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Request Test`
  String get request_test {
    return Intl.message(
      'Request Test',
      name: 'request_test',
      desc: '',
      args: [],
    );
  }

  /// `Test Type`
  String get test_type {
    return Intl.message('Test Type', name: 'test_type', desc: '', args: []);
  }

  /// `e.g.: Concentration Test`
  String get test_type_hint {
    return Intl.message(
      'e.g.: Concentration Test',
      name: 'test_type_hint',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Play Video`
  String get read_video {
    return Intl.message('Play Video', name: 'read_video', desc: '', args: []);
  }

  /// `Video`
  String get video {
    return Intl.message('Video', name: 'video', desc: '', args: []);
  }

  /// `No video uploaded`
  String get no_video_uploaded {
    return Intl.message(
      'No video uploaded',
      name: 'no_video_uploaded',
      desc: '',
      args: [],
    );
  }

  /// `Additional Test Response`
  String get additional_test_response {
    return Intl.message(
      'Additional Test Response',
      name: 'additional_test_response',
      desc: '',
      args: [],
    );
  }

  /// `Child Profile`
  String get child_profile {
    return Intl.message(
      'Child Profile',
      name: 'child_profile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get child_name {
    return Intl.message('Name', name: 'child_name', desc: '', args: []);
  }

  /// `Age`
  String get child_age {
    return Intl.message('Age', name: 'child_age', desc: '', args: []);
  }

  /// `ADHD Questionnaire`
  String get tdah_questionnaire {
    return Intl.message(
      'ADHD Questionnaire',
      name: 'tdah_questionnaire',
      desc: '',
      args: [],
    );
  }

  /// `Case Severity`
  String get severity {
    return Intl.message('Case Severity', name: 'severity', desc: '', args: []);
  }

  /// `Conclude Diagnosis`
  String get diagnosis_concluded {
    return Intl.message(
      'Conclude Diagnosis',
      name: 'diagnosis_concluded',
      desc: '',
      args: [],
    );
  }

  /// `Request Test`
  String get request_test_button {
    return Intl.message(
      'Request Test',
      name: 'request_test_button',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis Submitted Successfully`
  String get diagnosis_submitted {
    return Intl.message(
      'Diagnosis Submitted Successfully',
      name: 'diagnosis_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Case Not Found`
  String get case_not_found {
    return Intl.message(
      'Case Not Found',
      name: 'case_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Test request sent successfully!`
  String get send_test {
    return Intl.message(
      'Test request sent successfully!',
      name: 'send_test',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Total Cases`
  String get totalCases {
    return Intl.message('Total Cases', name: 'totalCases', desc: '', args: []);
  }

  /// `High Priority`
  String get highPriority {
    return Intl.message(
      'High Priority',
      name: 'highPriority',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Cases Sorted by Severity`
  String get casesSortedBySeverity {
    return Intl.message(
      'Cases Sorted by Severity',
      name: 'casesSortedBySeverity',
      desc: '',
      args: [],
    );
  }

  /// `No Cases Available`
  String get noCasesAvailable {
    return Intl.message(
      'No Cases Available',
      name: 'noCasesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `New Cases Will Appear Here`
  String get newCasesWillAppearHere {
    return Intl.message(
      'New Cases Will Appear Here',
      name: 'newCasesWillAppearHere',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorMessage(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorMessage',
      desc: '',
      args: [error],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Edit Case`
  String get editCase {
    return Intl.message('Edit Case', name: 'editCase', desc: '', args: []);
  }

  /// `Update Child Information`
  String get updateChildInfo {
    return Intl.message(
      'Update Child Information',
      name: 'updateChildInfo',
      desc: '',
      args: [],
    );
  }

  /// `Update the child's information`
  String get updateChildInfoSubtitle {
    return Intl.message(
      'Update the child\'s information',
      name: 'updateChildInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the first name`
  String get enterFirstName {
    return Intl.message(
      'Enter the first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the first name`
  String get pleaseEnterFirstName {
    return Intl.message(
      'Please enter the first name',
      name: 'pleaseEnterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `First name must be at least 2 characters`
  String get firstNameTooShort {
    return Intl.message(
      'First name must be at least 2 characters',
      name: 'firstNameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Enter the last name`
  String get enterLastName {
    return Intl.message(
      'Enter the last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the last name`
  String get pleaseEnterLastName {
    return Intl.message(
      'Please enter the last name',
      name: 'pleaseEnterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Last name must be at least 2 characters`
  String get lastNameTooShort {
    return Intl.message(
      'Last name must be at least 2 characters',
      name: 'lastNameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Enter the age`
  String get enterAge {
    return Intl.message('Enter the age', name: 'enterAge', desc: '', args: []);
  }

  /// `years`
  String get years {
    return Intl.message('years', name: 'years', desc: '', args: []);
  }

  /// `Please enter the age`
  String get pleaseEnterAge {
    return Intl.message(
      'Please enter the age',
      name: 'pleaseEnterAge',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number`
  String get invalidNumber {
    return Intl.message(
      'Please enter a valid number',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Age must be between 3 and 18`
  String get ageRange {
    return Intl.message(
      'Age must be between 3 and 18',
      name: 'ageRange',
      desc: '',
      args: [],
    );
  }

  /// `School Year`
  String get scholarYear {
    return Intl.message('School Year', name: 'scholarYear', desc: '', args: []);
  }

  /// `e.g., CP, CE1, 6th grade`
  String get enterSchoolYear {
    return Intl.message(
      'e.g., CP, CE1, 6th grade',
      name: 'enterSchoolYear',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the school year`
  String get pleaseEnterSchoolYear {
    return Intl.message(
      'Please enter the school year',
      name: 'pleaseEnterSchoolYear',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get updateButton {
    return Intl.message('Save', name: 'updateButton', desc: '', args: []);
  }

  /// `Case updated successfully`
  String get caseUpdatedSuccessfully {
    return Intl.message(
      'Case updated successfully',
      name: 'caseUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `{count} unread`
  String unreadCount(Object count) {
    return Intl.message(
      '$count unread',
      name: 'unreadCount',
      desc: '',
      args: [count],
    );
  }

  /// `Unread only`
  String get showUnreadOnly {
    return Intl.message(
      'Unread only',
      name: 'showUnreadOnly',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get noNotifications {
    return Intl.message(
      'No notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No unread notifications`
  String get noUnreadNotifications {
    return Intl.message(
      'No unread notifications',
      name: 'noUnreadNotifications',
      desc: '',
      args: [],
    );
  }

  /// `You are up to date!`
  String get youAreUpToDate {
    return Intl.message(
      'You are up to date!',
      name: 'youAreUpToDate',
      desc: '',
      args: [],
    );
  }

  /// `{count}d ago`
  String agoDays(Object count) {
    return Intl.message(
      '${count}d ago',
      name: 'agoDays',
      desc: '',
      args: [count],
    );
  }

  /// `{count}h ago`
  String agoHours(Object count) {
    return Intl.message(
      '${count}h ago',
      name: 'agoHours',
      desc: '',
      args: [count],
    );
  }

  /// `{count}min ago`
  String agoMinutes(Object count) {
    return Intl.message(
      '${count}min ago',
      name: 'agoMinutes',
      desc: '',
      args: [count],
    );
  }

  /// `Just now`
  String get justNow {
    return Intl.message('Just now', name: 'justNow', desc: '', args: []);
  }

  /// `Tell us about your child`
  String get child_info_header {
    return Intl.message(
      'Tell us about your child',
      name: 'child_info_header',
      desc: '',
      args: [],
    );
  }

  /// `Please provide accurate information to help us better understand your child.`
  String get child_info_description {
    return Intl.message(
      'Please provide accurate information to help us better understand your child.',
      name: 'child_info_description',
      desc: '',
      args: [],
    );
  }

  /// `Next, you will answer a series of questions about your child's behavior.`
  String get behavior_info {
    return Intl.message(
      'Next, you will answer a series of questions about your child\'s behavior.',
      name: 'behavior_info',
      desc: '',
      args: [],
    );
  }

  /// `Continue Screening`
  String get continue_screening {
    return Intl.message(
      'Continue Screening',
      name: 'continue_screening',
      desc: '',
      args: [],
    );
  }

  /// `Training Games`
  String get game_title {
    return Intl.message(
      'Training Games',
      name: 'game_title',
      desc: '',
      args: [],
    );
  }

  /// `ADHD Games`
  String get gamesTitle {
    return Intl.message('ADHD Games', name: 'gamesTitle', desc: '', args: []);
  }

  /// `Training Games`
  String get trainingGames {
    return Intl.message(
      'Training Games',
      name: 'trainingGames',
      desc: '',
      args: [],
    );
  }

  /// `Improve your attention and focus`
  String get trainingGamesSubtitle {
    return Intl.message(
      'Improve your attention and focus',
      name: 'trainingGamesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap Only When...`
  String get tapOnlyWhen {
    return Intl.message(
      'Tap Only When...',
      name: 'tapOnlyWhen',
      desc: '',
      args: [],
    );
  }

  /// `Develop your inhibitory control`
  String get tapOnlyWhenDesc {
    return Intl.message(
      'Develop your inhibitory control',
      name: 'tapOnlyWhenDesc',
      desc: '',
      args: [],
    );
  }

  /// `Spot the Differences`
  String get spotDifference {
    return Intl.message(
      'Spot the Differences',
      name: 'spotDifference',
      desc: '',
      args: [],
    );
  }

  /// `Boost your visual attention`
  String get spotDifferenceDesc {
    return Intl.message(
      'Boost your visual attention',
      name: 'spotDifferenceDesc',
      desc: '',
      args: [],
    );
  }

  /// `Find the Object`
  String get findObject {
    return Intl.message(
      'Find the Object',
      name: 'findObject',
      desc: '',
      args: [],
    );
  }

  /// `Train your concentration`
  String get findObjectDesc {
    return Intl.message(
      'Train your concentration',
      name: 'findObjectDesc',
      desc: '',
      args: [],
    );
  }

  /// `Inhibitory control`
  String get benefitInhibitory {
    return Intl.message(
      'Inhibitory control',
      name: 'benefitInhibitory',
      desc: '',
      args: [],
    );
  }

  /// `Selective attention`
  String get benefitSelective {
    return Intl.message(
      'Selective attention',
      name: 'benefitSelective',
      desc: '',
      args: [],
    );
  }

  /// `Attention to details`
  String get benefitDetails {
    return Intl.message(
      'Attention to details',
      name: 'benefitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Patience`
  String get benefitPatience {
    return Intl.message(
      'Patience',
      name: 'benefitPatience',
      desc: '',
      args: [],
    );
  }

  /// `Focus`
  String get benefitFocus {
    return Intl.message('Focus', name: 'benefitFocus', desc: '', args: []);
  }

  /// `Sustained attention`
  String get benefitSustained {
    return Intl.message(
      'Sustained attention',
      name: 'benefitSustained',
      desc: '',
      args: [],
    );
  }

  /// `Persistence`
  String get benefitPersistence {
    return Intl.message(
      'Persistence',
      name: 'benefitPersistence',
      desc: '',
      args: [],
    );
  }

  /// `Easy`
  String get difficultyEasy {
    return Intl.message('Easy', name: 'difficultyEasy', desc: '', args: []);
  }

  /// `Medium`
  String get difficultyMedium {
    return Intl.message('Medium', name: 'difficultyMedium', desc: '', args: []);
  }

  /// `5 min`
  String get duration5min {
    return Intl.message('5 min', name: 'duration5min', desc: '', args: []);
  }

  /// `10 min`
  String get duration10min {
    return Intl.message('10 min', name: 'duration10min', desc: '', args: []);
  }

  /// `30 sec`
  String get duration30sec {
    return Intl.message('30 sec', name: 'duration30sec', desc: '', args: []);
  }

  /// `Visual recognition game`
  String get gameDescription {
    return Intl.message(
      'Visual recognition game',
      name: 'gameDescription',
      desc: '',
      args: [],
    );
  }

  /// `How to play?`
  String get howToPlay {
    return Intl.message('How to play?', name: 'howToPlay', desc: '', args: []);
  }

  /// `1- Read the object name`
  String get step1Title {
    return Intl.message(
      '1- Read the object name',
      name: 'step1Title',
      desc: '',
      args: [],
    );
  }

  /// `At the top of the screen`
  String get step1Subtitle {
    return Intl.message(
      'At the top of the screen',
      name: 'step1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `2- Look at the 6 objects`
  String get step2Title {
    return Intl.message(
      '2- Look at the 6 objects',
      name: 'step2Title',
      desc: '',
      args: [],
    );
  }

  /// `Displayed on the screen`
  String get step2Subtitle {
    return Intl.message(
      'Displayed on the screen',
      name: 'step2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `3- Find the correct object`
  String get step3Title {
    return Intl.message(
      '3- Find the correct object',
      name: 'step3Title',
      desc: '',
      args: [],
    );
  }

  /// `Tap on it!`
  String get step3Subtitle {
    return Intl.message(
      'Tap on it!',
      name: 'step3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `4- Earn points`
  String get step4Title {
    return Intl.message(
      '4- Earn points',
      name: 'step4Title',
      desc: '',
      args: [],
    );
  }

  /// `+10 points per correct answer`
  String get step4Subtitle {
    return Intl.message(
      '+10 points per correct answer',
      name: 'step4Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `⏱️ Game Time`
  String get playTime {
    return Intl.message('⏱️ Game Time', name: 'playTime', desc: '', args: []);
  }

  /// `Play`
  String get playButton {
    return Intl.message('Play', name: 'playButton', desc: '', args: []);
  }

  /// `Score`
  String get score {
    return Intl.message('Score', name: 'score', desc: '', args: []);
  }

  /// `{count} objects found`
  String objectsFound(Object count) {
    return Intl.message(
      '$count objects found',
      name: 'objectsFound',
      desc: '',
      args: [count],
    );
  }

  /// `Game Over!`
  String get gameOver {
    return Intl.message('Game Over!', name: 'gameOver', desc: '', args: []);
  }

  /// `Bravo!`
  String get bravo {
    return Intl.message('Bravo!', name: 'bravo', desc: '', args: []);
  }

  /// `Try again!`
  String get tryAgain {
    return Intl.message('Try again!', name: 'tryAgain', desc: '', args: []);
  }

  /// `+10 points`
  String get points {
    return Intl.message('+10 points', name: 'points', desc: '', args: []);
  }

  /// `Find:`
  String get find {
    return Intl.message('Find:', name: 'find', desc: '', args: []);
  }

  /// `Quit`
  String get quit {
    return Intl.message('Quit', name: 'quit', desc: '', args: []);
  }

  /// `Red Lego`
  String get legoRed {
    return Intl.message('Red Lego', name: 'legoRed', desc: '', args: []);
  }

  /// `Blue Pencil`
  String get bluePencil {
    return Intl.message('Blue Pencil', name: 'bluePencil', desc: '', args: []);
  }

  /// `Sock`
  String get sock {
    return Intl.message('Sock', name: 'sock', desc: '', args: []);
  }

  /// `Book`
  String get book {
    return Intl.message('Book', name: 'book', desc: '', args: []);
  }

  /// `Toy`
  String get toy {
    return Intl.message('Toy', name: 'toy', desc: '', args: []);
  }

  /// `Remote Control`
  String get remoteControl {
    return Intl.message(
      'Remote Control',
      name: 'remoteControl',
      desc: '',
      args: [],
    );
  }

  /// `Stuffed Animal`
  String get stuffedAnimal {
    return Intl.message(
      'Stuffed Animal',
      name: 'stuffedAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Ball`
  String get ball {
    return Intl.message('Ball', name: 'ball', desc: '', args: []);
  }

  /// `Spoon`
  String get spoon {
    return Intl.message('Spoon', name: 'spoon', desc: '', args: []);
  }

  /// `Hat`
  String get hat {
    return Intl.message('Hat', name: 'hat', desc: '', args: []);
  }

  /// `apple`
  String get apple {
    return Intl.message('apple', name: 'apple', desc: '', args: []);
  }

  /// `car`
  String get car {
    return Intl.message('car', name: 'car', desc: '', args: []);
  }

  /// `flower`
  String get flower {
    return Intl.message('flower', name: 'flower', desc: '', args: []);
  }

  /// `Star`
  String get star {
    return Intl.message('Star', name: 'star', desc: '', args: []);
  }

  /// `Heart`
  String get heart {
    return Intl.message('Heart', name: 'heart', desc: '', args: []);
  }

  /// `sun`
  String get sun {
    return Intl.message('sun', name: 'sun', desc: '', args: []);
  }

  /// `Replay`
  String get replay {
    return Intl.message('Replay', name: 'replay', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `dog`
  String get dog {
    return Intl.message('dog', name: 'dog', desc: '', args: []);
  }

  /// `cat`
  String get cat {
    return Intl.message('cat', name: 'cat', desc: '', args: []);
  }

  /// `plane`
  String get plane {
    return Intl.message('plane', name: 'plane', desc: '', args: []);
  }

  /// `home`
  String get home {
    return Intl.message('home', name: 'home', desc: '', args: []);
  }

  /// `tree`
  String get tree {
    return Intl.message('tree', name: 'tree', desc: '', args: []);
  }

  /// `moon`
  String get moon {
    return Intl.message('moon', name: 'moon', desc: '', args: []);
  }

  /// `music`
  String get music {
    return Intl.message('music', name: 'music', desc: '', args: []);
  }

  /// `cake`
  String get cake {
    return Intl.message('cake', name: 'cake', desc: '', args: []);
  }

  /// `bike`
  String get bike {
    return Intl.message('bike', name: 'bike', desc: '', args: []);
  }

  /// `rocket`
  String get rocket {
    return Intl.message('rocket', name: 'rocket', desc: '', args: []);
  }

  /// `umbrella`
  String get umbrella {
    return Intl.message('umbrella', name: 'umbrella', desc: '', args: []);
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `camera`
  String get camera {
    return Intl.message('camera', name: 'camera', desc: '', args: []);
  }

  /// `gift`
  String get gift {
    return Intl.message('gift', name: 'gift', desc: '', args: []);
  }

  /// `Tap only when the displayed shape matches the rules.`
  String get tapOnlyWhenDescr {
    return Intl.message(
      'Tap only when the displayed shape matches the rules.',
      name: 'tapOnlyWhenDescr',
      desc: '',
      args: [],
    );
  }

  /// `📋 Rules`
  String get rules {
    return Intl.message('📋 Rules', name: 'rules', desc: '', args: []);
  }

  /// `It is a heart`
  String get ruleHeart {
    return Intl.message('It is a heart', name: 'ruleHeart', desc: '', args: []);
  }

  /// `It is a dog`
  String get ruleDog {
    return Intl.message('It is a dog', name: 'ruleDog', desc: '', args: []);
  }

  /// `It is blue`
  String get ruleBlue {
    return Intl.message('It is blue', name: 'ruleBlue', desc: '', args: []);
  }

  /// `⚠️ Do NOT tap in other cases!`
  String get warningDontTap {
    return Intl.message(
      '⚠️ Do NOT tap in other cases!',
      name: 'warningDontTap',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Round`
  String get round {
    return Intl.message('Round', name: 'round', desc: '', args: []);
  }

  /// `Errors`
  String get errors {
    return Intl.message('Errors', name: 'errors', desc: '', args: []);
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `Correct`
  String get correct {
    return Intl.message('Correct', name: 'correct', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Tap if it's a HEART ❤️, a DOG 🐕 or BLUE 💙`
  String get instructionsGame {
    return Intl.message(
      'Tap if it\'s a HEART ❤️, a DOG 🐕 or BLUE 💙',
      name: 'instructionsGame',
      desc: '',
      args: [],
    );
  }

  /// `Find the Odd One Out`
  String get findTheDifferent {
    return Intl.message(
      'Find the Odd One Out',
      name: 'findTheDifferent',
      desc: '',
      args: [],
    );
  }

  /// `Improve your concentration!`
  String get findTheDifferentDesc {
    return Intl.message(
      'Improve your concentration!',
      name: 'findTheDifferentDesc',
      desc: '',
      args: [],
    );
  }

  /// `Observe the 4 shapes carefully`
  String get ruleObserve {
    return Intl.message(
      'Observe the 4 shapes carefully',
      name: 'ruleObserve',
      desc: '',
      args: [],
    );
  }

  /// `Find the one that is DIFFERENT`
  String get ruleFindDifferent {
    return Intl.message(
      'Find the one that is DIFFERENT',
      name: 'ruleFindDifferent',
      desc: '',
      args: [],
    );
  }

  /// `Click on it quickly!`
  String get ruleClickFast {
    return Intl.message(
      'Click on it quickly!',
      name: 'ruleClickFast',
      desc: '',
      args: [],
    );
  }

  /// `You have 5 seconds per round`
  String get ruleTimeLimit {
    return Intl.message(
      'You have 5 seconds per round',
      name: 'ruleTimeLimit',
      desc: '',
      args: [],
    );
  }

  /// `The difference can be the shape, color or size!`
  String get ruleDifferenceTypes {
    return Intl.message(
      'The difference can be the shape, color or size!',
      name: 'ruleDifferenceTypes',
      desc: '',
      args: [],
    );
  }

  /// `Find the different shape!`
  String get findDifferentShape {
    return Intl.message(
      'Find the different shape!',
      name: 'findDifferentShape',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `s`
  String get seconds {
    return Intl.message('s', name: 'seconds', desc: '', args: []);
  }

  /// `1 min`
  String get minute1 {
    return Intl.message('1 min', name: 'minute1', desc: '', args: []);
  }

  /// `✓ Difference found!`
  String get differenceFound {
    return Intl.message(
      '✓ Difference found!',
      name: 'differenceFound',
      desc: '',
      args: [],
    );
  }

  /// `✗ Try again!`
  String get tryAgainSpot {
    return Intl.message(
      '✗ Try again!',
      name: 'tryAgainSpot',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Level {level} completed!`
  String levelCompleted(Object level) {
    return Intl.message(
      'Level $level completed!',
      name: 'levelCompleted',
      desc: '',
      args: [level],
    );
  }

  /// `All levels completed!`
  String get allLevelsCompleted {
    return Intl.message(
      'All levels completed!',
      name: 'allLevelsCompleted',
      desc: '',
      args: [],
    );
  }

  /// `All differences found!`
  String get allDifferencesFound {
    return Intl.message(
      'All differences found!',
      name: 'allDifferencesFound',
      desc: '',
      args: [],
    );
  }

  /// `Total time`
  String get totalTime {
    return Intl.message('Total time', name: 'totalTime', desc: '', args: []);
  }

  /// `Elapsed time`
  String get elapsedTime {
    return Intl.message(
      'Elapsed time',
      name: 'elapsedTime',
      desc: '',
      args: [],
    );
  }

  /// `Level {level} available`
  String nextLevelAvailable(Object level) {
    return Intl.message(
      'Level $level available',
      name: 'nextLevelAvailable',
      desc: '',
      args: [level],
    );
  }

  /// `Restart`
  String get restart {
    return Intl.message('Restart', name: 'restart', desc: '', args: []);
  }

  /// `Next level`
  String get nextLevel {
    return Intl.message('Next level', name: 'nextLevel', desc: '', args: []);
  }

  /// `Found`
  String get found {
    return Intl.message('Found', name: 'found', desc: '', args: []);
  }

  /// `Level`
  String get level {
    return Intl.message('Level', name: 'level', desc: '', args: []);
  }

  /// `VS`
  String get vs {
    return Intl.message('VS', name: 'vs', desc: '', args: []);
  }

  /// `Click on the differences between the two images!`
  String get clickDifferences {
    return Intl.message(
      'Click on the differences between the two images!',
      name: 'clickDifferences',
      desc: '',
      args: [],
    );
  }

  /// `Image {imageNumber} not available`
  String imageNotAvailable(Object imageNumber) {
    return Intl.message(
      'Image $imageNumber not available',
      name: 'imageNotAvailable',
      desc: '',
      args: [imageNumber],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
