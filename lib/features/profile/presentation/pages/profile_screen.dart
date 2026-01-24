import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 4;

  // TODO: Get from login response or user state
  final String userName = 'Aarushi Sharma';
  final String userEmail = 'aarushi.sharma@email.com';

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed(AppRouter.home);
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(AppRouter.history);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(AppRouter.monitor);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(AppRouter.konsul);
        break;
      case 4:
        // Already on profile
        break;
    }
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Clear token and user data
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.loginIbuHamil,
                (route) => false,
              );
            },
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile & Settings',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section (Centered) - Same background as scaffold
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: _buildUserProfileSection(),
              ),
            ),
            const SizedBox(height: 8),
            
            // ACCOUNT Section
            _buildSectionHeader('ACCOUNT'),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Edit Personal Information',
                    onTap: () {
                      // TODO: Navigate to edit personal information
                    },
                    isFirst: true,
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.favorite_outline,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Health Profile',
                    onTap: () {
                      // TODO: Navigate to health profile
                    },
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.local_hospital_outlined,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Pindah Puskesmas',
                    onTap: () {
                      // TODO: Navigate to change puskesmas
                    },
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.qr_code_scanner,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Undang Kerabat',
                    onTap: () {
                      // TODO: Navigate to invite relative
                    },
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // SETTINGS Section
            _buildSectionHeader('SETTINGS'),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _buildMenuItem(
                icon: Icons.notifications_outlined,
                iconBgColor: const Color(0xFFE3F2FD),
                title: 'Notification Preferences',
                onTap: () {
                  // TODO: Navigate to notification preferences
                },
                isFirst: true,
                isLast: true,
              ),
            ),
            const SizedBox(height: 24),
            
            // SECURITY & PRIVACY Section
            _buildSectionHeader('SECURITY & PRIVACY'),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.lock_outline,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Change Password',
                    onTap: () {
                      // TODO: Navigate to change password
                    },
                    isFirst: true,
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.shield_outlined,
                    iconBgColor: const Color(0xFFE3F2FD),
                    title: 'Privacy Policy',
                    onTap: () {
                      // TODO: Navigate to privacy policy
                    },
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _handleLogout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE8E8),
                    foregroundColor: const Color(0xFFE53935),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Color(0xFFE53935),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE53935),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildUserProfileSection() {
    return Column(
      children: [
        // Avatar with edit icon
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
                image: const DecorationImage(
                  image: AssetImage('assets/images/onboarding_pregnant_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // User Name
        Text(
          userName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        // User Email
        Text(
          userEmail,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isFirst ? const Radius.circular(12) : Radius.zero,
        bottom: isLast ? const Radius.circular(12) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            // Icon with background circle
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(width: 16),
            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ),
            // Arrow
            Icon(
              Icons.chevron_right,
              size: 24,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 72),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey.shade200,
      ),
    );
  }
}
