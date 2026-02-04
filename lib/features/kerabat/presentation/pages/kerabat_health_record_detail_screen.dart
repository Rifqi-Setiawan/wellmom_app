import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';

class KerabatHealthRecordDetailScreen extends ConsumerStatefulWidget {
  const KerabatHealthRecordDetailScreen({super.key, required this.recordId});

  final int recordId;

  @override
  ConsumerState<KerabatHealthRecordDetailScreen> createState() =>
      _KerabatHealthRecordDetailScreenState();
}

class _KerabatHealthRecordDetailScreenState
    extends ConsumerState<KerabatHealthRecordDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(kerabatRepositoryProvider).getHealthRecordDetail(widget.recordId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Detail Pemeriksaan',
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
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        final result = snapshot.data;
        if (result == null) {
          return _buildScaffold(
            context,
            body: const Center(child: Text('Memuat...')),
          );
        }
        return result.fold(
          (failure) => _buildScaffold(
            context,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(failure.message, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => setState(() {}),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            ),
          ),
          (record) => _buildScaffold(
            context,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _card(
                    'Informasi Pemeriksaan',
                    [
                      _row('Tanggal', record.checkupDate != null
                          ? (DateTime.tryParse(record.checkupDate!) != null
                              ? DateFormatter.formatDate(
                                  DateTime.parse(record.checkupDate!))
                              : record.checkupDate!)
                          : '-'),
                      _row('Diperiksa oleh', record.checkedBy ?? '-'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _card(
                    'Hasil Pemeriksaan',
                    [
                      if (record.bloodPressureSystolic != null)
                        _row('Tekanan darah',
                            '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic ?? "-"} mmHg'),
                      if (record.heartRate != null)
                        _row('Detak jantung', '${record.heartRate} bpm'),
                      if (record.bodyTemperature != null)
                        _row('Suhu tubuh', '${record.bodyTemperature} °C'),
                      if (record.weight != null)
                        _row('Berat badan', '${record.weight} kg'),
                      if (record.hemoglobin != null)
                        _row('Hemoglobin', '${record.hemoglobin} g/dL'),
                    ],
                  ),
                  if (record.complaints != null &&
                      record.complaints!.trim().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _card('Keluhan', [
                      _row('', record.complaints!),
                    ]),
                  ],
                  if (record.notes != null && record.notes!.trim().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _card('Catatan', [_row('', record.notes!)]),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Scaffold _buildScaffold(BuildContext context, {required Widget body}) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Pemeriksaan',
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
      body: body,
    );
  }

  Widget _card(String title, List<Widget> rows) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            SizedBox(
              width: 120,
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
      ),
    );
  }
}
