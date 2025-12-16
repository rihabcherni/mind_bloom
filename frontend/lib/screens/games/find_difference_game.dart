import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/generated/l10n.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/header.dart';
import '../../constants/app_constants.dart';

class FindTheDifferentGame extends StatefulWidget {
  const FindTheDifferentGame({super.key});
  @override
  State<FindTheDifferentGame> createState() => _FindTheDifferentGameState();
}

class _FindTheDifferentGameState extends State<FindTheDifferentGame> {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _roundTimer;
  int _score = 0;
  int _errors = 0;
  int _round = 0;
  int _maxRounds = 12;
  bool _gameStarted = false;
  bool _showShapes = false;
  int _differentIndex = 0;
  int _timeLeft = 0;
  List<ShapeData> _currentShapes = [];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
  ];
  final List<IconData> _icons = [
    Icons.favorite,
    Icons.star,
    Icons.pets,
    Icons.directions_car,
    Icons.flight,
    Icons.home,
    Icons.wb_sunny,
    Icons.local_florist,
    Icons.music_note,
    Icons.cake,
    Icons.apple,
    Icons.sports_soccer,
    Icons.emoji_emotions,
    Icons.cloud,
    Icons.lightbulb,
  ];

  @override
  void dispose() {
    _gameTimer?.cancel();
    _roundTimer?.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      _score = 0;
      _errors = 0;
      _round = 0;
      _gameStarted = true;
    });
    _nextRound();
  }

  void _nextRound() {
    if (_round >= _maxRounds) {
      _endGame();
      return;
    }
    setState(() {
      _round++;
      _timeLeft = 5;
      _showShapes = true;
      _generateShapes();
    });
    _roundTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _timeLeft--;
        });
        if (_timeLeft <= 0) {
          timer.cancel();
          setState(() {
            _errors++;
          });
          _hideAndContinue();
        }
      }
    });
  }

  void _generateShapes() {
    _currentShapes.clear();
    final baseIcon = _icons[_random.nextInt(_icons.length)];
    final baseColor = _colors[_random.nextInt(_colors.length)];
    final baseSize = 60.0 + _random.nextInt(20);
    _differentIndex = _random.nextInt(4);
    final differenceType = _random.nextInt(3);

    Color differentColor() {
      Color newColor;
      do {
        newColor = _colors[_random.nextInt(_colors.length)];
      } while (newColor == baseColor);
      return newColor;
    }

    IconData differentIcon() {
      IconData newIcon;
      do {
        newIcon = _icons[_random.nextInt(_icons.length)];
      } while (newIcon == baseIcon);
      return newIcon;
    }

    for (int i = 0; i < 4; i++) {
      if (i == _differentIndex) {
        switch (differenceType) {
          case 0:
            _currentShapes.add(
              ShapeData(
                icon: differentIcon(),
                color: baseColor,
                size: baseSize,
              ),
            );
            break;
          case 1:
            _currentShapes.add(
              ShapeData(
                icon: baseIcon,
                color: differentColor(),
                size: baseSize,
              ),
            );
            break;
          case 2:
            _currentShapes.add(
              ShapeData(icon: baseIcon, color: baseColor, size: baseSize + 50),
            );
            break;
        }
      } else {
        _currentShapes.add(
          ShapeData(icon: baseIcon, color: baseColor, size: baseSize),
        );
      }
    }
  }

  void _handleShapeTap(int index) {
    if (!_showShapes) return;

    _roundTimer?.cancel();

    setState(() {
      if (index == _differentIndex) {
        _score++;
      } else {
        _errors++;
      }
    });

    _hideAndContinue();
  }

  void _hideAndContinue() {
    setState(() {
      _showShapes = false;
    });

    Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        _nextRound();
      }
    });
  }

  void _endGame() {
    _roundTimer?.cancel();
    setState(() {
      _gameStarted = false;
      _showShapes = false;
    });

    _showResultDialog();
  }

  void _showResultDialog() {
    final percentage = ((_score / _maxRounds) * 100).toInt();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              percentage >= 80 ? Icons.emoji_events : Icons.thumb_up,
              color: AppConstants.primaryViolet,
              size: 32,
            ),
            const SizedBox(width: 12),
            Text(S.of(context).results),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppConstants.primaryViolet,
              ),
            ),
            const SizedBox(height: 16),
            _buildResultRow(S.of(context).correct, _score, Colors.green),
            _buildResultRow(S.of(context).errors, _errors, Colors.red),
            _buildResultRow(S.of(context).total, _maxRounds, Colors.grey),
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
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _startGame();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryViolet,
            ),
            child: Text(S.of(context).replay),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$value',
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
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
      body: Stack(
        children: [
          const BackgroundCircles(),
          SafeArea(
            child: Column(
              children: [
                HeaderWidget(title: S.of(context).findTheDifferent),
                Expanded(
                  child: _gameStarted
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
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppConstants.primaryViolet, AppConstants.lightViolet],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppConstants.primaryViolet.withOpacity(0.4),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: const Icon(Icons.search, size: 45, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            S.of(context).findTheDifferent,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            S.of(context).findTheDifferentDesc,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252545) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).howToPlay,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                _buildRule('👀', S.of(context).ruleObserve),
                _buildRule('🎯', S.of(context).ruleFindDifferent),
                _buildRule('⚡', S.of(context).ruleClickFast),
                _buildRule('⏱️', S.of(context).ruleTimeLimit),
                const SizedBox(height: 10),
                Text(
                  '💡 ${S.of(context).ruleDifferenceTypes}',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: _startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryViolet,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                S.of(context).start,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRule(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildGameScreen(bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF252545) : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildScoreItem(
                S.of(context).round,
                '$_round/$_maxRounds',
                Colors.blue,
              ),
              _buildScoreItem(S.of(context).score, '$_score', Colors.green),
              _buildScoreItem(
                S.of(context).time,
                '$_timeLeft ${S.of(context).seconds}',
                Colors.orange,
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            S.of(context).findDifferentShape,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        Expanded(
          child: Center(
            child: AnimatedOpacity(
              opacity: _showShapes ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index >= _currentShapes.length) {
                      return const SizedBox();
                    }
                    return _buildShapeCard(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShapeCard(int index) {
    final shape = _currentShapes[index];
    return GestureDetector(
      onTap: () => _handleShapeTap(index),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
        ),
        child: Center(
          child: Icon(shape.icon, size: shape.size, color: shape.color),
        ),
      ),
    );
  }

  Widget _buildScoreItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeData {
  final IconData icon;
  final Color color;
  final double size;

  ShapeData({required this.icon, required this.color, required this.size});
}
