import 'package:flutter/material.dart';

class MinimalProgressBar extends StatelessWidget {
  final double progress;

  const MinimalProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${(progress * 100).round()}%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE63946),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFF1FAEE),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFE63946),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
