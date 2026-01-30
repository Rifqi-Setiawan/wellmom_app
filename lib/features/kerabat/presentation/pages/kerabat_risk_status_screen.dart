import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/utils/kerabat_ui_utils.dart';

class KerabatRiskStatusScreen extends ConsumerWidget {
  const KerabatRiskStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riskAsync = ref.watch(kerabatRiskStatusProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Status Risiko Kehamilan',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: riskAsync.when(
        data: (data) {
          if (data == null) {
            return const Center(child: Text('Tidak ada data'));
          }
          final riskColor = KerabatRiskColors.getRiskColor(data.riskLevel);
          final isHigh = (data.riskLevel?.toLowerCase() == 'tinggi');

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: riskColor.withOpacity(0.15),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          data.riskLevel?.toUpperCase() ?? '-',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: riskColor,
                          ),
                        ),
                        if (data.riskLevelSetAt != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Ditentukan: ${DateFormatter.formatDate(data.riskLevelSetAt!)}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (data.message != null && data.message!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        data.message!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textDark,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
                if (data.recommendations.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  const Text(
                    'Rekomendasi',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                        children: data.recommendations
                            .map(
                              (rec) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 20,
                                      color: AppColors.primaryBlue,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        rec,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.textDark,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
                if (isHigh) ...[
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () async {
                        // Open phone or show contact - we don't have perawat phone here,
                        // user can get it from dashboard emergency contact
                        final uri = Uri(scheme: 'tel', path: '118');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text('Hubungi Perawat'),
                      style: FilledButton.styleFrom(
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
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.grey.shade600),
              const SizedBox(height: 12),
              Text(
                'Gagal memuat status risiko',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => ref.invalidate(kerabatRiskStatusProvider),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
