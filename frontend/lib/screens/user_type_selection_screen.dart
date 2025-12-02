import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: AppConstants.white,
        foregroundColor: AppConstants.primaryViolet,
        elevation: 0,
      ),
      backgroundColor: AppConstants.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'I am a...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryViolet,
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingLarge * 2),
              
              // Doctor Card
              _buildUserTypeCard(
                context,
                icon: Icons.medical_services,
                title: 'Doctor',
                onTap: () {
                  Navigator.pushNamed(context, '/register/doctor');
                },
              ),
              
              const SizedBox(height: AppConstants.paddingLarge),
              
              // Parent Card
              _buildUserTypeCard(
                context,
                icon: Icons.family_restroom,
                title: 'Parent',
                onTap: () {
                  Navigator.pushNamed(context, '/register/parent');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppConstants.paddingLarge * 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppConstants.primaryViolet,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 64,
              color: AppConstants.primaryViolet,
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppConstants.primaryViolet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}