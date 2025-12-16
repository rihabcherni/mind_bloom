import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/generated/l10n.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/header.dart';
import '../../constants/app_constants.dart';

class TapOnlyWhenGame extends StatefulWidget {
  const TapOnlyWhenGame({super.key});

  @override
  State<TapOnlyWhenGame> createState() => _TapOnlyWhenGameState();
}

class _TapOnlyWhenGameState extends State<TapOnlyWhenGame> {
  final Random _random = Random();
  Timer? _gameTimer;
  int _score = 0;
  int _errors = 0;
  int _round = 0;
  int _maxRounds = 20;
  bool _gameStarted = false;
  bool _showImage = false;
  String _currentShape = '';
  Color _currentColor = Colors.white;
  IconData _currentIcon = Icons.circle;

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
  ];

  late List<Map<String, dynamic>> _shapes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shapes = [
      {'name': S.of(context).heart, 'icon': Icons.favorite},
      {'name': S.of(context).star, 'icon': Icons.star},
      {'name': S.of(context).dog, 'icon': Icons.pets},
      {'name': S.of(context).cat, 'icon': Icons.catching_pokemon},
      {'name': S.of(context).car, 'icon': Icons.directions_car},
      {'name': S.of(context).plane, 'icon': Icons.flight},
      {'name': S.of(context).home, 'icon': Icons.home},
      {'name': S.of(context).tree, 'icon': Icons.park},
      {'name': S.of(context).sun, 'icon': Icons.wb_sunny},
      {'name': S.of(context).moon, 'icon': Icons.nightlight_round},
      {'name': S.of(context).flower, 'icon': Icons.local_florist},
      {'name': S.of(context).music, 'icon': Icons.music_note},
      {'name': S.of(context).cake, 'icon': Icons.cake},
      {'name': S.of(context).apple, 'icon': Icons.apple},
      {'name': S.of(context).bike, 'icon': Icons.pedal_bike},
      {'name': S.of(context).rocket, 'icon': Icons.rocket_launch},
      {'name': S.of(context).umbrella, 'icon': Icons.umbrella},
      {'name': S.of(context).phone, 'icon': Icons.phone_android},
      {'name': S.of(context).camera, 'icon': Icons.camera_alt},
      {'name': S.of(context).gift, 'icon': Icons.card_giftcard},
    ];
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
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
      _showImage = true;

      // Generate random shape and color
      final shape = _shapes[_random.nextInt(_shapes.length)];
      _currentShape = shape['name'];
      _currentIcon = shape['icon'];
      _currentColor = _colors[_random.nextInt(_colors.length)];
    });

    // Hide image after 1.5 seconds
    _gameTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showImage = false;
        });

        // Auto move to next after 0.5s
        Timer(const Duration(milliseconds: 500), () {
          if (mounted) {
            _nextRound();
          }
        });
      }
    });
  }

  void _handleTap() {
    if (!_showImage) return;
    _gameTimer?.cancel();
    bool shouldTap =
        _currentShape == S.of(context).heart ||
        _currentShape == S.of(context).dog ||
        _currentColor == Colors.blue;
    setState(() {
      if (shouldTap) {
        _score++;
      } else {
        _errors++;
      }
    });
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _showImage = false;
        });
        Timer(const Duration(milliseconds: 500), _nextRound);
      }
    });
  }

  void _endGame() {
    setState(() {
      _gameStarted = false;
      _showImage = false;
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
            child: Text(
              S.of(context).replay,
              style: TextStyle(color: AppConstants.white),
            ),
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
                HeaderWidget(title: S.of(context).tapOnlyWhen),
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
            padding: const EdgeInsets.all(32),
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
            child: const Icon(
              Icons.touch_app_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            S.of(context).tapOnlyWhenDesc,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252545) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).rules,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildRule('❤️', S.of(context).ruleHeart),
                _buildRule('🐕', S.of(context).ruleDog),
                _buildRule('💙', S.of(context).ruleBlue),
                const SizedBox(height: 10),
                Text(
                  S.of(context).warningDontTap,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

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
                style: TextStyle(
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildGameScreen(bool isDark) {
    return Column(
      children: [
        // Score header
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
              _buildScoreItem(S.of(context).errors, '$_errors', Colors.red),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            S.of(context).instructions,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _handleTap,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: AnimatedOpacity(
                  opacity: _showImage ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(_currentIcon, size: 200, color: _currentColor),
                ),
              ),
            ),
          ),
        ),
      ],
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
