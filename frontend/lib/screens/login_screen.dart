import 'package:flutter/material.dart';
import 'package:frontend/widgets/header.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../providers/auth_provider.dart';
import '../widgets/modern_text_field.dart';
import '../widgets/modern_button.dart';
import '../widgets/background_circles.dart';
import '../widgets/divider_with_text.dart';
import '../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
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
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<AuthProvider>().login(
        _emailController.text,
        _passwordController.text,
      );
      if (success && mounted) {
        final userType = context.read<AuthProvider>().user!.userType;
        Navigator.pushNamedAndRemoveUntil(
          context,
          userType == 'doctor' ? '/doctor-home' : '/parent-home',
          (route) => false,
        );
      } else if (mounted) {
        final error = context.read<AuthProvider>().error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error ?? S.of(context).loginFailed),
            backgroundColor: Colors.red[400],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return Stack(
            children: [
              const BackgroundCircles(),
              SafeArea(
                child: Column(
                  children: [
                    HeaderWidget(
                      title: S.of(context).login,
                      onBackPressed: () => Navigator.pop(context),
                      showSettingsIcon: true,
                      showBackIcon: true,
                      textSize: 25,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(
                          AppConstants.paddingLarge,
                        ),
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              AppConstants.primaryViolet,
                                              AppConstants.white,
                                              AppConstants.lightViolet,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppConstants.primaryViolet
                                                  .withOpacity(0.4),
                                              blurRadius: 20,
                                              offset: const Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/images/logo-trans2.png',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ModernTextField(
                                  controller: _emailController,
                                  label: S.of(context).loginEmailLabel,
                                  hint: S.of(context).loginEmailHint,
                                  icon: Icons.email_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                  isDark: isDark,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).loginEmailEmpty;
                                    }
                                    if (!value.contains('@')) {
                                      return S.of(context).loginEmailInvalid;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 8),
                                ModernTextField(
                                  controller: _passwordController,
                                  label: S.of(context).loginPasswordLabel,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).loginPasswordEmpty;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      S.of(context).loginForgotPassword,
                                      style: TextStyle(
                                        color: AppConstants.primaryViolet,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ModernButton(
                                  onPressed: _handleLogin,
                                  isLoading: authProvider.isLoading,
                                  text: S.of(context).loginButton,
                                ),

                                const SizedBox(height: 8),
                                DividerWithText(
                                  text: S.of(context).loginOr,
                                  isDark: isDark,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: AppConstants.primaryViolet,
                                        width: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      S.of(context).loginRegisterButton,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppConstants.primaryViolet,
                                        letterSpacing: 0.5,
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
}
