import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/utils/kerabat_ui_utils.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_risk_status_screen.dart';

class KerabatDashboardScreen extends ConsumerWidget {
  const KerabatDashboardScreen({super.key, this.onViewRiwayat});

  final VoidCallback? onViewRiwayat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(kerabatDashboardProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(kerabatDashboardProvider);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: dashboardAsync.when(
          data: (data) {
            if (data == null) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildIbuHamilCard(context, data),
                if (data.riskAlert != null && data.riskAlert!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _buildRiskAlertBanner(context, data.riskAlert!),
                ],
                const SizedBox(height: 12),
                _buildLatestHealthRecordCard(context, data),
                const SizedBox(height: 12),
                _buildEmergencyContactCard(context, data),
                const SizedBox(height: 24),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(48),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.grey.shade600),
                  const SizedBox(height: 12),
                  Text(
                    'Gagal memuat dashboard',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => ref.invalidate(kerabatDashboardProvider),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIbuHamilCard(BuildContext context, dynamic data) {
    final ibu = data.ibuHamil;
    final riskColor = KerabatRiskColors.getRiskColor(ibu.riskLevel);
    final riskLabel = ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty
        ? ibu.riskLevel!.toUpperCase()
        : '-';
    final usiaText = (ibu.usiaKehamilanMinggu != null || ibu.usiaKehamilanHari != null)
        ? '${ibu.usiaKehamilanMinggu ?? 0} minggu ${ibu.usiaKehamilanHari ?? 0} hari'
        : '-';
    final hplText = ibu.tanggalTaksiranPersalinan != null
        ? DateFormatter.formatDate(ibu.tanggalTaksiranPersalinan!)
        : '-';

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.pregnant_woman,
                    color: AppColors.primaryBlue,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ibu.namaLengkap,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Usia kehamilan: $usiaText',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _detailRow('HPL', hplText),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Status risiko: ',
                  style: TextStyle(fontSize: 13, color: AppColors.textDark),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: riskColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    riskLabel,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: riskColor,
                    ),
                  ),
                ),
              ],
            ),
            if (ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const KerabatRiskStatusScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Lihat Status Risiko'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRiskAlertBanner(BuildContext context, String message) {
    return Material(
      color: Colors.red.shade50,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestHealthRecordCard(BuildContext context, dynamic data) {
    final record = data.latestHealthRecord;
    if (record == null) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              'Belum ada data pemeriksaan terbaru',
              style: TextStyle(color: AppColors.textLight, fontSize: 13),
            ),
          ),
        ),
      );
    }

    final dateStr = record.checkupDate != null
        ? DateFormatter.formatDate(record.checkupDate!)
        : '-';

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pemeriksaan Terbaru',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            _detailRow('Tanggal', dateStr),
            if (record.bloodPressureSystolic != null)
              _detailRow(
                'Tekanan darah',
                '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic ?? "-"} mmHg',
              ),
            if (record.heartRate != null)
              _detailRow('Detak jantung', '${record.heartRate} bpm'),
            if (record.bodyTemperature != null)
              _detailRow('Suhu tubuh', '${record.bodyTemperature} °C'),
            if (record.weight != null)
              _detailRow('Berat badan', '${record.weight} kg'),
            if (record.complaints != null && record.complaints!.isNotEmpty)
              _detailRow('Keluhan', record.complaints!),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onViewRiwayat ?? () => ErrorSnackbar.show(context, 'Buka tab Riwayat'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryBlue,
                  side: const BorderSide(color: AppColors.primaryBlue),
                ),
                child: const Text('Lihat Riwayat Lengkap'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContactCard(BuildContext context, dynamic data) {
    final contact = data.emergencyContact;
    if (contact == null) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kontak Darurat',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            if (contact.perawatName != null) ...[
              _contactRow(
                context,
                icon: Icons.person,
                label: contact.perawatName!,
                sub: contact.perawatPhone,
                isPhone: true,
              ),
              const SizedBox(height: 10),
            ],
            if (contact.puskesmasName != null) ...[
              _contactRow(
                context,
                icon: Icons.local_hospital,
                label: contact.puskesmasName!,
                sub: contact.puskesmasAddress ?? contact.puskesmasPhone,
                isPhone: contact.puskesmasPhone != null,
                phone: contact.puskesmasPhone,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _contactRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    String? sub,
    bool isPhone = false,
    String? phone,
  }) {
    return InkWell(
      onTap: () async {
        final tel = phone ?? sub;
        if (tel != null && tel.isNotEmpty) {
          final uri = Uri(scheme: 'tel', path: tel.replaceAll(' ', ''));
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: AppColors.primaryBlue),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                      fontSize: 14,
                    ),
                  ),
                  if (sub != null && sub.isNotEmpty)
                    Text(
                      sub,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                ],
              ),
            ),
            if (isPhone)
              const Icon(Icons.call, size: 20, color: AppColors.primaryBlue),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }
}
