import 'package:flutter/material.dart';
import 'package:frontend/generated/l10n.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import 'package:frontend/widgets/header.dart';
import 'dart:async';
import '../../constants/app_constants.dart';

class SpotDifferenceGame extends StatefulWidget {
  const SpotDifferenceGame({super.key});
  @override
  State<SpotDifferenceGame> createState() => _SpotDifferenceGameState();
}

class _SpotDifferenceGameState extends State<SpotDifferenceGame> {
  int _level = 1;
  int _differencesFound = 0;
  int _totalDifferences = 5;
  int _maxLevel = 3;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = '00:00';
  final List<int> _foundDifferences = [];
  final GlobalKey _imageKey1 = GlobalKey();
  final GlobalKey _imageKey2 = GlobalKey();

  final Map<int, Map<String, String>> _images = {
    1: {'image1': 'assets/images/img1.PNG', 'image2': 'assets/images/img2.PNG'},
    2: {'image1': 'assets/images/i1.PNG', 'image2': 'assets/images/i2.PNG'},
    3: {'image1': 'assets/images/img3.PNG', 'image2': 'assets/images/img4.PNG'},
  };

  final Map<int, List<Map<String, double>>> _differences = {
    1: [
      {'x': 0.24, 'y': 0.53},
      {'x': 0.52, 'y': 0.20},
      {'x': 0.62, 'y': 0.45},
      {'x': 0.42, 'y': 0.8},
      {'x': 0.8, 'y': 0.83},
    ],
    2: [
      {'x': 0.25, 'y': 0.35},
      {'x': 0.55, 'y': 0.25},
      {'x': 0.75, 'y': 0.55},
      {'x': 0.35, 'y': 0.75},
      {'x': 0.85, 'y': 0.80},
    ],
    3: [
      {'x': 0.25, 'y': 0.35},
      {'x': 0.55, 'y': 0.25},
      {'x': 0.75, 'y': 0.55},
      {'x': 0.35, 'y': 0.75},
      {'x': 0.87, 'y': 0.82},
    ],
  };

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          final minutes = _stopwatch.elapsed.inMinutes.toString().padLeft(
            2,
            '0',
          );
          final seconds = (_stopwatch.elapsed.inSeconds % 60)
              .toString()
              .padLeft(2, '0');
          _elapsedTime = '$minutes:$seconds';
        });
      }
    });
  }

  void _handleTap(TapDownDetails details, GlobalKey imageKey) {
    final RenderBox? box =
        imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    final size = box.size;
    final localPosition = details.localPosition;
    final tapX = localPosition.dx / size.width;
    final tapY = localPosition.dy / size.height;
    const tolerance = 0.08;

    for (int i = 0; i < _differences[_level]!.length; i++) {
      if (_foundDifferences.contains(i)) continue;

      final diff = _differences[_level]![i];
      final diffX = diff['x']!;
      final diffY = diff['y']!;
      final distanceX = (tapX - diffX).abs();
      final distanceY = (tapY - diffY).abs();

      if (distanceX < tolerance && distanceY < tolerance) {
        setState(() {
          _foundDifferences.add(i);
          _differencesFound++;
        });

        _showSuccessFeedback();

        if (_differencesFound >= _totalDifferences) {
          _timer?.cancel();
          Future.delayed(const Duration(milliseconds: 500), () {
            _showLevelCompletionDialog();
          });
        }
        return;
      }
    }

    _showErrorFeedback();
  }

  void _showSuccessFeedback() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).differenceFound),
        duration: Duration(milliseconds: 800),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorFeedback() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).tryAgainSpot),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showLevelCompletionDialog() {
    final bool isLastLevel = _level >= _maxLevel;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              isLastLevel ? Icons.emoji_events : Icons.check_circle,
              color: isLastLevel ? Colors.amber : Colors.green,
              size: 32,
            ),
            const SizedBox(width: 12),
            Text(
              isLastLevel
                  ? S.of(context).congratulations
                  : S.of(context).levelCompleted(_level),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLastLevel
                  ? S.of(context).allLevelsCompleted
                  : S.of(context).allDifferencesFound,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppConstants.primaryViolet.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.timer_rounded,
                    size: 48,
                    color: AppConstants.primaryViolet,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _elapsedTime,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.primaryViolet,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isLastLevel
                        ? S.of(context).totalTime
                        : S.of(context).elapsedTime,
                  ),
                ],
              ),
            ),
            if (!isLastLevel) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_forward, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).nextLevelAvailable(_level + 1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(S.of(context).quit),
          ),
          if (isLastLevel)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _restartFromLevel1();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryViolet,
              ),
              child: Text(
                S.of(context).restart,
                style: TextStyle(color: AppConstants.white),
              ),
            )
          else
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _nextLevel();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryViolet,
              ),
              child: Text(
                S.of(context).nextLevel,
                style: TextStyle(color: AppConstants.white),
              ),
            ),
        ],
      ),
    );
  }

  void _nextLevel() {
    if (_level < _maxLevel) {
      setState(() {
        _level++;
        _differencesFound = 0;
        _foundDifferences.clear();
      });
    }
  }

  void _restartFromLevel1() {
    setState(() {
      _level = 1;
      _differencesFound = 0;
      _foundDifferences.clear();
      _stopwatch.reset();
      _stopwatch.start();
    });
    _startTimer();
  }

  void _resetCurrentLevel() {
    setState(() {
      _differencesFound = 0;
      _foundDifferences.clear();
      _stopwatch.reset();
      _stopwatch.start();
    });
  }

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
                HeaderWidget(title: S.of(context).spotDifference),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF252545)
                                : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoCard(
                                S.of(context).found,
                                '$_differencesFound/$_totalDifferences',
                                Icons.check_circle,
                                Colors.green,
                              ),
                              _buildInfoCard(
                                S.of(context).time,
                                _elapsedTime,
                                Icons.timer,
                                Colors.blue,
                              ),
                              _buildInfoCard(
                                S.of(context).level,
                                '$_level/$_maxLevel',
                                Icons.star,
                                Colors.amber,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              _buildImageWithDifferences(
                                _images[_level]!['image1']!,
                                1,
                                isDark,
                                _imageKey1,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                S.of(context).vs,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppConstants.primaryViolet,
                                ),
                              ),
                              const SizedBox(height: 1),
                              _buildImageWithDifferences(
                                _images[_level]!['image2']!,
                                2,
                                isDark,
                                _imageKey2,
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppConstants.primaryViolet.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppConstants.primaryViolet
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.info_outline,
                                      color: AppConstants.primaryViolet,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        S.of(context).clickDifferences,
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.black87,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

  Widget _buildInfoCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildImageWithDifferences(
    String imageUrl,
    int imageNumber,
    bool isDark,
    GlobalKey imageKey,
  ) {
    return GestureDetector(
      onTapDown: (details) => _handleTap(details, imageKey),
      child: Container(
        key: imageKey,
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF252545) : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppConstants.primaryViolet.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).imageNotAvailable(imageNumber),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ...List.generate(_foundDifferences.length, (index) {
                final diffIndex = _foundDifferences[index];
                final diff = _differences[_level]![diffIndex];

                return Positioned(
                  left: diff['x']! * MediaQuery.of(context).size.width - 28,
                  top: diff['y']! * 300 - 20,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 3),
                      color: Colors.green.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Icon(Icons.check, color: Colors.green, size: 24),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
