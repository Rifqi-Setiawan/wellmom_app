import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/widgets/kerabat_bottom_nav_bar.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_dashboard_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_health_records_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_notifications_screen.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_profile_screen.dart';

class KerabatShellScreen extends ConsumerStatefulWidget {
  const KerabatShellScreen({super.key});

  @override
  ConsumerState<KerabatShellScreen> createState() => _KerabatShellScreenState();
}

class _KerabatShellScreenState extends ConsumerState<KerabatShellScreen> {
  int _currentIndex = 0;

  static const _titles = ['Dashboard', 'Riwayat', 'Notifikasi', 'Profil'];

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(kerabatDashboardProvider);
    final unreadCount = dashboardAsync.valueOrNull?.unreadNotificationsCount ?? 0;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              _currentIndex == 0 && dashboardAsync.valueOrNull != null
                  ? (dashboardAsync.valueOrNull!.kerabatName)
                  : _titles[_currentIndex],
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            if (_currentIndex == 0 && unreadCount > 0) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _currentIndex = 2),
                child: Badge(
                  label: Text(
                    unreadCount > 99 ? '99+' : '$unreadCount',
                    style: const TextStyle(fontSize: 10),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: AppColors.textDark,
                    size: 24,
                  ),
                ),
              ),
            ],
          ],
        ),
        centerTitle: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          KerabatDashboardScreen(
            onViewRiwayat: () => setState(() => _currentIndex = 1),
          ),
          const KerabatHealthRecordsScreen(),
          const KerabatNotificationsScreen(),
          const KerabatProfileScreen(),
        ],
      ),
      bottomNavigationBar: KerabatBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
