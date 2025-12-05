import 'package:flutter/material.dart';

class AppConstants {
  // static const String baseUrl = 'http://10.0.2.2:5000/api'; // Android emulator
  static const String baseUrl = 'http://localhost:5000/api'; // iOS simulator
  // static const String baseUrl = 'https://your-production-url.com/api'; // Production

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkBackground = Color(0xFF1A1A2E);
  static const Color lightBackground = Color(0xFFF8F9FA);

  static const Color primaryViolet = Color(0xFF8D1E60);
  static const Color lightViolet = Color(0xFFFF6E74);
  static const Color darkViolet = Color(0xFFE1595F);
  static const Color softGrey = Color(0xFFF8B9B5);
  static const TextStyle titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: primaryViolet,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const Color highSeverityColor = Colors.red;
  static const Color mediumSeverityColor = Colors.orange;
  static const Color lowSeverityColor = Colors.green;
}
