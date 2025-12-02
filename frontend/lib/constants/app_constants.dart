import 'package:flutter/material.dart';

class AppConstants {
  // API Configuration
  static const String baseUrl = 'http://10.0.2.2:5000/api'; // Android emulator
  // static const String baseUrl = 'http://localhost:5000/api'; // iOS simulator
  // static const String baseUrl = 'https://your-production-url.com/api'; // Production
  
  // Colors
  static const Color primaryViolet = Color(0xFF7B2CBF);
  static const Color lightViolet = Color(0xFF9D4EDD);
  static const Color darkViolet = Color(0xFF5A189A);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  
  // Text Styles
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
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  
  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  
  // Gravity Score Colors
  static const Color highSeverityColor = Colors.red;
  static const Color mediumSeverityColor = Colors.orange;
  static const Color lowSeverityColor = Colors.green;
}