/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/history/data/models/health_records_response_model.dart';
import 'package:wellmom_app/features/history/presentation/providers/history_providers.dart';
import 'package:wellmom_app/features/history/presentation/viewmodels/history_view_model.dart';
        : '${void _formatNumber(record.weight, fractionDigits = 1)} kg';
    return records.first.heartRate?.toString() ?? '-';
  }

  Widget _buildCategoryTab(String category) {
    final isSelected = _selectedCategory == category;
    String label = category;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primaryBlue : Colors.grey.shade200,
                width: isSelected ? 3 : 1,
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.primaryBlue : Colors.grey.shade500,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    final data = _getChartData();
    final maxValue = data.reduce(math.max);
    final minValue = data.reduce(math.min);
    final days = ['SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN'];

    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            size: Size.infinite,
            painter: ChartPainter(
              data: data,
              maxValue: maxValue,
              minValue: minValue,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days.map((day) {
            return Text(
              day,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildEntryItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String value,
    required String unit,
    required String time,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        unit,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.circle,
                  size: 8,
                  color: statusColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/history/data/models/health_records_response_model.dart';
import 'package:wellmom_app/features/history/presentation/providers/history_providers.dart';
import 'package:wellmom_app/features/history/presentation/viewmodels/history_view_model.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  int _currentIndex = 1;
  DateTime _selectedDate = DateTime.now();
  final PageController _entryPageController = PageController();
  int _entryPageIndex = 0;
  late AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    Future.microtask(_fetchData);

    // Listen for app lifecycle changes
    _lifecycleListener = AppLifecycleListener(
      onResume: _handleAppResumed,
    );
  }

  @override
  void dispose() {
    _entryPageController.dispose();
    _lifecycleListener.dispose();
    super.dispose();
  }

  void _handleAppResumed() {
    // Auto-refresh data when user returns to this screen
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _fetchData();
      }
    });
  }

  void _fetchData() {
    final ibuHamilId = ref.read(ibuHamilIdProvider);
    ref.read(historyViewModelProvider.notifier).fetchHealthRecordsByDate(
      ibuHamilId: ibuHamilId,
      checkupDate: _selectedDate,
    );
  }

  DateTime _getMondayOfWeek(DateTime date) {
    int daysToSubtract = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysToSubtract);
  }

  List<DateTime> _getWeekDates() {
    DateTime monday = _getMondayOfWeek(_selectedDate);
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed(AppRouter.home);
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(AppRouter.monitor);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(AppRouter.konsul);
        break;
      case 4:
        Navigator.of(context).pushReplacementNamed(AppRouter.profile);
        break;
    }
  }

  double _getRecordCardHeight() {
    final height = MediaQuery.of(context).size.height * 0.72;
    return height.clamp(520.0, 760.0).toDouble();
  }

  String _formatDateString(String dateStr) {
    final parsed = DateTime.tryParse(dateStr);
    if (parsed == null) return dateStr;
    return DateFormat('dd MMM yyyy', 'id_ID').format(parsed.toLocal());
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(dateTime.toLocal());
  }

  String _formatNumber(num? value, {int fractionDigits = 1}) {
    if (value == null) return '-';
    return value.toDouble().toStringAsFixed(fractionDigits);
  }

  String _formatText(String? value) {
    if (value == null || value.trim().isEmpty) return '-';
    return value;
  }

  Widget _buildHistoryEntryList(HistoryState historyState) {
    final records = historyState.recordsData?.records ?? [];
    if (records.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          'Belum ada data pemeriksaan di tanggal ini.',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
      );
    }

    if (records.length == 1) {
      return _buildRecordDetailsCard(records.first);
    }

    final cardHeight = _getRecordCardHeight();
    return Column(
      children: [
        SizedBox(
          height: cardHeight,
          child: PageView.builder(
            controller: _entryPageController,
            onPageChanged: (index) {
              setState(() {
                _entryPageIndex = index;
              });
            },
            itemCount: records.length,
            itemBuilder: (context, index) {
              return _buildRecordDetailsCard(records[index]);
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(records.length, (index) {
            final isActive = index == _entryPageIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primaryBlue : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRecordDetailsCard(HealthRecordByDateModel record) {
    final bloodPressure = record.bloodPressureSystolic != null &&
            record.bloodPressureDiastolic != null
        ? '${record.bloodPressureSystolic}/${record.bloodPressureDiastolic} mmHg'
        : '-';
    final bloodGlucose = record.bloodGlucose == null
        ? '-'
        : '${_formatNumber(record.bloodGlucose, fractionDigits: 0)} mg/dL';
    final bodyTemperature = record.bodyTemperature == null
        ? '-'
        : '${_formatNumber(record.bodyTemperature, fractionDigits: 1)} °C';
    final heartRate = record.heartRate == null ? '-' : '${record.heartRate} bpm';
    final fetalHeartRate =
        record.fetalHeartRate == null ? '-' : '${record.fetalHeartRate} bpm';
    final fundalHeight = record.fundalHeight == null
        ? '-'
        : '${_formatNumber(record.fundalHeight, fractionDigits: 1)} cm';
    final upperArmCircumference = record.upperArmCircumference == null
        ? '-'
        : '${_formatNumber(record.upperArmCircumference, fractionDigits: 1)} cm';
    final weight = record.weight == null
        ? '-'
        : '${_formatNumber(record.weight, fractionDigits: 1)} kg';
    final hemoglobin = record.hemoglobin == null
        ? '-'
        : '${_formatText(record.hemoglobin)} g/dL';
    final gestationalAge = record.gestationalAgeWeeks == null &&
            record.gestationalAgeDays == null
        ? '-'
        : '${record.gestationalAgeWeeks ?? 0} minggu ${record.gestationalAgeDays ?? 0} hari';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pemeriksaan ${_formatDateString(record.checkupDate)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDateTime(record.createdAt),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'TERCATAT',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDetailSection(
            'Informasi Pemeriksaan',
            [
              _buildDetailRow(
                icon: Icons.event,
                label: 'Tanggal Pemeriksaan',
                value: _formatDateString(record.checkupDate),
                iconColor: const Color(0xFF42A5F5),
                iconBgColor: const Color(0xFFE3F2FD),
              ),
              _buildDetailRow(
                icon: Icons.badge,
                label: 'Diperiksa Oleh',
                value: _formatText(record.checkedBy),
                iconColor: const Color(0xFF7E57C2),
                iconBgColor: const Color(0xFFEDE7F6),
              ),
              _buildDetailRow(
                icon: Icons.confirmation_number,
                label: 'ID Pemeriksaan',
                value: record.id.toString(),
                iconColor: const Color(0xFF616161),
                iconBgColor: const Color(0xFFF5F5F5),
              ),
              _buildDetailRow(
                icon: Icons.person,
                label: 'ID Ibu Hamil',
                value: record.ibuHamilId.toString(),
                iconColor: const Color(0xFF26A69A),
                iconBgColor: const Color(0xFFE0F2F1),
              ),
              _buildDetailRow(
                icon: Icons.medical_services,
                label: 'ID Perawat',
                value: record.perawatId?.toString() ?? '-',
                iconColor: const Color(0xFFEF5350),
                iconBgColor: const Color(0xFFFFEBEE),
              ),
              _buildDetailRow(
                icon: Icons.schedule,
                label: 'Dibuat',
                value: _formatDateTime(record.createdAt),
                iconColor: const Color(0xFF5C6BC0),
                iconBgColor: const Color(0xFFE8EAF6),
              ),
              _buildDetailRow(
                icon: Icons.update,
                label: 'Diperbarui',
                value: _formatDateTime(record.updatedAt),
                iconColor: const Color(0xFF26C6DA),
                iconBgColor: const Color(0xFFE0F7FA),
              ),
            ],
          ),
          _buildDetailSection(
            'Parameter Kesehatan',
            [
              _buildDetailRow(
                icon: Icons.monitor_heart,
                label: 'Tekanan Darah',
                value: bloodPressure,
                iconColor: const Color(0xFFE53935),
                iconBgColor: const Color(0xFFFFEBEE),
              ),
              _buildDetailRow(
                icon: Icons.water_drop,
                label: 'Gula Darah',
                value: bloodGlucose,
                iconColor: const Color(0xFF43A047),
                iconBgColor: const Color(0xFFE8F5E9),
              ),
              _buildDetailRow(
                icon: Icons.thermostat,
                label: 'Suhu Tubuh',
                value: bodyTemperature,
                iconColor: const Color(0xFFFB8C00),
                iconBgColor: const Color(0xFFFFF3E0),
              ),
              _buildDetailRow(
                icon: Icons.favorite,
                label: 'Detak Jantung',
                value: heartRate,
                iconColor: const Color(0xFFE91E63),
                iconBgColor: const Color(0xFFFCE4EC),
              ),
              _buildDetailRow(
                icon: Icons.child_friendly,
                label: 'Denyut Jantung Janin',
                value: fetalHeartRate,
                iconColor: const Color(0xFFEC407A),
                iconBgColor: const Color(0xFFFCE4EC),
              ),
              _buildDetailRow(
                icon: Icons.height,
                label: 'Tinggi Fundus',
                value: fundalHeight,
                iconColor: const Color(0xFF5C6BC0),
                iconBgColor: const Color(0xFFE8EAF6),
              ),
              _buildDetailRow(
                icon: Icons.fitness_center,
                label: 'Lingkar Lengan Atas',
                value: upperArmCircumference,
                iconColor: const Color(0xFF00897B),
                iconBgColor: const Color(0xFFE0F2F1),
              ),
              _buildDetailRow(
                icon: Icons.monitor_weight,
                label: 'Berat Badan',
                value: weight,
                iconColor: const Color(0xFF8D6E63),
                iconBgColor: const Color(0xFFEFEBE9),
              ),
              _buildDetailRow(
                icon: Icons.bloodtype,
                label: 'Hemoglobin',
                value: hemoglobin,
                iconColor: const Color(0xFFD32F2F),
                iconBgColor: const Color(0xFFFFEBEE),
              ),
              _buildDetailRow(
                icon: Icons.science,
                label: 'Protein Urin',
                value: _formatText(record.proteinUrin),
                iconColor: const Color(0xFF7E57C2),
                iconBgColor: const Color(0xFFEDE7F6),
              ),
              _buildDetailRow(
                icon: Icons.calendar_month,
                label: 'Usia Kehamilan',
                value: gestationalAge,
                iconColor: const Color(0xFF1E88E5),
                iconBgColor: const Color(0xFFE3F2FD),
              ),
            ],
          ),
          _buildDetailSection(
            'Keluhan & Catatan',
            [
              _buildDetailRow(
                icon: Icons.report_problem,
                label: 'Keluhan',
                value: _formatText(record.complaints),
                iconColor: const Color(0xFFFFA726),
                iconBgColor: const Color(0xFFFFF3E0),
              ),
              _buildDetailRow(
                icon: Icons.sticky_note_2,
                label: 'Catatan',
                value: _formatText(record.notes),
                iconColor: const Color(0xFF607D8B),
                iconBgColor: const Color(0xFFECEFF1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        ..._withDividers(items),
        const SizedBox(height: 12),
      ],
    );
  }

  List<Widget> _withDividers(List<Widget> items) {
    final widgets = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      widgets.add(items[i]);
      if (i != items.length - 1) {
        widgets.add(Divider(color: Colors.grey.shade200, height: 16));
      }
    }
    return widgets;
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(historyViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Riwayat Kesehatan',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(historyViewModelProvider.notifier).refreshHealthRecords(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('MMMM yyyy').format(_selectedDate),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                            ).then((date) {
                              if (date != null) {
                                setState(() {
                                  _selectedDate = date;
                                });
                                _fetchData();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: const Text(
                            'KALENDER',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildWeekDays(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Detail Pemeriksaan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (historyState.isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (historyState.error != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Ibu hamil tidak melakukan pengecekan pada hari itu.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else
              _buildHistoryEntryList(historyState),
            const SizedBox(height: 100),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildWeekDays() {
    final weekDates = _getWeekDates();
    final days = ['SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN'];
    final today = DateTime.now();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final date = weekDates[index];
        final isSelected = date.year == _selectedDate.year &&
            date.month == _selectedDate.month &&
            date.day == _selectedDate.day;
        final isToday = date.year == today.year &&
            date.month == today.month &&
            date.day == today.day;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              _fetchData();
            },
            child: Column(
              children: [
                Text(
                  days[index],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                    shape: BoxShape.circle,
                    border: isToday && !isSelected
                        ? Border.all(color: AppColors.primaryBlue, width: 2)
                        : !isSelected
                            ? Border.all(color: Colors.grey.shade200, width: 1)
                            : null,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
