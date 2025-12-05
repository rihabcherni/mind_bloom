import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150,
          right: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppConstants.primaryViolet.withOpacity(0.3),
                  AppConstants.primaryViolet.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          left: -100,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppConstants.lightViolet.withOpacity(0.25),
                  AppConstants.lightViolet.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
