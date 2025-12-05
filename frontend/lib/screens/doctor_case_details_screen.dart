import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import '../constants/app_constants.dart';
import '../models/case_model.dart';
import '../services/api_service.dart';

class DoctorCaseDetailsScreen extends StatefulWidget {
  final String caseId;

  const DoctorCaseDetailsScreen({super.key, required this.caseId});

  @override
  State<DoctorCaseDetailsScreen> createState() =>
      _DoctorCaseDetailsScreenState();
}

class _DoctorCaseDetailsScreenState extends State<DoctorCaseDetailsScreen>
    with SingleTickerProviderStateMixin {
  CaseModel? _case;
  bool _isLoading = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _loadCaseDetails();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadCaseDetails() async {
    setState(() => _isLoading = true);
    try {
      final caseData = await ApiService.getCaseById(widget.caseId);
      setState(() {
        _case = caseData;
        _isLoading = false;
      });
      _animationController.forward(from: 0.0);
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        _showSnackBar('Erreur: ${e.toString()}', isError: true);
      }
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red[400] : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showDiagnosisDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final summaryController = TextEditingController();
    final adviceController = TextEditingController();
    final recommendationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF252545) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.medical_services_rounded,
                color: Colors.green,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Soumettre le diagnostic',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogTextField(
                controller: summaryController,
                label: 'Résumé',
                icon: Icons.description_rounded,
                maxLines: 3,
                isDark: isDark,
              ),
              const SizedBox(height: 16),
              _buildDialogTextField(
                controller: adviceController,
                label: 'Conseils',
                icon: Icons.lightbulb_rounded,
                maxLines: 3,
                isDark: isDark,
              ),
              const SizedBox(height: 16),
              _buildDialogTextField(
                controller: recommendationController,
                label: 'Recommandations',
                icon: Icons.recommend_rounded,
                maxLines: 3,
                isDark: isDark,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              await _submitDiagnosis(
                summaryController.text,
                adviceController.text,
                recommendationController.text,
              );
            },
            icon: const Icon(Icons.send_rounded),
            label: const Text('Soumettre'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRequestTestDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final testTypeController = TextEditingController();
    final instructionsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF252545) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.assignment_rounded,
                color: Colors.blue,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text('Demander un test', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogTextField(
              controller: testTypeController,
              label: 'Type de test',
              icon: Icons.science_rounded,
              hint: 'ex: Test de concentration',
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            _buildDialogTextField(
              controller: instructionsController,
              label: 'Instructions',
              icon: Icons.notes_rounded,
              maxLines: 4,
              isDark: isDark,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              await _requestTest(
                testTypeController.text,
                instructionsController.text,
              );
            },
            icon: const Icon(Icons.send_rounded),
            label: const Text('Envoyer'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isDark,
    String? hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppConstants.primaryViolet),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppConstants.primaryViolet,
            width: 2,
          ),
        ),
      ),
    );
  }

  Future<void> _submitDiagnosis(
    String summary,
    String advice,
    String recommendation,
  ) async {
    try {
      await ApiService.submitDiagnosis(
        widget.caseId,
        summary,
        advice,
        recommendation,
      );
      if (mounted) {
        _showSnackBar('Diagnostic soumis avec succès !');
        _loadCaseDetails();
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Erreur: ${e.toString()}', isError: true);
      }
    }
  }

  Future<void> _requestTest(String testType, String instructions) async {
    try {
      await ApiService.requestAdditionalTest(
        widget.caseId,
        testType,
        instructions,
      );
      if (mounted) {
        _showSnackBar('Demande de test envoyée avec succès !');
        _loadCaseDetails();
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Erreur: ${e.toString()}', isError: true);
      }
    }
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'high':
        return AppConstants.highSeverityColor;
      case 'medium':
        return AppConstants.mediumSeverityColor;
      case 'low':
        return AppConstants.lowSeverityColor;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF1A1A2E)
          : const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF252545) : Colors.white,
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
                        color: isDark ? Colors.white : AppConstants.darkViolet,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Détails du cas',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppConstants.darkViolet,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF252545) : Colors.white,
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
                        color: isDark ? Colors.white : AppConstants.darkViolet,
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

            // Content
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppConstants.primaryViolet,
                        strokeWidth: 3,
                      ),
                    )
                  : _case == null
                  ? _buildEmptyState(isDark)
                  : FadeTransition(
                      opacity: _fadeAnimation,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Severity Badge
                            _buildSeverityBadge(isDark),
                            const SizedBox(height: 20),

                            // Child Profile
                            _buildModernSection(
                              title: 'Profil de l\'enfant',
                              icon: Icons.child_care_rounded,
                              color: AppConstants.primaryViolet,
                              isDark: isDark,
                              children: [
                                _buildInfoRow(
                                  'Nom',
                                  _case!.childFullName,
                                  Icons.person_rounded,
                                  isDark,
                                ),
                                _buildInfoRow(
                                  'Âge',
                                  '${_case!.childAge} ans',
                                  Icons.cake_rounded,
                                  isDark,
                                ),
                                _buildInfoRow(
                                  'Sexe',
                                  _case!.childSex,
                                  Icons.wc_rounded,
                                  isDark,
                                ),
                                _buildInfoRow(
                                  'Niveau',
                                  _case!.scholarYear,
                                  Icons.school_rounded,
                                  isDark,
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Screening Answers
                            _buildModernSection(
                              title: 'Questionnaire TDAH',
                              icon: Icons.quiz_rounded,
                              color: AppConstants.lightViolet,
                              isDark: isDark,
                              children: _case!.screeningAnswers
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    return _buildQuestionAnswer(
                                      entry.key + 1,
                                      entry.value.question,
                                      entry.value.answer,
                                      isDark,
                                    );
                                  })
                                  .toList(),
                            ),

                            const SizedBox(height: 16),

                            // Video Section
                            _buildModernSection(
                              title: 'Vidéo',
                              icon: Icons.videocam_rounded,
                              color: const Color(0xFF2196F3),
                              isDark: isDark,
                              children: [
                                if (_case!.videoUrl != null)
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // TODO: Play video
                                    },
                                    icon: const Icon(Icons.play_arrow_rounded),
                                    label: const Text('Lire la vidéo'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2196F3),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.orange.withOpacity(0.3),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info_rounded,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 12),
                                        const Expanded(
                                          child: Text(
                                            'Aucune vidéo téléchargée',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),

                            // Additional Test Response
                            if (_case!.additionalTestResponse != null) ...[
                              const SizedBox(height: 16),
                              _buildModernSection(
                                title: 'Réponse au test supplémentaire',
                                icon: Icons.assignment_turned_in_rounded,
                                color: Colors.purple,
                                isDark: isDark,
                                children:
                                    _case!.additionalTestResponse!.answers?.map(
                                      (answer) {
                                        return _buildTestAnswer(
                                          answer.question,
                                          answer.answer,
                                          isDark,
                                        );
                                      },
                                    ).toList() ??
                                    [],
                              ),
                            ],

                            const SizedBox(height: 24),

                            // Action Buttons
                            if (_case!.diagnosis == null)
                              _buildActionButtons(isDark)
                            else
                              _buildDiagnosisSubmitted(isDark),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeverityBadge(bool isDark) {
    final severity = _case!.gravityScore;
    final color = _getSeverityColor(severity);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              severity == 'high'
                  ? Icons.error_rounded
                  : severity == 'medium'
                  ? Icons.warning_rounded
                  : Icons.info_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gravité du cas',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  severity.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernSection({
    required String title,
    required IconData icon,
    required Color color,
    required bool isDark,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252545) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppConstants.darkViolet,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isDark ? Colors.white60 : Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : Colors.grey[700],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswer(
    int number,
    String question,
    String answer,
    bool isDark,
  ) {
    final isYes = answer == 'Oui' || answer == 'Yes';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (isYes ? Colors.red : Colors.green).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: (isYes ? Colors.red : Colors.green).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $question',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                isYes ? Icons.close_rounded : Icons.check_rounded,
                size: 16,
                color: isYes ? Colors.red : Colors.green,
              ),
              const SizedBox(width: 6),
              Text(
                answer,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isYes ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestAnswer(String question, String answer, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isDark) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _showDiagnosisDialog,
            icon: const Icon(Icons.medical_services_rounded),
            label: const Text(
              'Conclure le diagnostic',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              shadowColor: Colors.green.withOpacity(0.4),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: _showRequestTestDialog,
            icon: const Icon(Icons.assignment_rounded),
            label: const Text(
              'Demander un test',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiagnosisSubmitted(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.green, Colors.green.shade600]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Diagnostic soumis avec succès',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppConstants.primaryViolet.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 80,
              color: AppConstants.primaryViolet.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Cas introuvable',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppConstants.darkViolet,
            ),
          ),
        ],
      ),
    );
  }
}
