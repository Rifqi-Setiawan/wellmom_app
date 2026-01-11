import 'package:flutter/material.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_quota_model.dart';

/// Widget to display remaining quota
class QuotaIndicator extends StatelessWidget {
  final ChatbotQuotaModel? quota;

  const QuotaIndicator({
    super.key,
    required this.quota,
  });

  @override
  Widget build(BuildContext context) {
    if (quota == null) {
      return const SizedBox.shrink();
    }

    final remaining = quota!.remaining;
    final limit = quota!.limit;
    final percentage = remaining / limit;

    Color indicatorColor;
    if (percentage > 0.5) {
      indicatorColor = Colors.green;
    } else if (percentage > 0.2) {
      indicatorColor = Colors.orange;
    } else {
      indicatorColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: indicatorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bolt,
            size: 16,
            color: indicatorColor,
          ),
          const SizedBox(width: 6),
          Text(
            'Sisa: $remaining/$limit',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
