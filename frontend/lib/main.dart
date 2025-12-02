import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_constants.dart';
import 'providers/auth_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/user_type_selection_screen.dart';
import 'screens/register_screen.dart';
import 'screens/parent_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadUserFromPrefs()),
      ],
      child: MaterialApp(
        title: 'Mind Bloom',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppConstants.primaryViolet,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.primaryViolet,
          ),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const UserTypeSelectionScreen(),
          '/register/doctor': (context) => const RegisterScreen(userType: 'doctor'),
          '/register/parent': (context) => const RegisterScreen(userType: 'parent'),
          '/parent-home': (context) => const ParentHomeScreen(),
          // Add more routes for doctor home, create case, etc.
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        if (authProvider.isAuthenticated) {
          if (authProvider.user!.isParent) {
            return const ParentHomeScreen();
          } else {
            // Return doctor home screen when implemented
            return const ParentHomeScreen(); // Placeholder
          }
        }
        return const WelcomeScreen();
      },
    );
  }
}