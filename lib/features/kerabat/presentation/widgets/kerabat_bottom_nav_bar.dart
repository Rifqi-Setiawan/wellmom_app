import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';

/// Bottom navigation for Kerabat: Dashboard, Riwayat, Notifikasi, Profil
class KerabatBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const KerabatBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(context, 0, Icons.dashboard_outlined, 'Dashboard'),
              _buildItem(context, 1, Icons.history, 'Riwayat'),
              _buildItem(context, 2, Icons.notifications_outlined, 'Notifikasi'),
              _buildItem(context, 3, Icons.person_outline, 'Profil'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
  ) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
