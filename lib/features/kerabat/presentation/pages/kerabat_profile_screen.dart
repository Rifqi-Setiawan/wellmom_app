import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/complete_profile_kerabat_screen.dart';

class KerabatProfileScreen extends ConsumerWidget {
  const KerabatProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meAsync = ref.watch(kerabatMeProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(kerabatMeProvider);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: meAsync.when(
          data: (me) {
            if (me == null) {
              return const Padding(
                padding: EdgeInsets.all(48),
                child: Center(child: Text('Gagal memuat profil')),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor:
                              AppColors.primaryBlue.withOpacity(0.2),
                          child: Text(
                            me.fullName.isNotEmpty
                                ? me.fullName.substring(0, 1).toUpperCase()
                                : '?',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          me.fullName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                        if (me.phone != null && me.phone!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            me.phone!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            me.relationType,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ibu Hamil yang Dipantau',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          me.ibuHamilName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              me.canViewRecords
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              size: 18,
                              color: me.canViewRecords
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Lihat rekam kesehatan',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              me.canReceiveNotifications
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              size: 18,
                              color: me.canReceiveNotifications
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Menerima notifikasi',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final updated = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          builder: (_) => const CompleteProfileKerabatScreen(
                            isEditMode: true,
                          ),
                        ),
                      );
                      if (updated == true && context.mounted) {
                        ref.invalidate(kerabatMeProvider);
                      }
                    },
                    icon: const Icon(Icons.edit, size: 20),
                    label: const Text('Edit Profil'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                      side: const BorderSide(color: AppColors.primaryBlue),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => _showLogoutConfirm(context, ref),
                    icon: const Icon(Icons.logout, size: 20),
                    label: const Text('Logout'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.red.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(48),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: Colors.grey.shade600),
                const SizedBox(height: 12),
                Text(
                  'Gagal memuat profil',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => ref.invalidate(kerabatMeProvider),
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text(
          'Apakah Anda yakin ingin keluar? Token akan dihapus dari perangkat.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              final repo = ref.read(kerabatRepositoryProvider);
              final result = await repo.logoutKerabat();
              if (!context.mounted) return;
              result.fold(
                (failure) =>
                    ErrorSnackbar.show(context, failure.message),
                (_) {},
              );
              ref.read(authTokenProvider.notifier).state = null;
              ref.read(kerabatIdProvider.notifier).state = null;
              ref.read(kerabatIbuHamilIdProvider.notifier).state = null;
              ref.read(kerabatIbuHamilNameProvider.notifier).state = null;
              try {
                await AuthStorageService.clearAccessToken();
              } catch (_) {}
              if (!context.mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.loginKerabat,
                (route) => false,
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }
}
