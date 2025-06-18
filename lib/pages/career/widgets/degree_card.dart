import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3EFF3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(_getIcon(), color: Color(0xFF143A52), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree['title']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  degree['institution']!,
                  style: TextStyle(fontSize: 14, color: Color(0xFF6E828A)),
                ),
                const SizedBox(height: 2),
                Text(
                  '${degree['yearStart']!} - ${degree['yearEnd']!}',
                  style: TextStyle(
                    fontSize: 12,
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
