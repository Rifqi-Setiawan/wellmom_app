import 'package:flutter/material.dart';
import 'package:wellmom_app/features/auth/presentation/pages/confirm_puskesmas_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/login_ibu_hamil_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/medical_data_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/register_ibu_hamil_screen.dart';
import 'package:wellmom_app/features/auth/presentation/pages/select_puskesmas_screen.dart';
import 'package:wellmom_app/features/chat/presentation/pages/konsul_chat_screen.dart';
import 'package:wellmom_app/features/chatbot/presentation/pages/chatbot_screen.dart';
import 'package:wellmom_app/features/forum/presentation/pages/forum_post_detail_screen.dart';
import 'package:wellmom_app/features/forum/presentation/pages/forum_reply_screen.dart';
import 'package:wellmom_app/features/forum/presentation/pages/forum_screen.dart';
import 'package:wellmom_app/features/history/presentation/pages/history_screen.dart';
import 'package:wellmom_app/features/home/presentation/pages/home_screen.dart';
import 'package:wellmom_app/features/konsul/presentation/pages/konsul_screen.dart';
import 'package:wellmom_app/features/monitor/presentation/pages/monitor_screen.dart';
import 'package:wellmom_app/features/onboarding/welcome_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/complete_profile_kerabat_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_shell_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/login_kerabat_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/undang_kerabat_screen.dart';
import 'package:wellmom_app/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:wellmom_app/features/profile/presentation/pages/health_profile_screen.dart';
import 'package:wellmom_app/features/profile/presentation/pages/profile_screen.dart';

/// App routing configuration
class AppRouter {
  AppRouter._();

  /// Global navigator key for navigation from services/outside of widget tree
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
  static const String editProfile = '/edit-profile';
  static const String healthProfile = '/health-profile';
  static const String chatbot = '/chatbot';
  static const String forum = '/forum';
  static const String forumPostDetail = '/forum-post-detail';
  static const String forumReply = '/forum-reply';

  /// Chat dengan Perawat (Konsul) - args: KonsulChatArgs or Map (conversationId, perawatId, perawatName, perawatPhotoUrl).
  static const String konsulChat = '/konsul-chat';

  // Kerabat (Undang Kerabat, Login Kerabat, Complete Profile, Kerabat Home)
  static const String undangKerabat = '/undang-kerabat';
  static const String loginKerabat = '/login-kerabat';
  static const String completeProfileKerabat = '/complete-profile-kerabat';
  static const String kerabatHome = '/kerabat-home';

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
        return _noAnimationRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case history:
        return _noAnimationRoute(
          builder: (_) => const HistoryScreen(),
          settings: settings,
        );
      case monitor:
        return _noAnimationRoute(
          builder: (_) => const MonitorScreen(),
          settings: settings,
        );
      case konsul:
        return _noAnimationRoute(
          builder: (_) => const KonsulScreen(),
          settings: settings,
        );
      case profile:
        return _noAnimationRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      case editProfile:
        return MaterialPageRoute<bool?>(
          builder: (_) => const EditProfileScreen(),
          settings: settings,
        );
      case healthProfile:
        return MaterialPageRoute<bool?>(
          builder: (_) => const HealthProfileScreen(),
          settings: settings,
        );
      case chatbot:
        return MaterialPageRoute(
          builder: (_) => const ChatbotScreen(),
          settings: settings,
        );
      case forum:
        return MaterialPageRoute(
          builder: (_) => const ForumScreen(),
          settings: settings,
        );
      case forumPostDetail:
        final postId = settings.arguments as int?;
        if (postId == null) {
          return MaterialPageRoute(
            builder: (_) => const WelcomeScreen(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => ForumPostDetailScreen(postId: postId),
          settings: settings,
        );
      case forumReply:
        final postId = settings.arguments as int?;
        if (postId == null) {
          return MaterialPageRoute(
            builder: (_) => const WelcomeScreen(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => ForumReplyScreen(postId: postId),
          settings: settings,
        );
      case konsulChat:
        final args = KonsulChatArgs.fromDynamic(settings.arguments);
        return MaterialPageRoute(
          builder: (_) => KonsulChatScreen(args: args),
          settings: settings,
        );
      case undangKerabat:
        return MaterialPageRoute(
          builder: (_) => const UndangKerabatScreen(),
          settings: settings,
        );
      case loginKerabat:
        return MaterialPageRoute(
          builder: (_) => const LoginKerabatScreen(),
          settings: settings,
        );
      case completeProfileKerabat:
        return MaterialPageRoute(
          builder: (_) => const CompleteProfileKerabatScreen(),
          settings: settings,
        );
      case kerabatHome:
        return MaterialPageRoute(
          builder: (_) => const KerabatShellScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
    }
  }

  /// Create a route without animation for instant navigation
  static PageRoute<T> _noAnimationRoute<T>({
    required Widget Function(BuildContext) builder,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
