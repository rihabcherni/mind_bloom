import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  final String userType;
  
  const RegisterScreen({super.key, required this.userType});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _medicalLicenseController = TextEditingController();
  
  DateTime? _selectedDate;
  String _selectedSex = 'male';
  String _selectedRelation = 'mother';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _medicalLicenseController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your date of birth')),
        );
        return;
      }

      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      final userData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'userType': widget.userType,
        'dateOfBirth': _selectedDate!.toIso8601String(),
        'sex': _selectedSex,
      };

      if (widget.userType == 'doctor') {
        userData['medicalLicenseNumber'] = _medicalLicenseController.text;
      } else {
        userData['relationToChild'] = _selectedRelation;
      }

      final success = await context.read<AuthProvider>().register(userData);

      if (success && mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          widget.userType == 'doctor' ? '/doctor-home' : '/parent-home',
          (route) => false,
        );
      } else if (mounted) {
        final error = context.read<AuthProvider>().error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Registration failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDoctor = widget.userType == 'doctor';

    return Scaffold(
      appBar: AppBar(
        title: Text(isDoctor ? 'Doctor Registration' : 'Parent Registration'),
        backgroundColor: AppConstants.white,
        foregroundColor: AppConstants.primaryViolet,
        elevation: 0,
      ),
      backgroundColor: AppConstants.white,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('First Name', _firstNameController),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  _buildTextField('Last Name', _lastNameController),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  // Date of Birth
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  // Sex
                  DropdownButtonFormField<String>(
                    value: _selectedSex,
                    decoration: const InputDecoration(
                      labelText: 'Sex',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'male', child: Text('Male')),
                      DropdownMenuItem(value: 'female', child: Text('Female')),
                      DropdownMenuItem(value: 'other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value!;
                      });
                    },
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  // Doctor-specific: Medical License
                  if (isDoctor) ...[
                    _buildTextField('Medical License Number', _medicalLicenseController),
                    const SizedBox(height: AppConstants.paddingMedium),
                  ],
                  
                  // Parent-specific: Relation
                  if (!isDoctor) ...[
                    DropdownButtonFormField<String>(
                      value: _selectedRelation,
                      decoration: const InputDecoration(
                        labelText: 'Relation to Child',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'mother', child: Text('Mother')),
                        DropdownMenuItem(value: 'father', child: Text('Father')),
                        DropdownMenuItem(value: 'teacher', child: Text('Teacher')),
                        DropdownMenuItem(value: 'other', child: Text('Other')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedRelation = value!;
                        });
                      },
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                  ],
                  
                  _buildTextField('Email', _emailController, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  _buildTextField('Password', _passwordController, isPassword: true),
                  const SizedBox(height: AppConstants.paddingMedium),
                  
                  _buildTextField('Confirm Password', _confirmPasswordController, isPassword: true),
                  const SizedBox(height: AppConstants.paddingLarge),
                  
                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: authProvider.isLoading ? null : _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryViolet,
                        foregroundColor: AppConstants.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        ),
                      ),
                      child: authProvider.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Create ${isDoctor ? "Doctor" : "Parent"} Account',
                              style: AppConstants.buttonTextStyle,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}