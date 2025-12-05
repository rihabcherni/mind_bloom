import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import '../constants/app_constants.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showSettingsIcon;
  final bool showBackIcon;
  final double? textSize;

  const HeaderWidget({
    super.key,
    required this.title,
    this.onBackPressed,
    this.showSettingsIcon = true,
    this.showBackIcon = true,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          if (showBackIcon)
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF252545) : AppConstants.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: isDark ? AppConstants.white : AppConstants.darkViolet,
                ),
                onPressed: onBackPressed ?? () => Navigator.pop(context),
              ),
            )
          else
            const SizedBox(width: 48),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: textSize ?? 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppConstants.white : AppConstants.darkViolet,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),
          if (showSettingsIcon)
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF252545) : AppConstants.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.settings_rounded,
                  color: isDark ? AppConstants.white : AppConstants.darkViolet,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
              ),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
