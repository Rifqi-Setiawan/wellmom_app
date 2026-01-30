import 'package:flutter/material.dart';

/// Risk level colors for kerabat UI
class KerabatRiskColors {
  KerabatRiskColors._();

  static Color getRiskColor(String? riskLevel) {
    switch (riskLevel?.toLowerCase()) {
      case 'rendah':
        return Colors.green;
      case 'sedang':
        return Colors.orange;
      case 'tinggi':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static Color getNotificationPriorityColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'urgent':
        return Colors.red;
      case 'high':
        return Colors.orange;
      case 'normal':
        return Colors.blue;
      case 'low':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
