import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/generated/l10n.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import 'package:frontend/widgets/header.dart';
import '../../constants/app_constants.dart';

class GameObject {
  final String name;
  final String emoji;
  final Color color;

  GameObject({required this.name, required this.emoji, required this.color});
}

class FindObjectGame extends StatefulWidget {
  const FindObjectGame({super.key});

  @override
  State<FindObjectGame> createState() => _FindObjectGameState();
}

class _FindObjectGameState extends State<FindObjectGame> {
  int _timeLimit = 30;
  int _remainingTime = 30;
  Timer? _timer;
  bool _isPlaying = false;
  int _score = 0;
  int _round = 0;
  late GameObject _targetObject;
  List<GameObject> _displayedObjects = [];

  late List<GameObject> _allObjects;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _allObjects = [
      GameObject(name: S.of(context).legoRed, emoji: '🧱', color: Colors.red),
      GameObject(
        name: S.of(context).bluePencil,
        emoji: '✏️',
        color: Colors.blue,
      ),
      GameObject(name: S.of(context).sock, emoji: '🧦', color: Colors.purple),
      GameObject(name: S.of(context).book, emoji: '📚', color: Colors.brown),
      GameObject(name: S.of(context).toy, emoji: '🧸', color: Colors.orange),
      GameObject(
        name: S.of(context).remoteControl,
        emoji: '📱',
        color: Colors.blueGrey,
      ),
      GameObject(
        name: S.of(context).stuffedAnimal,
        emoji: '🐻',
        color: Colors.pink,
      ),
      GameObject(name: S.of(context).ball, emoji: '⚽', color: Colors.green),
      GameObject(name: S.of(context).spoon, emoji: '🥄', color: Colors.grey),
      GameObject(
        name: S.of(context).hat,
        emoji: '🎩',
        color: Colors.deepPurple,
      ),
      GameObject(name: S.of(context).apple, emoji: '🍎', color: Colors.red),
      GameObject(name: S.of(context).car, emoji: '🚗', color: Colors.blue),
      GameObject(name: S.of(context).flower, emoji: '🌸', color: Colors.pink),
      GameObject(name: S.of(context).star, emoji: '⭐', color: Colors.green),
      GameObject(name: S.of(context).heart, emoji: '❤️', color: Colors.red),
      GameObject(name: S.of(context).sun, emoji: '☀️', color: Colors.orange),
    ];
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      _isPlaying = true;
      _score = 0;
      _round = 0;
      _remainingTime = _timeLimit;
    });

    _startNewRound();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _remainingTime--;
        });

        if (_remainingTime <= 0) {
          _gameOver();
        }
      }
    });
  }

  void _startNewRound() {
    final random = Random();
    _targetObject = _allObjects[random.nextInt(_allObjects.length)];
    _displayedObjects = [_targetObject];

    final availableObjects = _allObjects
        .where((obj) => obj.name != _targetObject.name)
        .toList();
    availableObjects.shuffle();

    _displayedObjects.addAll(availableObjects.take(5));
    _displayedObjects.shuffle();

    setState(() {
      _round++;
    });
  }

  void _selectObject(GameObject selected) {
    if (selected.name == _targetObject.name) {
      setState(() {
        _score += 10;
      });
      _showFeedback(true);
      Future.delayed(const Duration(milliseconds: 800), () {
        if (_isPlaying && mounted) {
          _startNewRound();
        }
      });
    } else {
      _showFeedback(false);
    }
  }

  void _showFeedback(bool isCorrect) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: isCorrect ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: (isCorrect ? Colors.green : Colors.red).withOpacity(0.5),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCorrect ? '🎉' : '❌',
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 8),
              Text(
                isCorrect ? S.of(context).bravo : S.of(context).tryAgain,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (isCorrect) ...[
                const SizedBox(height: 8),
                Text(
                  S.of(context).points,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    });
  }

  void _gameOver() {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Text('🏁', style: TextStyle(fontSize: 32)),
            SizedBox(width: 12),
            Expanded(child: Text(S.of(context).gameOver)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppConstants.primaryViolet,
                    AppConstants.lightViolet,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text('🏆', style: TextStyle(fontSize: 60)),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).score,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  Text(
                    '$_score',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    S.of(context).objectsFound(_round),
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).menu, style: TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _startGame();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryViolet,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              S.of(context).replay,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
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
                HeaderWidget(title: S.of(context).findObject),
                Expanded(
                  child: _isPlaying
                      ? _buildGameScreen(isDark)
                      : _buildStartScreen(isDark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartScreen(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(
            '🎯',
            style: TextStyle(
              fontSize: 60,
              shadows: [
                Shadow(
                  color: AppConstants.primaryViolet.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),
          Text(
            S.of(context).findObject,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            S.of(context).gameDescription,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white70 : Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252545) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).howToPlay,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildInstructionStep(
                  S.of(context).step1Title,
                  S.of(context).step1Subtitle,
                ),
                const SizedBox(height: 8),
                _buildInstructionStep(
                  S.of(context).step2Title,
                  S.of(context).step2Subtitle,
                ),
                const SizedBox(height: 8),
                _buildInstructionStep(
                  S.of(context).step3Title,
                  S.of(context).step3Subtitle,
                ),
                const SizedBox(height: 8),
                _buildInstructionStep(
                  S.of(context).step4Title,
                  S.of(context).step4Subtitle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppConstants.primaryViolet.withOpacity(0.1),
                  AppConstants.lightViolet.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppConstants.primaryViolet.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).playTime,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeButton(15, '15s', isDark),
                    _buildTimeButton(30, '30s', isDark),
                    _buildTimeButton(60, '60s', isDark),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: _startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryViolet,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                shadowColor: AppConstants.primaryViolet.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded, size: 32, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    S.of(context).playButton,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeButton(int seconds, String label, bool isDark) {
    final isSelected = _timeLimit == seconds;

    return GestureDetector(
      onTap: () {
        setState(() {
          _timeLimit = seconds;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppConstants.primaryViolet : Colors.transparent,
          border: Border.all(color: AppConstants.primaryViolet, width: 2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppConstants.primaryViolet.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppConstants.primaryViolet,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildGameScreen(bool isDark) {
    final progress = _remainingTime / _timeLimit;
    final Color timerColor = _remainingTime <= 5
        ? Colors.red
        : _remainingTime <= 10
        ? Colors.orange
        : Colors.green;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF252545) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppConstants.primaryViolet.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text('🏆', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Text(
                      '$_score',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.primaryViolet,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: timerColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: timerColor, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer_rounded, color: timerColor, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '$_remainingTime s',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: timerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppConstants.primaryViolet, AppConstants.lightViolet],
            ),
          ),
          child: Column(
            children: [
              Text(
                S.of(context).find,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _targetObject.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _displayedObjects.length,
              itemBuilder: (context, index) {
                final obj = _displayedObjects[index];
                return _buildObjectCard(obj);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextButton.icon(
            onPressed: () {
              _timer?.cancel();
              setState(() {
                _isPlaying = false;
              });
            },
            icon: const Icon(Icons.close_rounded),
            label: Text(S.of(context).quit, style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  Widget _buildObjectCard(GameObject obj) {
    return GestureDetector(
      onTap: () => _selectObject(obj),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [obj.color.withOpacity(0.8), obj.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: obj.color.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(obj.emoji, style: const TextStyle(fontSize: 60)),
          ],
        ),
      ),
    );
  }
}
