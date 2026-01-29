import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/utils/profile_photo_validator.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/home/presentation/providers/home_providers.dart';

/// Base URL for profile/image assets (API host without /api/v1).
String _profileImageUrl(String? relativePath) {
  if (relativePath == null || relativePath.isEmpty) return '';
  if (relativePath.startsWith('http://') || relativePath.startsWith('https://')) {
    return relativePath;
  }
  const base = 'http://103.191.92.29:8000';
  return '$base$relativePath';
}

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int _currentIndex = 4;
  bool _isUpdatingPhoto = false;

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

  Future<void> _pickAndUpdateProfilePhoto(int ibuHamilId) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      imageQuality: 85,
    );
    if (picked == null || !mounted) return;

    final file = File(picked.path);
    final validationError = ProfilePhotoValidator.validateFile(
      file.path,
      await file.length(),
    );
    if (validationError != null) {
      if (mounted) ErrorSnackbar.show(context, validationError);
      return;
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _ProfilePhotoPreviewDialog(file: file),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _isUpdatingPhoto = true);
    try {
      final ds = ref.read(homeRemoteDataSourceProvider);
      await ds.updateIbuHamilProfilePhoto(ibuHamilId, file);
      ref.invalidate(ibuHamilMeProvider);
      if (mounted) {
        ErrorSnackbar.showSuccess(context, 'Foto profil berhasil diperbarui');
      }
    } catch (e) {
      if (mounted) {
        final message = e is Failure
            ? e.message
            : e.toString().replaceFirst('Exception: ', '');
        ErrorSnackbar.show(context, message);
      }
    } finally {
      if (mounted) setState(() => _isUpdatingPhoto = false);
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
                      Navigator.of(context).pushNamed(AppRouter.undangKerabat);
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
    final ibuAsync = ref.watch(ibuHamilMeProvider);
    final loginState = ref.watch(loginViewModelProvider);
    final email = loginState.loginResponse?.email;

    return ibuAsync.when(
      loading: () => _buildProfilePlaceholder(isLoading: true),
      error: (_, __) => _buildProfilePlaceholder(
        name: 'Ibu Hamil',
        email: email,
      ),
      data: (ibu) {
        final name = ibu?.namaLengkap ?? 'Ibu Hamil';
        final photoUrl = ibu?.profilePhotoUrl;
        final ibuHamilId = ibu?.id;
        return _buildProfileContent(
          name: name,
          email: email,
          profilePhotoUrl: photoUrl,
          onEditPhotoTap: ibuHamilId != null
              ? () => _pickAndUpdateProfilePhoto(ibuHamilId)
              : null,
          isUpdatingPhoto: _isUpdatingPhoto,
        );
      },
    );
  }

  Widget _buildProfilePlaceholder({
    bool isLoading = false,
    String? name,
    String? email,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: isLoading
                  ? const Center(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : const Icon(Icons.person, size: 56, color: Colors.grey),
            ),
            if (!isLoading)
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
                  child: const Icon(Icons.edit, size: 18, color: Colors.white),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name ?? 'Memuat...',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email ?? '-',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileContent({
    required String name,
    String? email,
    String? profilePhotoUrl,
    VoidCallback? onEditPhotoTap,
    bool isUpdatingPhoto = false,
  }) {
    final hasPhoto = profilePhotoUrl != null && profilePhotoUrl.isNotEmpty;
    final imageUrl = hasPhoto ? _profileImageUrl(profilePhotoUrl) : null;
    final canEdit = onEditPhotoTap != null && !isUpdatingPhoto;

    return Column(
      children: [
        GestureDetector(
          onTap: canEdit ? onEditPhotoTap : null,
          child: Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                ),
                child: ClipOval(
                  child: isUpdatingPhoto
                      ? Container(
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        )
                      : imageUrl != null
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.person, size: 56, color: Colors.grey),
                              ),
                            )
                          : Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.person, size: 56, color: Colors.grey),
                            ),
                ),
              ),
              if (!isUpdatingPhoto)
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
                    child: const Icon(Icons.edit, size: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email ?? '-',
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

/// Dialog to preview picked image and confirm upload.
class _ProfilePhotoPreviewDialog extends StatelessWidget {
  const _ProfilePhotoPreviewDialog({required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ubah Foto Profil'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              file,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Gunakan foto ini sebagai foto profil?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Batal'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
          ),
          child: const Text('Unggah'),
        ),
      ],
    );
  }
}
