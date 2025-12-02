import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Logo or Icon (you can add an image here)
              const Icon(
                Icons.psychology,
                size: 80,
                color: AppConstants.primaryViolet,
              ),
              
              const SizedBox(height: AppConstants.paddingLarge),
              
              // Title
              const Text(
                'Mind Bloom',
                style: AppConstants.titleStyle,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppConstants.paddingMedium),
              
              // Subtitle
              const Text(
                'Helping You Understand Your Child Better',
                style: AppConstants.subtitleStyle,
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.primaryViolet,
                    foregroundColor: AppConstants.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: AppConstants.buttonTextStyle,
                  ),
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingMedium),
              
              // Create Account Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppConstants.primaryViolet,
                    side: const BorderSide(color: AppConstants.primaryViolet, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: AppConstants.buttonTextStyle,
                  ),
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }
}