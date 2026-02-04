import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';

/// Lightweight date picker dialog untuk menghindari lag saat scroll tahun.
/// Menggunakan ListView.builder dengan itemExtent agar scroll tahun lancar.
class LightweightDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Locale? locale;

  const LightweightDatePickerDialog({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.locale,
  });

  /// Menampilkan dialog dan mengembalikan tanggal yang dipilih, atau null jika dibatalkan.
  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Locale? locale,
  }) {
    final f = firstDate ?? DateTime(2020);
    final l = lastDate ?? DateTime(2030);
    return showDialog<DateTime>(
      context: context,
      builder: (context) => LightweightDatePickerDialog(
        initialDate: initialDate.isAfter(l) ? l : (initialDate.isBefore(f) ? f : initialDate),
        firstDate: f,
        lastDate: l,
        locale: locale,
      ),
    );
  }

  @override
  State<LightweightDatePickerDialog> createState() => _LightweightDatePickerDialogState();
}

class _LightweightDatePickerDialogState extends State<LightweightDatePickerDialog> {
  late int _selectedYear;
  late int _selectedMonth;
  int? _selectedDay;

  static const double _yearItemHeight = 52.0;
  static const int _monthNamesLength = 12;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;
    final d = widget.initialDate.day;
    final lastDay = DateUtils.getDaysInMonth(_selectedYear, _selectedMonth);
    _selectedDay = d <= lastDay ? d : lastDay;
  }

  int get _firstYear => widget.firstDate.year;
  int get _lastYear => widget.lastDate.year;
  int get _yearCount => _lastYear - _firstYear + 1;

  void _onYearSelected(int year) {
    setState(() {
      _selectedYear = year;
      final lastDay = DateUtils.getDaysInMonth(year, _selectedMonth);
      _selectedDay = _selectedDay != null && _selectedDay! <= lastDay
          ? _selectedDay
          : 1;
    });
  }

  void _onMonthSelected(int month) {
    setState(() {
      _selectedMonth = month;
      final lastDay = DateUtils.getDaysInMonth(_selectedYear, month);
      _selectedDay = _selectedDay != null && _selectedDay! <= lastDay
          ? _selectedDay
          : 1;
    });
  }

  void _onDaySelected(int day) {
    setState(() => _selectedDay = day);
  }

  void _confirm() {
    final day = _selectedDay ?? 1;
    final lastDay = DateUtils.getDaysInMonth(_selectedYear, _selectedMonth);
    final safeDay = day.clamp(1, lastDay);
    Navigator.of(context).pop(DateTime(_selectedYear, _selectedMonth, safeDay));
  }

  String _monthName(int month) {
    final date = DateTime(2000, month, 1);
    return DateFormat('MMM', widget.locale?.languageCode ?? 'id').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        content: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pilih Tanggal',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
              ),
              const SizedBox(height: 16),
              // Tahun: ListView.builder dengan itemExtent agar scroll lancar
              Text(
                'Tahun',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: _yearCount,
                  itemExtent: _yearItemHeight,
                  cacheExtent: _yearItemHeight * 3,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) {
                    final year = _firstYear + index;
                    final isSelected = year == _selectedYear;
                    return RepaintBoundary(
                      child: Material(
                        color: isSelected
                            ? AppColors.primaryBlue.withOpacity(0.15)
                            : Colors.transparent,
                        child: InkWell(
                          onTap: () => _onYearSelected(year),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '$year',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                color: isSelected ? AppColors.primaryBlue : AppColors.textDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Bulan: grid 12 item
              Text(
                'Bulan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 6),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 2.2,
                children: List.generate(_monthNamesLength, (index) {
                  final month = index + 1;
                  final isSelected = month == _selectedMonth;
                  return Material(
                    color: isSelected
                        ? AppColors.primaryBlue.withOpacity(0.15)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => _onMonthSelected(month),
                      borderRadius: BorderRadius.circular(8),
                      child: Center(
                        child: Text(
                          _monthName(month),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? AppColors.primaryBlue : AppColors.textDark,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              // Hari: grid untuk bulan terpilih
              Text(
                'Tanggal',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 6),
              _DayGrid(
                year: _selectedYear,
                month: _selectedMonth,
                selectedDay: _selectedDay,
                onDaySelected: _onDaySelected,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Batal',
              style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
            ),
          ),
          FilledButton(
            onPressed: _confirm,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
            ),
            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _DayGrid extends StatelessWidget {
  final int year;
  final int month;
  final int? selectedDay;
  final ValueChanged<int> onDaySelected;

  const _DayGrid({
    required this.year,
    required this.month,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final rowCount = (daysInMonth / 7).ceil();
    final totalHeight = (rowCount * 50.0).clamp(90.0, 230.0);

    return SizedBox(
      height: totalHeight,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          mainAxisExtent: 44,
        ),
        itemCount: daysInMonth,
        itemBuilder: (context, index) {
          final day = index + 1;
          final isSelected = day == selectedDay;
          return Material(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () => onDaySelected(day),
              borderRadius: BorderRadius.circular(8),
              child: Center(
                child: Text(
                  '$day',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.textDark,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
