import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';
import 'package:wellmom_app/features/kerabat/domain/repositories/kerabat_repository.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';

class UndangKerabatScreen extends ConsumerStatefulWidget {
  const UndangKerabatScreen({super.key});

  @override
  ConsumerState<UndangKerabatScreen> createState() => _UndangKerabatScreenState();
}

class _UndangKerabatScreenState extends ConsumerState<UndangKerabatScreen> {
  InviteCodeResponse? _currentInvite;
  bool _isGenerating = false;
  bool _copyFeedback = false;

  Future<void> _generateInvite() async {
    setState(() => _isGenerating = true);
    final repo = ref.read(kerabatRepositoryProvider);
    final result = await repo.generateInviteCode();
    if (!mounted) return;
    result.fold(
      (failure) {
        ErrorSnackbar.show(context, failure.message);
        setState(() => _isGenerating = false);
      },
      (data) {
        setState(() {
          _currentInvite = data;
          _isGenerating = false;
        });
      },
    );
  }

  void _copyCode() {
    if (_currentInvite == null) return;
    Clipboard.setData(ClipboardData(text: _currentInvite!.inviteCode));
    setState(() => _copyFeedback = true);
    ErrorSnackbar.showSuccess(context, 'Kode disalin ke clipboard');
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _copyFeedback = false);
    });
  }

  Future<void> _shareCode() async {
    if (_currentInvite == null) return;
    await Share.share(
      'Undang Kerabat WellMom\nKode undangan: ${_currentInvite!.inviteCode}\nBerlaku 24 jam. Masuk sebagai kerabat di aplikasi WellMom.',
      subject: 'Kode Undangan WellMom',
    );
  }

  String _formatCountdown(DateTime expiresAt) {
    final now = DateTime.now();
    if (expiresAt.isBefore(now)) return 'Kadaluarsa';
    final diff = expiresAt.difference(now);
    final hours = diff.inHours;
    final minutes = diff.inMinutes.remainder(60);
    return '${hours}j ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final kerabatListAsync = ref.watch(myKerabatListProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Undang Kerabat',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            // Ilustrasi/icon keluarga
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.people_alt_rounded,
                  size: 64,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Ajak kerabat untuk mengikuti perkembangan kehamilan Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 32),

            if (_currentInvite == null) ...[
              CustomButton(
                text: 'Generate Kode Undangan',
                onPressed: _isGenerating ? null : _generateInvite,
                isLoading: _isGenerating,
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
              ),
            ] else ...[
              // Kode undangan card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Kode Undangan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      _currentInvite!.inviteCode,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Berlaku: ${_formatCountdown(_currentInvite!.expiresAt)}',
                          style: TextStyle(
                            fontSize: 13,
                            color: _currentInvite!.expiresAt.isBefore(DateTime.now())
                                ? Colors.red
                                : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _copyFeedback ? null : _copyCode,
                            icon: Icon(
                              _copyFeedback ? Icons.check : Icons.copy_rounded,
                              size: 20,
                              color: AppColors.primaryBlue,
                            ),
                            label: Text(
                              _copyFeedback ? 'Tersalin' : 'Salin Kode',
                              style: const TextStyle(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.primaryBlue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _shareCode,
                            icon: const Icon(Icons.share_rounded, size: 20),
                            label: const Text('Bagikan'),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara menggunakan',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1. Bagikan kode undangan ke kerabat (Suami, Ibu, Ayah, dll).\n'
                      '2. Kerabat buka aplikasi WellMom dan pilih "Login sebagai Kerabat".\n'
                      '3. Masukkan kode undangan. Kode berlaku 24 jam.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  setState(() => _currentInvite = null);
                },
                child: const Text('Generate kode baru'),
              ),
            ],

            const SizedBox(height: 32),
            // Daftar kerabat terhubung
            const Text(
              'Kerabat Terhubung',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            kerabatListAsync.when(
              data: (list) {
                if (list.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(24),
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
                    child: Row(
                      children: [
                        Icon(Icons.people_outline, size: 40, color: Colors.grey.shade400),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Belum ada kerabat terhubung. Generate kode dan bagikan ke kerabat.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) =>
                      _KerabatListItem(item: list[index]),
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              error: (err, _) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Gagal memuat daftar kerabat. Coba lagi.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _KerabatListItem extends StatelessWidget {
  const _KerabatListItem({required this.item});

  final MyKerabatItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.relationType ?? 'Kerabat',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Terhubung',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
