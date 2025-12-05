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

  /// `No cases yet. Start a new case!`
  String get noCasesYet {
    return Intl.message(
      'No cases yet. Start a new case!',
      name: 'noCasesYet',
      desc: '',
      args: [],
    );
  }

  /// `Age: {age}`
  String age(Object age) {
    return Intl.message('Age: $age', name: 'age', desc: '', args: [age]);
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
