import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';

/// Reusable bottom navigation bar widget
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
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
      child: Stack(
        clipBehavior: Clip.none, // Allow Monitor icon to overflow
        children: [
          // Separator line
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
          ),
          // Navigation items
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 1, bottom: 8), // Add top padding to account for separator
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildNavItem(
                      icon: Icons.home_outlined,
                      label: 'Home',
                      index: 0,
                      isSelected: currentIndex == 0,
                      onTap: () => onTap(0),
                    ),
                  ),
                  Expanded(
                    child: _buildNavItem(
                      icon: Icons.restore_outlined,
                      label: 'History',
                      index: 1,
                      isSelected: currentIndex == 1,
                      onTap: () => onTap(1),
                    ),
                  ),
                  _buildNavItem(
                    icon: Icons.radio_button_checked_outlined,
                    label: 'MONITOR',
                    index: 2,
                    isSelected: currentIndex == 2,
                    isCenter: true,
                    onTap: () => onTap(2),
                  ),
                  Expanded(
                    child: _buildNavItem(
                      icon: Icons.medical_services_outlined,
                      label: 'Konsul',
                      index: 3,
                      isSelected: currentIndex == 3,
                      onTap: () => onTap(3),
                    ),
                  ),
                  Expanded(
                    child: _buildNavItem(
                      icon: Icons.person_outline,
                      label: 'Profile',
                      index: 4,
                      isSelected: currentIndex == 4,
                      onTap: () => onTap(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
    bool isCenter = false,
  }) {
    if (isCenter) {
      // Special styling for Monitor (center item) - always blue, larger, elevated above navbar
      // Position it to exceed the separator line boundary
      return GestureDetector(
        onTap: onTap,
        child: Transform.translate(
          offset: const Offset(0, -24), // Elevate to exceed separator line (1px separator + 23px above)
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue, // Always blue
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white, // Always white icon on blue background
                    size: 32, // Larger icon size
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue, // Always blue text
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Standard nav item with slightly larger icons
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
                size: 28, // Increased from 24 to 28
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
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
}
