import 'package:flutter/material.dart';
import 'package:frontend/generated/l10n.dart';
import 'package:frontend/screens/games/find_difference_game.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import 'package:frontend/widgets/header.dart';
import '../../constants/app_constants.dart';
import 'tap_only_when_game.dart';
import 'spot_difference_game.dart';
import 'find_object_game.dart';

class GamesMenuScreen extends StatelessWidget {
  const GamesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      floatingActionButton: const ChatbotFAB(),
      body: Stack(
        children: [
          const BackgroundCircles(),
          SafeArea(
            child: Column(
              children: [
                HeaderWidget(title: S.of(context).gamesTitle),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppConstants.primaryViolet,
                                AppConstants.lightViolet,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppConstants.primaryViolet.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.games_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).trainingGames,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      S.of(context).trainingGamesSubtitle,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildGameCard(
                          context,
                          title: S.of(context).tapOnlyWhen,
                          description: S.of(context).tapOnlyWhenDesc,
                          icon: Icons.touch_app_rounded,
                          color: const Color(0xFF9C27B0),
                          benefits: [
                            S.of(context).benefitInhibitory,
                            S.of(context).benefitSelective,
                          ],
                          difficulty: S.of(context).difficultyEasy,
                          duration: S.of(context).duration5min,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TapOnlyWhenGame(),
                              ),
                            );
                          },
                          isDark: isDark,
                        ),
                        const SizedBox(height: 4),
                        _buildGameCard(
                          context,
                          title: S.of(context).spotDifference,
                          description: S.of(context).spotDifferenceDesc,
                          icon: Icons.image_search_rounded,
                          color: const Color(0xFF2196F3),
                          benefits: [
                            S.of(context).benefitDetails,
                            S.of(context).benefitPatience,
                            S.of(context).benefitFocus,
                          ],
                          difficulty: S.of(context).difficultyMedium,
                          duration: S.of(context).duration10min,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SpotDifferenceGame(),
                              ),
                            );
                          },
                          isDark: isDark,
                        ),
                        const SizedBox(height: 4),
                        _buildGameCard(
                          context,
                          title: S.of(context).findObject,
                          description: S.of(context).findObjectDesc,
                          icon: Icons.search_rounded,
                          color: const Color(0xFFFF9800),
                          benefits: [
                            S.of(context).benefitSustained,
                            S.of(context).benefitPersistence,
                          ],
                          difficulty: S.of(context).difficultyEasy,
                          duration: S.of(context).duration30sec,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const FindObjectGame(),
                              ),
                            );
                          },
                          isDark: isDark,
                        ),
                        const SizedBox(height: 4),
                        _buildGameCard(
                          context,
                          title: S.of(context).findTheDifferent,
                          description: S.of(context).findTheDifferent,
                          icon: Icons.filter_tilt_shift_rounded,
                          color: const Color.fromARGB(255, 83, 244, 3),
                          benefits: [
                            S.of(context).benefitDetails,
                            S.of(context).benefitInhibitory,
                          ],
                          difficulty: S.of(context).difficultyMedium,
                          duration: S.of(context).minute1,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const FindTheDifferentGame(),
                              ),
                            );
                          },
                          isDark: isDark,
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

  Widget _buildGameCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required List<String> benefits,
    required String difficulty,
    required String duration,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF252545) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.7)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, color: Colors.white, size: 25),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white70 : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color,
                    size: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: benefits.map((benefit) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, size: 14, color: color),
                      const SizedBox(width: 4),
                      Text(
                        benefit,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.signal_cellular_alt,
                  size: 16,
                  color: Colors.grey[400],
                ),
                const SizedBox(width: 4),
                Text(
                  difficulty,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                Icon(Icons.timer, size: 16, color: Colors.grey[400]),
                const SizedBox(width: 4),
                Text(
                  duration,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
