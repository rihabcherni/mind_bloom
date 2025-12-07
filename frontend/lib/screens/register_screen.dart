import 'package:flutter/material.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/modern_text_field.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/auth_provider.dart';
import 'package:frontend/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  final String userType;

  const RegisterScreen({super.key, required this.userType});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
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
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _medicalLicenseController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
                    primary: AppConstants.primaryViolet,
                    onPrimary: AppConstants.white,
                    surface: AppConstants.darkBackground,
                    onSurface: AppConstants.white,
                  )
                : ColorScheme.light(
                    primary: AppConstants.primaryViolet,
                    onPrimary: AppConstants.white,
                    onSurface: AppConstants.black,
                  ),
            dialogBackgroundColor: isDark
                ? const Color(0xFF252545)
                : Colors.white,
          ),
          child: child!,
        );
      },
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
        _showSnackBar(S.of(context).pleaseSelectDateOfBirth, isError: true);
        return;
      }

      if (_passwordController.text != _confirmPasswordController.text) {
        _showSnackBar(S.of(context).passwordsDoNotMatch, isError: true);
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
        _showSnackBar(error ?? S.of(context).registrationFailed, isError: true);
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
    final isDoctor = widget.userType == 'doctor';

    return Scaffold(
      floatingActionButton: const ChatbotFAB(),

      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return Stack(
            children: [
              const BackgroundCircles(),
              SafeArea(
                child: Column(
                  children: [
                    HeaderWidget(
                      title: S.of(context).createAccount,
                      onBackPressed: () => Navigator.pop(context),
                      showSettingsIcon: true,
                      showBackIcon: true,
                      textSize: 22,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(
                          AppConstants.paddingLarge,
                          0,
                          AppConstants.paddingLarge,
                          AppConstants.paddingLarge,
                        ),
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isDoctor
                                      ? S.of(context).doctorRegistration
                                      : S.of(context).parentRegistration,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? Colors.white60
                                        : Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ModernTextField(
                                        controller: _firstNameController,
                                        label: S.of(context).firstName,
                                        hint: S.of(context).firstName,
                                        icon: Icons.person_outline_rounded,
                                        isDark: isDark,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ModernTextField(
                                        controller: _lastNameController,
                                        label: S.of(context).lastName,
                                        hint: S.of(context).lastName,
                                        icon: Icons.person_outline_rounded,
                                        isDark: isDark,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: _buildDatePicker(isDark),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 1,
                                      child: _buildSexSelector(isDark),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                if (isDoctor) ...[
                                  ModernTextField(
                                    controller: _medicalLicenseController,
                                    label: S.of(context).medicalLicenseNumber,
                                    hint: 'ML123456',
                                    icon: Icons.medical_services_rounded,
                                    isDark: isDark,
                                  ),
                                  const SizedBox(height: 5),
                                ],
                                if (!isDoctor) ...[
                                  _buildRelationSelector(isDark),
                                  const SizedBox(height: 5),
                                ],
                                ModernTextField(
                                  controller: _emailController,
                                  label: S.of(context).email,
                                  hint: 'exemple@email.com',
                                  icon: Icons.email_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                  isDark: isDark,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).enterEmail;
                                    }
                                    if (!value.contains('@')) {
                                      return S.of(context).invalidEmail;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
                                ModernTextField(
                                  controller: _passwordController,
                                  label: S.of(context).password,
                                  hint: '••••••••',
                                  icon: Icons.lock_rounded,
                                  obscureText: _obscurePassword,
                                  isDark: isDark,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      color: AppConstants.primaryViolet,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5),
                                ModernTextField(
                                  controller: _confirmPasswordController,
                                  label: S.of(context).confirmPassword,
                                  hint: '••••••••',
                                  icon: Icons.lock_rounded,
                                  obscureText: _obscureConfirmPassword,
                                  isDark: isDark,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      color: AppConstants.primaryViolet,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword =
                                            !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: authProvider.isLoading
                                        ? null
                                        : _handleRegister,
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
                                          colors: [
                                            AppConstants.primaryViolet,
                                            AppConstants.lightViolet,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppConstants.primaryViolet
                                                .withOpacity(0.4),
                                            blurRadius: 15,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: authProvider.isLoading
                                            ? const SizedBox(
                                                width: 24,
                                                height: 24,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: AppConstants.white,
                                                      strokeWidth: 2.5,
                                                    ),
                                              )
                                            : Text(
                                                S.of(context).register,
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppConstants.white,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            "${S.of(context).alreadyHaveAccount} ",
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white60
                                              : Colors.grey[600],
                                        ),
                                        children: [
                                          TextSpan(
                                            text: S.of(context).loginLink,
                                            style: TextStyle(
                                              color: AppConstants.primaryViolet,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDatePicker(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).dateOfBirth,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? AppConstants.white : AppConstants.darkViolet,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF252545) : AppConstants.white,

              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppConstants.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppConstants.primaryViolet.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.calendar_today_rounded,
                    color: AppConstants.primaryViolet,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? S.of(context).selectDate
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    style: TextStyle(
                      fontSize: 15,
                      color: _selectedDate == null
                          ? (isDark ? Colors.white38 : Colors.grey[400])
                          : (isDark ? AppConstants.white : AppConstants.black),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: isDark ? Colors.white38 : Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSexSelector(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).sexe,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? AppConstants.white : AppConstants.darkViolet,
          ),
        ),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.white24 : Colors.grey.shade300,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedSex,
              hint: Text(
                S.of(context).sexe,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.grey,
                  fontSize: 13,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: isDark ? AppConstants.white : AppConstants.darkViolet,
              ),
              items: [
                DropdownMenuItem(
                  value: "male",
                  child: Text(
                    S.of(context).male,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? AppConstants.white : Colors.black87,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "female",
                  child: Text(
                    S.of(context).female,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? AppConstants.white : Colors.black87,
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSex = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelationSelector(bool isDark) {
    final relations = [
      {'value': 'mother', 'label': S.of(context).mother},
      {'value': 'father', 'label': S.of(context).father},
      {'value': 'teacher', 'label': S.of(context).teacher},
      {'value': 'other', 'label': S.of(context).other},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).relationWithChild,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? AppConstants.white : AppConstants.darkViolet,
          ),
        ),
        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            value: _selectedRelation,
            decoration: const InputDecoration(border: InputBorder.none),
            style: TextStyle(
              color: isDark ? AppConstants.white : Colors.black,
              fontSize: 15,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
            items: relations.map((relation) {
              return DropdownMenuItem<String>(
                value: relation['value']!,
                child: Text(relation['label']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedRelation = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
