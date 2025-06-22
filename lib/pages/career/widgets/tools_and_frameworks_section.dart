import 'package:flutter/material.dart';
import 'tool_chip.dart';

class ToolsAndFrameworksSection extends StatefulWidget {
  final List<Map<String, dynamic>> toolsAndFrameworks;
  final VoidCallback? onSectionComplete;

  const ToolsAndFrameworksSection({
    super.key,
    required this.toolsAndFrameworks,
    this.onSectionComplete,
  });

  @override
  State<ToolsAndFrameworksSection> createState() =>
      _ToolsAndFrameworksSectionState();
}

class _ToolsAndFrameworksSectionState extends State<ToolsAndFrameworksSection> {
  List<bool> showChips = [];

  @override
  void initState() {
    super.initState();
    showChips = List.filled(widget.toolsAndFrameworks.length, false);
    _startSequentialAnimation();
  }

  void _startSequentialAnimation() async {
    for (int i = 0; i < widget.toolsAndFrameworks.length; i++) {
      if (mounted) {
        setState(() => showChips[i] = true);
        // Wait 150ms before showing next chip (tools are just names)
        await Future.delayed(const Duration(milliseconds: 150));
      }
    }

    // Notify parent that this section is complete
    if (widget.onSectionComplete != null) {
      widget.onSectionComplete!();
    }
  }

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
            children: widget.toolsAndFrameworks.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> tool = entry.value;
              return showChips[index]
                  ? ToolChip(tool: tool)
                  : const SizedBox.shrink();
            }).toList(),
          ),
        ],
      ),
    );
  }
}
