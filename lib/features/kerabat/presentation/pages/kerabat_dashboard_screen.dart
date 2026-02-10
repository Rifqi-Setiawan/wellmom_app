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
                // Hero Section - Profile Ibu
                _buildHeroSection(context, data),
                const SizedBox(height: 16),
                // Status Indicator - Risk Status
                _buildRiskStatusCard(context, data),
                const SizedBox(height: 16),
                // Risk Alert Banner (if any)
                if (data.riskAlert != null && data.riskAlert!.isNotEmpty) ...[
                  _buildRiskAlertBanner(context, data.riskAlert!),
                  const SizedBox(height: 16),
                ],
                // Grid Menu - Summary Vitals
                _buildVitalsGrid(context, data),
                const SizedBox(height: 16),
                // Latest Health Record Card
                _buildLatestHealthRecordCard(context, data),
                const SizedBox(height: 16),
                // Emergency Contact Card
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

  /// Hero Section with gradient background and profile info
  Widget _buildHeroSection(BuildContext context, dynamic data) {
    final ibu = data.ibuHamil;
    final usiaText = (ibu.usiaKehamilanMinggu != null || ibu.usiaKehamilanHari != null)
        ? '${ibu.usiaKehamilanMinggu ?? 0} minggu ${ibu.usiaKehamilanHari ?? 0} hari'
        : '-';
    final hplText = ibu.tanggalTaksiranPersalinan != null
        ? DateFormatter.formatDate(ibu.tanggalTaksiranPersalinan!)
        : '-';
    final hplDate = ibu.tanggalTaksiranPersalinan;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryBlue,
            AppColors.primaryBlue.withOpacity(0.7),
            AppColors.gradientStart.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Avatar
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.pregnant_woman,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Age
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ibu.namaLengkap,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Usia kehamilan: $usiaText',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // HPL Badge
            if (hplDate != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.event,
                      size: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari Perkiraan Lahir',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          hplText,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Risk Status Card with visual indicator
  Widget _buildRiskStatusCard(BuildContext context, dynamic data) {
    final ibu = data.ibuHamil;
    final riskLevel = ibu.riskLevel?.toLowerCase() ?? '';
    final riskColor = KerabatRiskColors.getRiskColor(ibu.riskLevel);
    final riskLabel = ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty
        ? ibu.riskLevel!.toUpperCase()
        : 'BELUM DINILAI';
    
    // Determine status details
    String statusText;
    IconData statusIcon;
    Color backgroundColor;
    
    switch (riskLevel) {
      case 'rendah':
        statusText = 'Kondisi Ibu dalam keadaan baik';
        statusIcon = Icons.check_circle;
        backgroundColor = Colors.green.shade50;
        break;
      case 'sedang':
        statusText = 'Perlu perhatian lebih';
        statusIcon = Icons.info;
        backgroundColor = Colors.orange.shade50;
        break;
      case 'tinggi':
        statusText = 'Perlu perhatian khusus';
        statusIcon = Icons.warning;
        backgroundColor = Colors.red.shade50;
        break;
      default:
        statusText = 'Belum ada penilaian risiko';
        statusIcon = Icons.help_outline;
        backgroundColor = Colors.grey.shade100;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: InkWell(
        onTap: ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty
            ? () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const KerabatRiskStatusScreen(),
                  ),
                );
              }
            : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: riskColor.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Status Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: riskColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  statusIcon,
                  color: riskColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              // Status Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Status Risiko',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty)
                          const SizedBox(width: 8),
                        if (ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: riskColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              riskLabel,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              if (ibu.riskLevel != null && ibu.riskLevel!.isNotEmpty)
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiskAlertBanner(BuildContext context, String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red.shade200,
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.red.shade700,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                color: Colors.red.shade900,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Vitals Grid - Summary of latest vitals
  Widget _buildVitalsGrid(BuildContext context, dynamic data) {
    final record = data.latestHealthRecord;
    if (record == null) {
      return const SizedBox.shrink();
    }

    final vitals = <Map<String, dynamic>>[];
    
    if (record.bloodPressureSystolic != null) {
      vitals.add({
        'label': 'Tekanan Darah',
        'value': '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic ?? "-"}',
        'unit': 'mmHg',
        'icon': Icons.favorite,
        'color': Colors.red.shade400,
      });
    }
    
    if (record.weight != null) {
      vitals.add({
        'label': 'Berat Badan',
        'value': record.weight!.toStringAsFixed(1),
        'unit': 'kg',
        'icon': Icons.monitor_weight,
        'color': AppColors.primaryBlue,
      });
    }
    
    if (record.heartRate != null) {
      vitals.add({
        'label': 'Detak Jantung',
        'value': record.heartRate.toString(),
        'unit': 'bpm',
        'icon': Icons.favorite_border,
        'color': Colors.pink.shade400,
      });
    }

    if (vitals.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: vitals.length,
      itemBuilder: (context, index) {
        final vital = vitals[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: (vital['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        vital['icon'] as IconData,
                        color: vital['color'] as Color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vital['label'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          vital['value'] as String,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          vital['unit'] as String,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLatestHealthRecordCard(BuildContext context, dynamic data) {
    final record = data.latestHealthRecord;
    if (record == null) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 48,
                  color: AppColors.textLight,
                ),
                SizedBox(height: 12),
                Text(
                  'Belum ada data pemeriksaan terbaru',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final dateStr = record.checkupDate != null
        ? DateFormatter.formatDate(record.checkupDate!)
        : '-';

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pemeriksaan Terbaru',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: AppColors.primaryBlue,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        dateStr,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (record.checkedBy != null) ...[
              _detailRow('Diperiksa oleh', record.checkedBy!),
              const SizedBox(height: 12),
            ],
            if (record.bodyTemperature != null)
              _detailRow('Suhu tubuh', '${record.bodyTemperature} °C'),
            if (record.complaints != null && record.complaints!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Colors.orange.shade700,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keluhan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            record.complaints!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.orange.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onViewRiwayat ?? () => ErrorSnackbar.show(context, 'Buka tab Riwayat'),
                icon: const Icon(Icons.history, size: 18),
                label: const Text('Lihat Riwayat Lengkap'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.emergency,
                    color: Colors.red.shade600,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Kontak Darurat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (contact.perawatName != null) ...[
              _contactRow(
                context,
                icon: Icons.person,
                label: contact.perawatName!,
                sub: contact.perawatPhone,
                isPhone: true,
              ),
              const SizedBox(height: 12),
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
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: AppColors.primaryBlue),
            ),
            const SizedBox(width: 12),
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
                  if (sub != null && sub.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      sub,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (isPhone)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.call,
                  size: 20,
                  color: Colors.green,
                ),
              ),
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
          width: 120,
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
