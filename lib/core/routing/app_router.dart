import 'package:flutter/material.dart';
import 'package:wellmom_app/features/auth/presentation/pages/confirm_puskesmas_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/login_ibu_hamil_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/medical_data_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/register_ibu_hamil_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/select_puskesmas_screen.dart';
import 'package:wellmom_app/features/history/presentation/pages/history_screen.dart';
import 'package:wellmom_app/features/home/presentation/pages/home_screen.dart';
import 'package:wellmom_app/features/konsul/presentation/pages/konsul_screen.dart';
import 'package:wellmom_app/features/monitor/presentation/pages/monitor_screen.dart';
import 'package:wellmom_app/features/onboarding/welcome_screen.dart';
import 'package:wellmom_app/features/profile/presentation/pages/profile_screen.dart';

/// App routing configuration
class AppRouter {
  AppRouter._();

  static const String welcome = '/';
  static const String loginIbuHamil = '/login-ibu-hamil';
  static const String registerIbuHamil = '/register-ibu-hamil';
  static const String medicalData = '/medical-data';
  static const String selectPuskesmas = '/select-puskesmas';
  static const String confirmPuskesmas = '/confirm-puskesmas';
  static const String expectingLogin = '/expecting-login';
  
  // Main navigation routes
  static const String home = '/home';
  static const String history = '/history';
  static const String monitor = '/monitor';
  static const String konsul = '/konsul';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case loginIbuHamil:
        return MaterialPageRoute(
          builder: (_) => const LoginIbuHamilScreen(),
          settings: settings,
        );
      case registerIbuHamil:
        return MaterialPageRoute(
          builder: (_) => const RegisterIbuHamilScreen(),
          settings: settings,
        );
      case medicalData:
        return MaterialPageRoute(
          builder: (_) => const MedicalDataScreen(),
          settings: settings,
        );
      case selectPuskesmas:
        return MaterialPageRoute(
          builder: (_) => const SelectPuskesmasScreen(),
          settings: settings,
        );
      case confirmPuskesmas:
        return MaterialPageRoute(
          builder: (_) => const ConfirmPuskesmasScreen(),
          settings: settings,
        );
      case expectingLogin:
        return MaterialPageRoute(
          builder: (_) => const LoginIbuHamilScreen(), // TODO: Create ExpectingLoginScreen
          settings: settings,
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case history:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
          settings: settings,
        );
      case monitor:
        return MaterialPageRoute(
          builder: (_) => const MonitorScreen(),
          settings: settings,
        );
      case konsul:
        return MaterialPageRoute(
          builder: (_) => const KonsulScreen(),
          settings: settings,
        );
      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
    }
  }
}
