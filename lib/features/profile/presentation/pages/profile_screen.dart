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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile & Settings',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // User Profile Section (Centered)
            _buildUserProfileSection(),
            const SizedBox(height: 32),
            
            // ACCOUNT Section
            _buildSectionHeader('ACCOUNT'),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Edit Personal Information',
              onTap: () {
                // TODO: Navigate to edit personal information
              },
            ),
            _buildMenuItem(
              icon: Icons.favorite_outline,
              title: 'Health Profile',
              onTap: () {
                // TODO: Navigate to health profile
              },
            ),
            _buildMenuItem(
              icon: Icons.local_hospital_outlined,
              title: 'Pindah Puskesmas',
              onTap: () {
                // TODO: Navigate to change puskesmas
              },
            ),
            _buildMenuItem(
              icon: Icons.qr_code_2_outlined,
              title: 'Undang Kerabat',
              onTap: () {
                // TODO: Navigate to invite relative
              },
            ),
            const SizedBox(height: 32),
            
            // SETTINGS Section
            _buildSectionHeader('SETTINGS'),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              onTap: () {
                // TODO: Navigate to notification preferences
              },
            ),
            _buildMenuItem(
              icon: Icons.language_outlined,
              title: 'Language',
              onTap: () {
                // TODO: Navigate to language settings
              },
            ),
            const SizedBox(height: 32),
            
            // SECURITY & PRIVACY Section
            _buildSectionHeader('SECURITY & PRIVACY'),
            const SizedBox(height: 12),
            _buildMenuItem(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                // TODO: Navigate to change password
              },
            ),
            _buildMenuItem(
              icon: Icons.description_outlined,
              title: 'Privacy Policy',
              onTap: () {
                // TODO: Navigate to privacy policy
              },
            ),
            _buildMenuItem(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
              onTap: () {
                // TODO: Navigate to terms & conditions
              },
            ),
            const SizedBox(height: 40),
            
            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleLogout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE5E5), // Light red background
                    foregroundColor: const Color(0xFFDC3545), // Red text
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 20,
                        color: Color(0xFFDC3545),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDC3545),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
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
    return Center(
      child: Column(
        children: [
          // Avatar with edit icon
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryBlue.withOpacity(0.3),
                      AppColors.primaryBlue.withOpacity(0.5),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue, // Solid blue, not transparent
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.white, // White pencil icon on blue background
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // User Name (Centered)
          Text(
            userName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          // User Email (Centered)
          Text(
            userEmail,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: AppColors.textDark,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: AppColors.textLight,
            ),
          ],
        ),
      ),
    );
  }
}
