import 'package:flutter/material.dart';
import 'tool_chip.dart';

class ToolsAndFrameworksSection extends StatelessWidget {
  final List<Map<String, dynamic>> toolsAndFrameworks;

  const ToolsAndFrameworksSection({
    super.key,
    required this.toolsAndFrameworks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools & Frameworks',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: toolsAndFrameworks
                .map((tool) => ToolChip(tool: tool))
                .toList(),
          ),
        ],
      ),
    );
  }
}
