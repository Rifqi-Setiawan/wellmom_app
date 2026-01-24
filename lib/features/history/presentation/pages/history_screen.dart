import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 1;
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'BP'; // BP, Sugar, Temp, HR

  // Dummy data for chart
  final List<double> _bpSystolicData = [118, 125, 120, 130, 115, 128, 120];
  final List<double> _sugarData = [85, 92, 88, 95, 87, 90, 90];
  final List<double> _tempData = [36.2, 36.5, 36.8, 36.4, 36.7, 36.3, 36.5];
  final List<double> _hrData = [72, 78, 75, 80, 73, 76, 75];

  // Get Monday of the week containing the selected date
  DateTime _getMondayOfWeek(DateTime date) {
    // weekday: 1 = Monday, 7 = Sunday
    int daysToSubtract = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysToSubtract);
  }

  // Get list of dates for the week (Monday to Sunday)
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
        // Already on history
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

  List<double> _getChartData() {
    switch (_selectedCategory) {
      case 'Sugar':
        return _sugarData;
      case 'Temp':
        return _tempData;
      case 'HR':
        return _hrData;
      default:
        return _bpSystolicData;
    }
  }

  String _getCurrentValue() {
    switch (_selectedCategory) {
      case 'Sugar':
        return '90';
      case 'Temp':
        return '36.5';
      case 'HR':
        return '75';
      default:
        return '120/80';
    }
  }

  String _getCategoryTitle() {
    switch (_selectedCategory) {
      case 'Sugar':
        return 'GULA DARAH';
      case 'Temp':
        return 'SUHU TUBUH';
      case 'HR':
        return 'DETAK JANTUNG';
      default:
        return 'TEKANAN DARAH';
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  // Month selector with navigation arrows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous week button
                      IconButton(
                        icon: const Icon(Icons.chevron_left, color: AppColors.textDark),
                        onPressed: () {
                          setState(() {
                            _selectedDate = _selectedDate.subtract(const Duration(days: 7));
                          });
                        },
                      ),
                      // Month and year display
                      Expanded(
                        child: Center(
                          child: Text(
                            DateFormat('MMMM yyyy').format(_selectedDate),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                      ),
                      // Next week button
                      IconButton(
                        icon: const Icon(Icons.chevron_right, color: AppColors.textDark),
                        onPressed: () {
                          setState(() {
                            _selectedDate = _selectedDate.add(const Duration(days: 7));
                          });
                        },
                      ),
                      // Calendar button
                      TextButton(
                        onPressed: () {
                          // Show calendar dialog
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
                            }
                          });
                        },
                        child: const Text(
                          'KALENDER',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Week days
                  _buildWeekDays(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Metrics Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMetricSmallCard(
                      icon: Icons.water_drop,
                      iconColor: const Color(0xFF42A5F5),
                      iconBgColor: const Color(0xFFE3F2FD),
                      label: 'Tekanan Darah',
                      value: '120/80',
                      unit: 'mmHg',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricSmallCard(
                      icon: Icons.water_drop,
                      iconColor: const Color(0xFF4CAF50),
                      iconBgColor: const Color(0xFFE8F5E9),
                      label: 'Gula Darah',
                      value: '90',
                      unit: 'mg/dL',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildMetricSmallCard(
                      icon: Icons.thermostat,
                      iconColor: const Color(0xFFFF9800),
                      iconBgColor: const Color(0xFFFFF3E0),
                      label: 'Suhu Tubuh',
                      value: '36.5',
                      unit: '°C',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricSmallCard(
                      icon: Icons.favorite,
                      iconColor: const Color(0xFFE91E63),
                      iconBgColor: const Color(0xFFFCE4EC),
                      label: 'Detak Jantung',
                      value: '75',
                      unit: 'bpm',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Category Tabs
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  _buildCategoryTab('BP'),
                  _buildCategoryTab('Sugar'),
                  _buildCategoryTab('Temp'),
                  _buildCategoryTab('HR'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Chart Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TREN ${_getCategoryTitle()}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _getCurrentValue(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F5E9),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  '↑2%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '7 Hari Terakhir',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Chart
                  SizedBox(
                    height: 150,
                    child: _buildChart(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // History Entries
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Entry',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Entry List
            _buildEntryItem(
              icon: Icons.water_drop,
              iconColor: const Color(0xFF42A5F5),
              iconBgColor: const Color(0xFFE3F2FD),
              value: '122/81',
              unit: 'mmHg',
              time: 'Hari ini, 09:41 AM',
              status: 'NORMAL',
              statusColor: const Color(0xFF4CAF50),
            ),
            _buildEntryItem(
              icon: Icons.water_drop,
              iconColor: const Color(0xFF42A5F5),
              iconBgColor: const Color(0xFFE3F2FD),
              value: '125/85',
              unit: 'mmHg',
              time: 'Kemarin, 10:15 AM',
              status: 'WASPADA',
              statusColor: const Color(0xFFFFA726),
            ),
            const SizedBox(height: 100),
          ],
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
            },
            child: Column(
              children: [
                Text(
                  days[index],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                    shape: BoxShape.circle,
                    border: isToday && !isSelected
                        ? Border.all(
                            color: AppColors.primaryBlue,
                            width: 2,
                          )
                        : !isSelected
                            ? Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              )
                            : null,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 16,
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

  Widget _buildMetricSmallCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String label,
    required String value,
    required String unit,
  }) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE8E8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'TAMBAH',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF6B6B),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
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
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.primaryBlue : Colors.grey.shade500,
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

// Custom painter for the chart
class ChartPainter extends CustomPainter {
  final List<double> data;
  final double maxValue;
  final double minValue;

  ChartPainter({
    required this.data,
    required this.maxValue,
    required this.minValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final pointSpacing = size.width / (data.length - 1);
    final range = maxValue - minValue;

    for (int i = 0; i < data.length; i++) {
      final x = i * pointSpacing;
      final normalizedValue = (data[i] - minValue) / range;
      final y = size.height - (normalizedValue * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Create smooth curve
        final previousX = (i - 1) * pointSpacing;
        final previousNormalizedValue = (data[i - 1] - minValue) / range;
        final previousY = size.height - (previousNormalizedValue * size.height);
        
        final controlPointX1 = previousX + pointSpacing / 3;
        final controlPointY1 = previousY;
        final controlPointX2 = x - pointSpacing / 3;
        final controlPointY2 = y;
        
        path.cubicTo(
          controlPointX1, controlPointY1,
          controlPointX2, controlPointY2,
          x, y,
        );
      }

      // Draw point
      canvas.drawCircle(
        Offset(x, y),
        4,
        Paint()
          ..color = AppColors.primaryBlue
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
