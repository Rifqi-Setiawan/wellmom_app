import 'package:flutter/material.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FlutterNativeSplash.remove();
        Navigator.of(context).pushReplacementNamed(AppRouter.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final minDimension = screenWidth < screenHeight ? screenWidth : screenHeight;
    final calculatedSize = minDimension * 0.35;
    final logoSize = calculatedSize > 250 ? 250.0 : calculatedSize;
    final paddingSize = logoSize * 0.15;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: SizedBox(
            width: logoSize,
            height: logoSize,
            child: Image.asset(
              'assets/images/Logo Wellmom.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
