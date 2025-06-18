import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final Map<String, dynamic> job;

  const ExperienceCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF143A52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(job['icon'], color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job['company'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job['period'],
                  style: TextStyle(fontSize: 14, color: Color(0xFF6E828A)),
                ),
                const SizedBox(height: 8),
                Text(
                  job['description'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
