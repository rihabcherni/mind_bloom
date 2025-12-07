import 'package:flutter/material.dart';
import 'package:frontend/screens/settings_screen.dart';
import 'package:frontend/widgets/background_circles.dart';
import 'package:frontend/widgets/chatbot_fab.dart';
import '../constants/app_constants.dart';

class CreateCaseScreen extends StatefulWidget {
  const CreateCaseScreen({super.key});

  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _scholarYearController = TextEditingController();

  String _selectedSex = 'male';
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
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      floatingActionButton: const ChatbotFAB(),

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
                          'Informations de l\'Enfant',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppConstants.white
                                : AppConstants.darkViolet,
                          ),
                        ),
                      ),
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon Header
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppConstants.primaryViolet,
                                        AppConstants.lightViolet,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(28),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppConstants.primaryViolet
                                            .withOpacity(0.4),
                                        blurRadius: 25,
                                        offset: const Offset(0, 12),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.child_care_rounded,
                                    size: 50,
                                    color: AppConstants.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Parlez-nous de votre enfant',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? AppConstants.white
                                      : AppConstants.darkViolet,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Veuillez fournir des informations précises pour nous aider à mieux comprendre votre enfant.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark
                                      ? Colors.white60
                                      : Colors.grey[600],
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 32),

                              // First Name
                              _buildModernTextField(
                                controller: _firstNameController,
                                label: 'Prénom',
                                hint: 'Entrez le prénom',
                                icon: Icons.person_rounded,
                                isDark: isDark,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez entrer le prénom';
                                  }
                                  if (value.trim().length < 2) {
                                    return 'Le nom doit contenir au moins 2 caractères';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Last Name
                              _buildModernTextField(
                                controller: _lastNameController,
                                label: 'Nom',
                                hint: 'Entrez le nom',
                                icon: Icons.person_outline_rounded,
                                isDark: isDark,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez entrer le nom';
                                  }
                                  if (value.trim().length < 2) {
                                    return 'Le nom doit contenir au moins 2 caractères';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Sex Dropdown
                              _buildModernDropdown(isDark),
                              const SizedBox(height: 16),

                              // Age
                              _buildModernTextField(
                                controller: _ageController,
                                label: 'Âge',
                                hint: 'Entrez l\'âge',
                                icon: Icons.cake_rounded,
                                isDark: isDark,
                                keyboardType: TextInputType.number,
                                suffixText: 'ans',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer l\'âge';
                                  }
                                  final age = int.tryParse(value);
                                  if (age == null) {
                                    return 'Veuillez entrer un nombre valide';
                                  }
                                  if (age < 3 || age > 18) {
                                    return 'L\'âge doit être entre 3 et 18 ans';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Scholar Year
                              _buildModernTextField(
                                controller: _scholarYearController,
                                label: 'Année Scolaire',
                                hint: 'ex: CP, CE1, 6ème',
                                icon: Icons.school_rounded,
                                isDark: isDark,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez entrer l\'année scolaire';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 32),

                              // Info Box
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppConstants.primaryViolet.withOpacity(
                                        0.1,
                                      ),
                                      AppConstants.lightViolet.withOpacity(0.1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppConstants.primaryViolet
                                        .withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppConstants.primaryViolet
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.info_rounded,
                                        color: AppConstants.primaryViolet,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Ensuite, vous répondrez à une série de questions sur le comportement de votre enfant.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 1.4,
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Continue Button
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: _handleContinue,
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
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Continuer le Dépistage',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: AppConstants.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Icon(
                                            Icons.arrow_forward_rounded,
                                            color: AppConstants.white,
                                            size: 24,
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

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType keyboardType = TextInputType.text,
    String? suffixText,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : AppConstants.darkViolet,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppConstants.primaryViolet.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            textCapitalization: textCapitalization,
            keyboardType: keyboardType,
            style: TextStyle(
              color: isDark ? Colors.white : AppConstants.darkViolet,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: isDark ? Colors.white38 : Colors.grey[400],
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppConstants.primaryViolet.withOpacity(0.2),
                      AppConstants.lightViolet.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppConstants.primaryViolet, size: 20),
              ),
              suffixText: suffixText,
              suffixStyle: TextStyle(
                color: isDark ? Colors.white60 : Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
              filled: true,
              fillColor: isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppConstants.primaryViolet.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppConstants.primaryViolet.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppConstants.primaryViolet,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  Widget _buildModernDropdown(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Sexe',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : AppConstants.darkViolet,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppConstants.primaryViolet.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: _selectedSex,
            style: TextStyle(
              color: isDark ? Colors.white : AppConstants.darkViolet,
              fontSize: 15,
            ),
            dropdownColor: isDark ? Colors.grey[850] : Colors.white,
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppConstants.primaryViolet.withOpacity(0.2),
                      AppConstants.lightViolet.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.wc_rounded,
                  color: AppConstants.primaryViolet,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppConstants.primaryViolet.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppConstants.primaryViolet.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppConstants.primaryViolet,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'male', child: Text('Garçon')),
              DropdownMenuItem(value: 'female', child: Text('Fille')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedSex = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
