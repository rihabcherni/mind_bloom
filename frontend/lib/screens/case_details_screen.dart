import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/case_model.dart';
import '../services/api_service.dart';

class CaseDetailsScreen extends StatefulWidget {
  final String caseId;

  const CaseDetailsScreen({super.key, required this.caseId});

  @override
  State<CaseDetailsScreen> createState() => _CaseDetailsScreenState();
}

class _CaseDetailsScreenState extends State<CaseDetailsScreen> {
  CaseModel? _case;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCaseDetails();
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
            content: Text('Error downloading report: ${e.toString()}'),
            backgroundColor: Colors.red,
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
        return Colors.purple;
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
        return Icons.hourglass_empty;
      case 'additional_test_required':
        return Icons.assignment;
      case 'waiting_for_reply':
        return Icons.pending;
      case 'completed':
        return Icons.check_circle;
      case 'diagnosis_ready':
        return Icons.medical_services;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Details'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: AppConstants.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
          if (_case != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadCaseDetails,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading case details...'),
                ],
              ),
            )
          : _error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text('Failed to load case'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _loadCaseDetails,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadCaseDetails,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatusHeader(),

                    const SizedBox(height: AppConstants.paddingLarge),
                    _buildSection('Child Information', Icons.child_care, [
                      _buildInfoRow('Name', _case!.childFullName),
                      _buildInfoRow('Age', '${_case!.childAge} years old'),
                      _buildInfoRow(
                        'Sex',
                        _case!.childSex == 'male' ? 'Male' : 'Female',
                      ),
                      _buildInfoRow('Grade', _case!.scholarYear),
                    ]),

                    const SizedBox(height: AppConstants.paddingLarge),
                    _buildSection('Screening Results', Icons.assessment, [
                      _buildSeverityBadge(),
                      const SizedBox(height: 16),
                      const Text(
                        'Questionnaire Answers:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._case!.screeningAnswers.asMap().entries.map((entry) {
                        return _buildQuestionAnswer(
                          entry.key + 1,
                          entry.value.question,
                          entry.value.answer,
                        );
                      }).toList(),
                    ]),
                    if (_case!.additionalTestRequest != null) ...[
                      const SizedBox(height: AppConstants.paddingLarge),
                      _buildAdditionalTestSection(),
                    ],
                    if (_case!.diagnosis != null) ...[
                      const SizedBox(height: AppConstants.paddingLarge),
                      _buildDiagnosisSection(),
                    ],

                    const SizedBox(height: AppConstants.paddingLarge),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildStatusHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getStatusColor(_case!.status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(_case!.status), width: 2),
      ),
      child: Row(
        children: [
          Icon(
            _getStatusIcon(_case!.status),
            color: _getStatusColor(_case!.status),
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Case Status',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  _case!.statusDisplay,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getStatusColor(_case!.status),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConstants.primaryViolet.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppConstants.primaryViolet),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryViolet,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
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
        icon = Icons.error;
        break;
      case 'medium':
        color = AppConstants.mediumSeverityColor;
        icon = Icons.warning;
        break;
      default:
        color = AppConstants.lowSeverityColor;
        icon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text(
            '${_case!.gravityScore.toUpperCase()} SEVERITY',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswer(int number, String question, String answer) {
    final isYes = answer == 'Yes';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (isYes ? Colors.red : Colors.green).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: (isYes ? Colors.red : Colors.green).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $question',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                isYes ? Icons.check_circle : Icons.cancel,
                color: isYes ? Colors.red : Colors.green,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                answer,
                style: TextStyle(
                  color: isYes ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalTestSection() {
    return _buildSection('Additional Test', Icons.assignment, [
      _buildInfoRow('Test Type', _case!.additionalTestRequest!.testType),
      const Divider(),
      const Text(
        'Instructions:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(_case!.additionalTestRequest!.instructions),

      if (_case!.status == 'additional_test_required') ...[
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Test response feature coming soon'),
                ),
              );
            },
            icon: const Icon(Icons.upload_file),
            label: const Text('Submit Test Response'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryViolet,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ],
    ]);
  }

  Widget _buildDiagnosisSection() {
    return _buildSection('Diagnosis', Icons.medical_services, [
      _buildInfoRow('Doctor', _case!.diagnosis!.doctorName),
      _buildInfoRow(
        'Date',
        '${_case!.diagnosis!.completedAt.day}/${_case!.diagnosis!.completedAt.month}/${_case!.diagnosis!.completedAt.year}',
      ),

      const Divider(),
      const SizedBox(height: 8),

      const Text(
        'Summary:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 6),
      Text(_case!.diagnosis!.summary, style: const TextStyle(height: 1.4)),

      const SizedBox(height: 16),

      const Text(
        'Advice:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 6),
      Text(_case!.diagnosis!.advice, style: const TextStyle(height: 1.4)),

      const SizedBox(height: 16),

      const Text(
        'Recommendation:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 6),
      Text(
        _case!.diagnosis!.recommendation,
        style: const TextStyle(height: 1.4),
      ),

      const SizedBox(height: 20),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _downloadReport,
          icon: const Icon(Icons.download),
          label: const Text('Download Report (PDF)'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    ]);
  }
}
