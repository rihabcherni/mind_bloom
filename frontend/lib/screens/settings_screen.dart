import 'package:flutter/material.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import 'package:frontend/widgets/header.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import '../constants/app_constants.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final isDark = settings.themeMode == ThemeMode.dark;

    return Scaffold(
      floatingActionButton: const ChatbotFAB(),

      body: Stack(
        children: [
          const BackgroundCircles(),
          SafeArea(
            child: Column(
              children: [
                HeaderWidget(
                  title: S.of(context).settings,
                  onBackPressed: () => Navigator.pop(context),
                  showSettingsIcon: false,
                  showBackIcon: true,
                  textSize: 25,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(isDark, context),
                        const SizedBox(height: 32),
                        _buildSectionTitle(S.of(context).appearance, isDark),
                        const SizedBox(height: 12),
                        _buildModernCard(
                          isDark: isDark,
                          child: Column(
                            children: [
                              _buildThemeToggle(settings, isDark, context),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle(S.of(context).language, isDark),
                        const SizedBox(height: 12),
                        _buildModernCard(
                          isDark: isDark,
                          child: _buildLanguageSelector(
                            settings,
                            isDark,
                            context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(bool isDark, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppConstants.primaryViolet, AppConstants.lightViolet],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppConstants.primaryViolet.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppConstants.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.settings_rounded,
              color: AppConstants.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).personalize,
                  style: TextStyle(
                    color: AppConstants.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  S.of(context).adjustPreferences,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? AppConstants.white : AppConstants.darkViolet,
        ),
      ),
    );
  }

  Widget _buildModernCard({required bool isDark, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildThemeToggle(
    SettingsProvider settings,
    bool isDark,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppConstants.primaryViolet.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              color: AppConstants.primaryViolet,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).darkMode,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppConstants.white : AppConstants.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isDark ? S.of(context).enabled : S.of(context).disabled,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white60 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: isDark,
              onChanged: (val) => settings.toggleTheme(val),
              activeColor: AppConstants.lightViolet,
              activeTrackColor: AppConstants.primaryViolet.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector(
    SettingsProvider settings,
    bool isDark,
    BuildContext context,
  ) {
    final languages = [
      {'code': 'ar', 'name': S.of(context).arabic, 'flag': '🇹🇳'},
      {'code': 'fr', 'name': S.of(context).french, 'flag': '🇫🇷'},
      {'code': 'en', 'name': S.of(context).english, 'flag': '🇬🇧'},
    ];
    return Column(
      children: languages.map((lang) {
        final isSelected = settings.locale.languageCode == lang['code'];
        return InkWell(
          onTap: () => settings.changeLanguage(lang['code']!),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppConstants.primaryViolet.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(lang['flag']!, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    lang['name']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: isSelected
                          ? AppConstants.primaryViolet
                          : (isDark ? AppConstants.white : AppConstants.black),
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryViolet,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppConstants.white,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool isDark,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppConstants.primaryViolet.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppConstants.primaryViolet, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isDark ? AppConstants.white : AppConstants.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white60 : Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.chevron_right_rounded,
                color: isDark ? Colors.white38 : Colors.grey[400],
              ),
          ],
        ),
      ),
    );
  }
}
