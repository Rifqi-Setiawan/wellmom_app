import 'package:intl/intl.dart';

/// Utility class for date formatting
class DateFormatter {
  DateFormatter._();

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  /// Format DateTime to DD/MM/YYYY string
  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  /// Parse DD/MM/YYYY string to DateTime
  static DateTime? parseDate(String dateString) {
    try {
      return _dateFormat.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Format DateTime to YYYY-MM-DD string for API
  static String formatDateForApi(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
