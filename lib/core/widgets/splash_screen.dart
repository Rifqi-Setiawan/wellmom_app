import 'package:flutter/material.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

/// Splash Screen widget untuk transisi mulus dari native splash ke Flutter app
/// 
/// Native splash screen akan otomatis ditampilkan saat app launch.
/// Widget ini menampilkan tampilan yang identik dengan native splash untuk 
/// transisi yang seamless, kemudian langsung navigate ke welcome screen 
/// tanpa delay buatan.
/// 
/// Widget ini tetap ada untuk logika pengecekan auth (jika diperlukan di masa depan),
/// namun tampilannya dibuat identik dengan native splash agar transisinya mulus.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Remove native splash screen setelah Flutter app siap
    // Widget ini sudah identik dengan native splash, jadi transisi akan seamless
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Remove native splash segera setelah frame pertama render
        // Tidak perlu delay karena widget ini sudah identik dengan native splash
        FlutterNativeSplash.remove();
        
        // Navigate ke welcome screen setelah native splash di-remove
        // Welcome screen akan menangani logika pengecekan auth
        Navigator.of(context).pushReplacementNamed(AppRouter.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan splash screen yang identik dengan native splash
    // untuk transisi yang seamless tanpa jeda putih
    // Background putih (#FFFFFF) dan logo di tengah sesuai konfigurasi native splash
    
    // Ambil ukuran layar untuk membuat logo responsif
    final screenWidth = MediaQuery.of(context).size.width;
    // Gunakan 55% dari lebar layar untuk ukuran logo (antara 50-60% sesuai permintaan)
    final logoSize = screenWidth * 0.55;
    
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // #FFFFFF
      body: Center(
        child: SizedBox(
          width: logoSize,
          height: logoSize,
          child: Image.asset(
            'assets/images/Logo Wellmom.png',
            fit: BoxFit.contain, // Pastikan logo tidak terpotong, proporsional
          ),
        ),
      ),
    );
  }
}
