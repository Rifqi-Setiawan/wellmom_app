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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Separator line
          Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
          // Navigation items
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    index: 0,
                    isSelected: currentIndex == 0,
                    onTap: () => onTap(0),
                  ),
                  _buildNavItem(
                    icon: Icons.history_outlined,
                    label: 'History',
                    index: 1,
                    isSelected: currentIndex == 1,
                    onTap: () => onTap(1),
                  ),
                  _buildNavItem(
                    icon: Icons.radio_button_checked_outlined,
                    label: 'MONITOR',
                    index: 2,
                    isSelected: currentIndex == 2,
                    isCenter: true,
                    onTap: () => onTap(2),
                  ),
                  _buildNavItem(
                    icon: Icons.medical_services_outlined,
                    label: 'Konsul',
                    index: 3,
                    isSelected: currentIndex == 3,
                    onTap: () => onTap(3),
                  ),
                  _buildNavItem(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    index: 4,
                    isSelected: currentIndex == 4,
                    onTap: () => onTap(4),
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
      // Special styling for Monitor (center item)
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.white, width: 2)
                      : null,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : AppColors.textLight,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      );
    } else {
      // Standard nav item
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.primaryBlue : AppColors.textLight,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      );
    }
  }
}
