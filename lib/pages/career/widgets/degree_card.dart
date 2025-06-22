import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class DegreeCard extends StatelessWidget {
  final Map<String, String> degree;

  const DegreeCard({super.key, required this.degree});

  IconData _getIcon() {
    switch (degree['type']) {
      case 'Masters':
        return Icons.school;
      case 'Bachelor':
        return Icons.menu_book;
      case 'Certificate':
        return Icons.verified;
      default:
        return Icons.school;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3EFF3).withOpacity(0.5),
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
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_getIcon(), color: Color(0xFF143A52), size: 22),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 1,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TypeWriter.text(
                  degree['title']!,
                  duration: const Duration(milliseconds: 100),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                    height: 1.3,
                  ),
                ),
                TypeWriter.text(
                  degree['institution']!,
                  duration: const Duration(milliseconds: 30),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: Color(0xFF6E828A)),
                ),
                TypeWriter.text(
                  '${degree['yearStart']!} - ${degree['yearEnd']!}',
                  duration: const Duration(milliseconds: 40),
                  maintainSize: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w500,
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
