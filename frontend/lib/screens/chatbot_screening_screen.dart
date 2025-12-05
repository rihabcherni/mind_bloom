import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/app_constants.dart';
import '../models/case_model.dart';
import '../services/api_service.dart';

class ChatbotScreeningScreen extends StatefulWidget {
  final Map<String, dynamic> childInfo;

  const ChatbotScreeningScreen({super.key, required this.childInfo});

  @override
  State<ChatbotScreeningScreen> createState() => _ChatbotScreeningScreenState();
}

class _ChatbotScreeningScreenState extends State<ChatbotScreeningScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Votre enfant a-t-il du mal à se concentrer sur les tâches ?',
      'answer': null,
    },
    {'question': 'Perd-il/elle des choses fréquemment ?', 'answer': null},
    {
      'question': 'Montre-t-il/elle de l\'hyperactivité ou de l\'impulsivité ?',
      'answer': null,
    },
    {'question': 'Interrompt-il/elle souvent les autres ?', 'answer': null},
    {
      'question': 'Y a-t-il des problèmes de performance scolaire ?',
      'answer': null,
    },
    {
      'question':
          'Le comportement est-il présent dans plus d\'un environnement (maison et école) ?',
      'answer': null,
    },
  ];

  int _currentQuestionIndex = 0;
  bool _showVideoUpload = false;
  File? _videoFile;
  bool _isSubmitting = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  List<ScreeningAnswer> get _screeningAnswers {
    return _questions
        .where((q) => q['answer'] != null)
        .map(
          (q) => ScreeningAnswer(question: q['question'], answer: q['answer']),
        )
        .toList();
  }

  String _calculateGravityScore() {
    int yesCount = _questions.where((q) => q['answer'] == 'Oui').length;
    if (yesCount >= 5) return 'high';
    if (yesCount >= 3) return 'medium';
    return 'low';
  }

  void _handleAnswer(String answer) {
    setState(() {
      _questions[_currentQuestionIndex]['answer'] = answer;

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _animationController.forward(from: 0.0);
        Future.delayed(const Duration(milliseconds: 300), () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          }
        });
      } else {
        _showVideoUpload = true;
        _animationController.forward(from: 0.0);
      }
    });
  }

  Future<void> _pickVideo() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(minutes: 5),
      );

      if (pickedFile != null) {
        setState(() {
          _videoFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar(
          'Erreur lors de la sélection: ${e.toString()}',
          isError: true,
        );
      }
    }
  }

  Future<void> _recordVideo() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(minutes: 5),
      );

      if (pickedFile != null) {
        setState(() {
          _videoFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar(
          'Erreur lors de l\'enregistrement: ${e.toString()}',
          isError: true,
        );
      }
    }
  }

  Future<void> _submitCase() async {
    if (_videoFile == null) {
      _showSnackBar(
        'Veuillez télécharger une vidéo avant de soumettre',
        isError: true,
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final caseData = {
        ...widget.childInfo,
        'screeningAnswers': _screeningAnswers.map((a) => a.toJson()).toList(),
        'gravityScore': _calculateGravityScore(),
      };

      final newCase = await ApiService.createCase(caseData);
      await ApiService.uploadVideo(newCase.id, _videoFile!);

      if (mounted) {
        _showSnackBar('Cas soumis avec succès !');
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Erreur: ${e.toString()}', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red[400] : AppConstants.primaryViolet,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF252545)
                              : Colors.white,
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
                            color: isDark
                                ? Colors.white
                                : AppConstants.darkViolet,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Dépistage TDAH',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : AppConstants.darkViolet,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF252545)
                              : Colors.white,
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
                            Icons.settings_rounded,
                            color: isDark
                                ? Colors.white
                                : AppConstants.darkViolet,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SettingsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: _showVideoUpload
                      ? _buildVideoUpload(isDark)
                      : _buildChatbot(isDark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatbot(bool isDark) {
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppConstants.primaryViolet, AppConstants.lightViolet],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppConstants.primaryViolet.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildBotMessage(
                'Bonjour ! Je vais vous poser quelques questions sur le comportement de ${widget.childInfo['childFirstName']}. Répondez honnêtement pour nous aider à fournir la meilleure évaluation.',
                isDark,
              ),
              const SizedBox(height: 20),

              ..._buildPreviousMessages(isDark),

              if (_currentQuestionIndex < _questions.length)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: _buildCurrentQuestion(isDark),
                ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPreviousMessages(bool isDark) {
    List<Widget> messages = [];
    for (int i = 0; i < _currentQuestionIndex; i++) {
      messages.add(_buildBotMessage(_questions[i]['question'], isDark));
      messages.add(const SizedBox(height: 12));
      messages.add(_buildUserMessage(_questions[i]['answer'], isDark));
      messages.add(const SizedBox(height: 20));
    }
    return messages;
  }

  Widget _buildCurrentQuestion(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBotMessage(_questions[_currentQuestionIndex]['question'], isDark),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildAnswerButton('Non', false, isDark),
            const SizedBox(width: 12),
            _buildAnswerButton('Oui', true, isDark),
          ],
        ),
      ],
    );
  }

  Widget _buildAnswerButton(String text, bool isYes, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isYes
                ? Colors.red.withOpacity(0.3)
                : Colors.green.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => _handleAnswer(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: isYes ? Colors.red : Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildBotMessage(String text, bool isDark) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppConstants.primaryViolet, AppConstants.lightViolet],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: AppConstants.primaryViolet.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessage(String text, bool isDark) {
    final isYes = text == 'Oui';
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.65,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF252545) : Colors.white,
          border: Border.all(
            color: isYes ? Colors.red : Colors.green,
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: (isYes ? Colors.red : Colors.green).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isYes ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildVideoUpload(bool isDark) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppConstants.primaryViolet,
                    AppConstants.lightViolet,
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.primaryViolet.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.videocam_rounded,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 32),

            _buildBotMessage(
              'Parfait ! Maintenant, veuillez télécharger une courte vidéo (max 5 minutes) de ${widget.childInfo['childFirstName']} faisant une activité comme les devoirs, jouer ou dessiner. Cela aidera le médecin à mieux comprendre le comportement.',
              isDark,
            ),

            const SizedBox(height: 32),

            if (_videoFile != null) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Vidéo sélectionnée !',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _videoFile!.path.split('/').last,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white70 : Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
            Row(
              children: [
                Expanded(
                  child: _buildVideoButton(
                    'Galerie',
                    Icons.video_library_rounded,
                    _pickVideo,
                    isDark,
                    isPrimary: false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildVideoButton(
                    'Enregistrer',
                    Icons.videocam_rounded,
                    _recordVideo,
                    isDark,
                    isPrimary: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitCase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isSubmitting
                          ? [Colors.grey, Colors.grey]
                          : [Colors.green, Colors.green.shade600],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: _isSubmitting
                            ? Colors.grey.withOpacity(0.3)
                            : Colors.green.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: _isSubmitting
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Envoi en cours...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Soumettre au médecin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.send_rounded, color: Colors.white),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF2196F3).withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.info_rounded,
                      color: Color(0xFF2196F3),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Votre cas sera examiné par un médecin qui fournira un diagnostic.',
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white70 : Colors.grey[800],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
    bool isDark, {
    required bool isPrimary,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isPrimary
                ? AppConstants.primaryViolet.withOpacity(0.3)
                : Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 22),
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? AppConstants.primaryViolet
              : (isDark ? const Color(0xFF252545) : Colors.white),
          foregroundColor: isPrimary
              ? Colors.white
              : AppConstants.primaryViolet,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isPrimary
                ? BorderSide.none
                : const BorderSide(color: AppConstants.primaryViolet, width: 2),
          ),
        ),
      ),
    );
  }
}
