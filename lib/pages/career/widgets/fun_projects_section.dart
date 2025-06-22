import 'package:flutter/material.dart';
import 'fun_project_card.dart';

class FunProjectsSection extends StatefulWidget {
  final List<Map<String, String>> funProjects;
  final VoidCallback? onSectionComplete;

  const FunProjectsSection({
    super.key,
    required this.funProjects,
    this.onSectionComplete,
  });

  @override
  State<FunProjectsSection> createState() => _FunProjectsSectionState();
}

class _FunProjectsSectionState extends State<FunProjectsSection> {
  List<bool> showCards = [];
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    showCards = List.filled(widget.funProjects.length, false);
    _startSequentialAnimation();
  }

  void _startSequentialAnimation() async {
    // Show first card immediately
    if (currentCardIndex < widget.funProjects.length && mounted) {
      setState(() => showCards[currentCardIndex] = true);
    }
  }

  void _onCardAnimationComplete() {
    // Move to next card when current one finishes
    currentCardIndex++;
    if (currentCardIndex < widget.funProjects.length && mounted) {
      setState(() => showCards[currentCardIndex] = true);
    } else if (widget.onSectionComplete != null) {
      // All cards in this section are complete
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
            'Fun Projects',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...widget.funProjects.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, String> project = entry.value;
            return showCards[index]
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: FunProjectCard(
                      project: project,
                      onAnimationComplete: index == currentCardIndex
                          ? _onCardAnimationComplete
                          : null,
                    ),
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
