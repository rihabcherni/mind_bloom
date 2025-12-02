import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';
import '../models/case_model.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  List<CaseModel> _cases = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCases();
  }

  Future<void> _loadCases() async {
    setState(() => _isLoading = true);
    try {
      final cases = await ApiService.getMyCases();
      setState(() {
        _cases = cases;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'waiting_for_doctor': return Colors.orange;
      case 'additional_test_required': return Colors.blue;
      case 'waiting_for_reply': return Colors.purple;
      case 'completed': return Colors.green;
      case 'diagnosis_ready': return Colors.teal;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${user?.firstName ?? "Parent"}'),
        backgroundColor: AppConstants.primaryViolet,
        foregroundColor: AppConstants.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await context.read<AuthProvider>().logout();
              if (mounted) {
                Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadCases,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Start New Case Button
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.paddingLarge),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/create-case');
                          _loadCases();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryViolet,
                          foregroundColor: AppConstants.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                          ),
                        ),
                        child: const Text(
                          'Start New Case',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  
                  // My Previous Cases
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Previous Cases',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryViolet,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  // Cases List
                  Expanded(
                    child: _cases.isEmpty
                        ? const Center(
                            child: Text(
                              'No cases yet. Start a new case!',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingLarge),
                            itemCount: _cases.length,
                            itemBuilder: (context, index) {
                              final caseItem = _cases[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(AppConstants.paddingMedium),
                                  leading: CircleAvatar(
                                    backgroundColor: AppConstants.primaryViolet,
                                    child: Text(
                                      caseItem.childFirstName[0].toUpperCase(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    caseItem.childFullName,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Age: ${caseItem.childAge}'),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: _getStatusColor(caseItem.status),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          caseItem.statusDisplay,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () async {
                                    await Navigator.pushNamed(
                                      context,
                                      '/case-details',
                                      arguments: caseItem.id,
                                    );
                                    _loadCases();
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}