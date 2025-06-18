import 'package:flutter/material.dart';

class ToolChip extends StatelessWidget {
  final Map<String, dynamic> tool;

  const ToolChip({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(tool['icon'], color: Color(0xFF143A52), size: 18),
          const SizedBox(width: 8),
          Text(
            tool['name'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF143A52),
            ),
          ),
        ],
      ),
    );
  }
}
