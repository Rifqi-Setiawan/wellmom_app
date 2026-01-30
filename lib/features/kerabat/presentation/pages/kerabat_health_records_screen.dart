import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_health_records_response_model.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/pages/kerabat_health_record_detail_screen.dart';

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
          return ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: listToShow.length + (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= listToShow.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              }
              final record = listToShow[index];
              return _RecordTile(
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

class _RecordTile extends StatelessWidget {
  const _RecordTile({
    required this.record,
    required this.onTap,
  });

  final KerabatHealthRecordItemModel record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasComplaint =
        record.complaints != null && record.complaints!.trim().isNotEmpty;
    final dateStr = record.checkupDate != null
        ? (DateTime.tryParse(record.checkupDate!) != null
            ? DateFormatter.formatDate(DateTime.parse(record.checkupDate!))
            : (record.checkupDate ?? '-'))
        : '-';

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  hasComplaint ? Icons.warning_amber_rounded : Icons.medical_services_outlined,
                  color: hasComplaint ? Colors.orange : AppColors.primaryBlue,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateStr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Diperiksa: ${record.checkedBy ?? "-"}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    if (record.bloodPressureSystolic != null ||
                        record.heartRate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          [
                            if (record.bloodPressureSystolic != null)
                              '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic ?? "-"} mmHg',
                            if (record.heartRate != null)
                              '${record.heartRate} bpm',
                          ].join(' • '),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textLight),
            ],
          ),
        ),
      ),
    );
  }
}
