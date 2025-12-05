import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import '../constants/app_constants.dart';

class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({super.key});

  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _scholarYearController = TextEditingController();

  String _selectedSex = 'male';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _scholarYearController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState!.validate()) {
      final childInfo = {
        'childFirstName': _firstNameController.text.trim(),
        'childLastName': _lastNameController.text.trim(),
        'childSex': _selectedSex,
        'childAge': int.parse(_ageController.text),
        'scholarYear': _scholarYearController.text.trim(),
      };

      Navigator.pushNamed(context, '/chatbot-screening', arguments: childInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Information'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
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
        ],
      ),
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.child_care,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Text(
                'Tell us about your child',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                'Please provide accurate information to help us better understand your child.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: AppConstants.paddingLarge),
              TextFormField(
                controller: _firstNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Child First Name',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Enter first name',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter first name';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              TextFormField(
                controller: _lastNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Child Last Name',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person_outline),
                  hintText: 'Enter last name',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter last name';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              DropdownButtonFormField<String>(
                value: _selectedSex,
                decoration: InputDecoration(
                  labelText: 'Sex',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.wc),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                ),
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Male')),
                  DropdownMenuItem(value: 'female', child: Text('Female')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSex = value!;
                  });
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.cake),
                  hintText: 'Enter age',
                  suffixText: 'years',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  final age = int.tryParse(value);
                  if (age == null) {
                    return 'Please enter a valid number';
                  }
                  if (age < 3 || age > 18) {
                    return 'Age must be between 3 and 18';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              TextFormField(
                controller: _scholarYearController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Scholar Year (Grade)',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.school),
                  hintText: 'e.g., Grade 5, Kindergarten',
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter scholar year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingLarge * 2),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadiusMedium,
                      ),
                    ),
                    elevation: 2,
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    'Continue to Screening',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Container(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadiusMedium,
                  ),
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Next, you will answer a series of questions about your child\'s behavior.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
