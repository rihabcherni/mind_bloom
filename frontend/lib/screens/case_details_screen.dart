import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/case_model.dart';
import '../services/api_service.dart';
import '../generated/l10n.dart';

class CaseDetailsScreen extends StatefulWidget {
  final String caseId;

  const CaseDetailsScreen({super.key, required this.caseId});

  @override
  State<CaseDetailsScreen> createState() => _CaseDetailsScreenState();
}

class _CaseDetailsScreenState extends State<CaseDetailsScreen>
    with SingleTickerProviderStateMixin {
  CaseModel? _case;
  bool _isLoading = true;
  String? _error;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );
    _loadCaseDetails();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadCaseDetails() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final caseData = await ApiService.getCaseById(widget.caseId);
      setState(() {
        _case = caseData;
        _isLoading = false;
      });
      _animationController.forward();
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading case: ${e.toString()}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  Future<void> _downloadReport() async {
    try {
      final response = await ApiService.getReportUrl(widget.caseId);
      final url = response['reportUrl'];

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch URL');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).error_api_report(e.toString())),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'waiting_for_doctor':
        return Colors.orange;
      case 'additional_test_required':
        return Colors.blue;
      case 'waiting_for_reply':
        return AppConstants.primaryViolet;
      case 'completed':
        return Colors.green;
      case 'diagnosis_ready':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'waiting_for_doctor':
        return Icons.hourglass_empty_rounded;
      case 'additional_test_required':
        return Icons.assignment_rounded;
      case 'waiting_for_reply':
        return Icons.pending_rounded;
      case 'completed':
        return Icons.check_circle_rounded;
      case 'diagnosis_ready':
        return Icons.medical_services_rounded;
      default:
        return Icons.info_rounded;
    }
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
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
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
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          S.of(context).caseDetails_title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppConstants.white
                                : AppConstants.darkViolet,
                          ),
                        ),
                      ),
                      if (_case != null)
                        Container(
                          decoration: BoxDecoration(
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
                              Icons.refresh_rounded,
                              color: isDark
                                  ? Colors.white
                                  : AppConstants.darkViolet,
                            ),
                            onPressed: _loadCaseDetails,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
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

                // Content
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: AppConstants.primaryViolet,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                S.of(context).loading,
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.white60
                                      : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                      : _error != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Icon(
                                  Icons.error_outline_rounded,
                                  size: 64,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                S.of(context).error_loading_case,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? Colors.white
                                      : AppConstants.darkViolet,
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: _loadCaseDetails,
                                icon: const Icon(Icons.refresh_rounded),
                                label: Text(S.of(context).retry),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstants.primaryViolet,
                                  foregroundColor: AppConstants.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: _loadCaseDetails,
                          color: AppConstants.primaryViolet,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(24),
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildStatusHeader(isDark),
                                    const SizedBox(height: 24),
                                    _buildChildInfoSection(isDark),
                                    const SizedBox(height: 20),
                                    _buildScreeningSection(isDark),
                                    if (_case!.additionalTestRequest !=
                                        null) ...[
                                      const SizedBox(height: 20),
                                      _buildAdditionalTestSection(isDark),
                                    ],
                                    if (_case!.diagnosis != null) ...[
                                      const SizedBox(height: 20),
                                      _buildDiagnosisSection(isDark),
                                    ],
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
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

  Widget _buildStatusHeader(bool isDark) {
    final statusColor = _getStatusColor(_case!.status);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [statusColor.withOpacity(0.2), statusColor.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor.withOpacity(0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: statusColor.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: statusColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              _getStatusIcon(_case!.status),
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
                  S.of(context).status_title,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white60 : Colors.grey[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _case!.statusDisplay,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildInfoSection(bool isDark) {
    return _buildModernSection(
      S.of(context).child_info_title,
      Icons.child_care_rounded,
      isDark,
      [
        _buildInfoRow(S.of(context).child_name, _case!.childFullName, isDark),
        _buildInfoRow(
          S.of(context).child_age,
          '${_case!.childAge} ans',
          isDark,
        ),
        _buildInfoRow(
          S.of(context).child_gender,
          _case!.childSex == S.of(context).child_gender_male
              ? S.of(context).child_gender_male
              : S.of(context).child_gender_female,
          isDark,
        ),
        _buildInfoRow(S.of(context).child_class, _case!.scholarYear, isDark),
      ],
    );
  }

  Widget _buildScreeningSection(bool isDark) {
    return _buildModernSection(
      S.of(context).screening_results_title,
      Icons.assessment_rounded,
      isDark,
      [
        _buildSeverityBadge(),
        const SizedBox(height: 20),
        Text(
          S.of(context).screening_questionnaire_answers,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: isDark ? AppConstants.white : AppConstants.darkViolet,
          ),
        ),
        const SizedBox(height: 12),
        ..._case!.screeningAnswers.asMap().entries.map((entry) {
          return _buildQuestionAnswer(
            entry.key + 1,
            entry.value.question,
            entry.value.answer,
            isDark,
          );
        }).toList(),
      ],
    );
  }

  Widget _buildAdditionalTestSection(bool isDark) {
    return _buildModernSection(
      S.of(context).additional_test_title,
      Icons.assignment_rounded,
      isDark,
      [
        _buildInfoRow(
          S.of(context).additional_test_type,
          _case!.additionalTestRequest!.testType,
          isDark,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_rounded, color: Colors.blue, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).additional_test_instructions,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _case!.additionalTestRequest!.instructions,
                style: TextStyle(
                  height: 1.5,
                  color: isDark ? Colors.white70 : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
        if (_case!.status == 'additional_test_required') ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).additional_test_coming_soon),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
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
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Color(0xFF64B5F6)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.upload_file_rounded,
                        color: AppConstants.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).additional_test_submit,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDiagnosisSection(bool isDark) {
    return _buildModernSection(
      S.of(context).diagnosis_title,
      Icons.medical_services_rounded,
      isDark,
      [
        _buildInfoRow(
          S.of(context).diagnosis_doctor,
          _case!.diagnosis!.doctorName,
          isDark,
        ),
        _buildInfoRow(
          S.of(context).diagnosis_date,
          '${_case!.diagnosis!.completedAt.day}/${_case!.diagnosis!.completedAt.month}/${_case!.diagnosis!.completedAt.year}',
          isDark,
        ),
        const SizedBox(height: 16),
        _buildDiagnosisBlock(
          S.of(context).diagnosis_summary,
          _case!.diagnosis!.summary,
          Icons.description_rounded,
          Colors.blue,
          isDark,
        ),
        const SizedBox(height: 12),
        _buildDiagnosisBlock(
          S.of(context).diagnosis_advice,
          _case!.diagnosis!.advice,
          Icons.tips_and_updates_rounded,
          Colors.orange,
          isDark,
        ),
        const SizedBox(height: 12),
        _buildDiagnosisBlock(
          S.of(context).diagnosis_recommendation,
          _case!.diagnosis!.recommendation,
          Icons.recommend_rounded,
          Colors.green,
          isDark,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _downloadReport,
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
                gradient: const LinearGradient(
                  colors: [Colors.green, Color(0xFF66BB6A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download_rounded,
                      color: AppConstants.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).download_report,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModernSection(
    String title,
    IconData icon,
    bool isDark,
    List<Widget> children,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppConstants.primaryViolet.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppConstants.primaryViolet.withOpacity(0.1),
            blurRadius: 20,
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppConstants.primaryViolet,
                      AppConstants.lightViolet,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppConstants.white, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppConstants.white : AppConstants.darkViolet,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: isDark ? Colors.white60 : Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isDark ? Colors.white : AppConstants.darkViolet,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeverityBadge() {
    Color color;
    IconData icon;

    switch (_case!.gravityScore) {
      case 'high':
        color = AppConstants.highSeverityColor;
        icon = Icons.error_rounded;
        break;
      case 'medium':
        color = AppConstants.mediumSeverityColor;
        icon = Icons.warning_rounded;
        break;
      default:
        color = AppConstants.lowSeverityColor;
        icon = Icons.info_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppConstants.white, size: 20),
          const SizedBox(width: 8),
          Text(
            'GRAVITÉ ${_case!.gravityScore.toUpperCase()}',
            style: const TextStyle(
              color: AppConstants.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
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
    final normalized = answer.trim().toLowerCase();

    const yesWords = {'yes', 'oui', 'نعم', 'ايه'};

    final isYes = yesWords.contains(normalized);
    final color = isYes ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $question',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              height: 1.4,
              color: isDark ? Colors.white : AppConstants.darkViolet,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isYes ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  color: AppConstants.white,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  answer,
                  style: const TextStyle(
                    color: AppConstants.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagnosisBlock(
    String title,
    String content,
    IconData icon,
    Color color,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              height: 1.5,
              fontSize: 13,
              color: isDark ? Colors.white70 : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
