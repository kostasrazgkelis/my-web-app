import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class ExperienceCard extends StatelessWidget {
  final Map<String, dynamic> job;

  const ExperienceCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF143A52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(job['icon'], color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TypeWriter.text(
                  job['title'],
                  duration: const Duration(milliseconds: 50),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                TypeWriter.text(
                  job['company'],
                  duration: const Duration(milliseconds: 40),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                TypeWriter.text(
                  job['period'],
                  duration: const Duration(milliseconds: 30),
                  maintainSize: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, color: Color(0xFF6E828A)),
                ),
                const SizedBox(height: 8),
                TypeWriter.text(
                  job['description'],
                  duration: const Duration(milliseconds: 20),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
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
