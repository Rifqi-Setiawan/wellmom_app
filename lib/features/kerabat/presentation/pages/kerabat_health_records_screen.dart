import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_health_records_response_model.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_health_record_detail_screen.dart';
import 'package:intl/intl.dart';

class KerabatHealthRecordsScreen extends ConsumerStatefulWidget {
  const KerabatHealthRecordsScreen({super.key});

  @override
  ConsumerState<KerabatHealthRecordsScreen> createState() =>
      _KerabatHealthRecordsScreenState();
}

class _KerabatHealthRecordsScreenState
    extends ConsumerState<KerabatHealthRecordsScreen> {
  int _page = 1;
  static const _perPage = 10;
  final _scrollController = ScrollController();
  List<KerabatHealthRecordItemModel> _allRecords = [];
  int _total = 0;
  bool _loadingMore = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _loadingMore || !_hasMore) return;
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore) return;
    if (_allRecords.length >= _total) {
      setState(() => _hasMore = false);
      return;
    }
    setState(() => _loadingMore = true);
    final repo = ref.read(kerabatRepositoryProvider);
    final nextPage = _page + 1;
    final result = await repo.getHealthRecords(page: nextPage, perPage: _perPage);
    result.fold(
      (_) => setState(() => _loadingMore = false),
      (data) {
        setState(() {
          _allRecords.addAll(data.records);
          _page = nextPage;
          _total = data.total;
          _loadingMore = false;
          _hasMore = data.records.length >= _perPage;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const initialParams = (page: 1, perPage: _perPage);
    final recordsAsync = ref.watch(kerabatHealthRecordsProvider(initialParams));

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(kerabatHealthRecordsProvider(initialParams));
        setState(() {
          _page = 1;
          _allRecords = [];
          _total = 0;
          _hasMore = true;
        });
      },
      child: recordsAsync.when(
        data: (data) {
          if (_allRecords.isEmpty && data.records.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _allRecords = List.from(data.records);
                  _total = data.total;
                  _hasMore = data.records.length >= _perPage;
                });
              }
            });
          }
          final listToShow =
              _allRecords.isNotEmpty ? _allRecords : data.records;
          final hasMore =
              _allRecords.isNotEmpty
                  ? _hasMore
                  : data.records.length >= _perPage;

          if (listToShow.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 48),
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.medical_services_outlined,
                          size: 56, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        'Belum ada riwayat pemeriksaan',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: listToShow.length + (hasMore ? 1 : 0),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index >= listToShow.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              }
              final record = listToShow[index];
              return _HealthRecordCard(
                record: record,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => KerabatHealthRecordDetailScreen(
                        recordId: record.id,
                      ),
                    ),
                  );
                },
              );
            },
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
                'Gagal memuat riwayat',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () =>
                    ref.invalidate(kerabatHealthRecordsProvider(initialParams)),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Health Record Card with Timeline Style
class _HealthRecordCard extends StatelessWidget {
  const _HealthRecordCard({
    required this.record,
    required this.onTap,
  });

  final KerabatHealthRecordItemModel record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final checkupDate = record.checkupDate != null
        ? DateTime.tryParse(record.checkupDate!)
        : null;
    
    final hasComplaint =
        record.complaints != null && record.complaints!.trim().isNotEmpty;
    
    // Determine status based on complaints
    final statusColor = hasComplaint ? Colors.orange : Colors.green;
    final statusText = hasComplaint ? 'Perlu Perhatian' : 'Normal';
    final statusIcon = hasComplaint ? Icons.warning_amber_rounded : Icons.check_circle;

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Date Section (Left)
              if (checkupDate != null) ...[
                _buildTimelineDate(checkupDate),
                const SizedBox(width: 16),
              ],
              // Main Content (Center)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location/Checked By
                    if (record.checkedBy != null) ...[
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              record.checkedBy!,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    // Vitals Summary
                    if (record.bloodPressureSystolic != null ||
                        record.heartRate != null ||
                        record.weight != null) ...[
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          if (record.bloodPressureSystolic != null)
                            _buildVitalChip(
                              icon: Icons.favorite,
                              label: '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic ?? "-"}',
                              unit: 'mmHg',
                              color: Colors.red.shade400,
                            ),
                          if (record.heartRate != null)
                            _buildVitalChip(
                              icon: Icons.favorite_border,
                              label: record.heartRate.toString(),
                              unit: 'bpm',
                              color: Colors.pink.shade400,
                            ),
                          if (record.weight != null)
                            _buildVitalChip(
                              icon: Icons.monitor_weight,
                              label: record.weight!.toStringAsFixed(1),
                              unit: 'kg',
                              color: AppColors.primaryBlue,
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    // Status Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: statusColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            statusIcon,
                            size: 14,
                            color: statusColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Chevron Icon (Right)
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Timeline Date Widget (Calendar Style)
  Widget _buildTimelineDate(DateTime date) {
    final dayFormat = DateFormat('d');
    final monthFormat = DateFormat('MMM', 'id');
    
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryBlue.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayFormat.format(date),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            monthFormat.format(date).toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  /// Vital Chip Widget
  Widget _buildVitalChip({
    required IconData icon,
    required String label,
    required String unit,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 2),
          Text(
            unit,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
