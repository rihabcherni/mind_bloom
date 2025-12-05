import 'package:flutter/material.dart';
import 'package:frontend/providers/settings_provider.dart';
import 'package:frontend/screens/about_screen.dart';
import 'package:frontend/screens/loading_screen.dart';
import 'package:provider/provider.dart';
import 'constants/app_constants.dart';
import 'providers/auth_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/user_type_selection_screen.dart';
import 'screens/register_screen.dart';
import 'screens/parent_home_screen.dart';
import 'screens/doctor_home_screen.dart';
import 'screens/create_case_screen.dart';
import 'screens/chatbot_screening_screen.dart';
import 'screens/case_details_screen.dart';
import 'screens/doctor_case_details_screen.dart';
import 'screens/notifications_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsProvider = SettingsProvider();
  await settingsProvider.loadSettings();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settingsProvider),
        ChangeNotifierProvider(
          create: (_) => AuthProvider()..loadUserFromPrefs(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, _) {
        return MaterialApp(
          title: 'Mind Bloom',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: AppConstants.primaryViolet,
            scaffoldBackgroundColor: AppConstants.lightBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppConstants.primaryViolet,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: AppConstants.primaryViolet,
            scaffoldBackgroundColor: AppConstants.darkBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppConstants.primaryViolet,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: settings.themeMode,
          locale: settings.locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const AuthWrapper(),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/welcome':
                return MaterialPageRoute(builder: (_) => const WelcomeScreen());
              case '/about':
                return MaterialPageRoute(builder: (_) => const AboutScreen());
              case '/login':
                return MaterialPageRoute(builder: (_) => const LoginScreen());
              case '/register':
                return MaterialPageRoute(
                  builder: (_) => const UserTypeSelectionScreen(),
                );
              case '/register/doctor':
                return MaterialPageRoute(
                  builder: (_) => const RegisterScreen(userType: 'doctor'),
                );
              case '/register/parent':
                return MaterialPageRoute(
                  builder: (_) => const RegisterScreen(userType: 'parent'),
                );
              case '/parent-home':
                return MaterialPageRoute(
                  builder: (_) => const ParentHomeScreen(),
                );
              case '/doctor-home':
                return MaterialPageRoute(
                  builder: (_) => const DoctorHomeScreen(),
                );
              case '/create-case':
                return MaterialPageRoute(
                  builder: (_) => const CreateCaseScreen(),
                );
              case '/chatbot-screening':
                final args = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (_) => ChatbotScreeningScreen(childInfo: args),
                );
              case '/case-details':
                final caseId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => CaseDetailsScreen(caseId: caseId),
                );
              case '/doctor-case-details':
                final caseId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => DoctorCaseDetailsScreen(caseId: caseId),
                );
              case '/notifications':
                return MaterialPageRoute(
                  builder: (_) => const NotificationsScreen(),
                );
              default:
                return null;
            }
          },
        );
      },
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
            return const DoctorHomeScreen();
          }
        }
        return const SplashScreen();
      },
    );
  }
}
