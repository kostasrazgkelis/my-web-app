import 'package:flutter/material.dart';
import 'experience_card.dart';

class ProfessionalExperienceSection extends StatefulWidget {
  final List<Map<String, dynamic>> professionalExperience;
  final VoidCallback? onSectionComplete;

  const ProfessionalExperienceSection({
    super.key,
    required this.professionalExperience,
    this.onSectionComplete,
  });

  @override
  State<ProfessionalExperienceSection> createState() =>
      _ProfessionalExperienceSectionState();
}

class _ProfessionalExperienceSectionState
    extends State<ProfessionalExperienceSection> {
  List<bool> showCards = [];
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    showCards = List.filled(widget.professionalExperience.length, false);
    _startSequentialAnimation();
  }

  void _startSequentialAnimation() async {
    // Show first card immediately
    if (currentCardIndex < widget.professionalExperience.length && mounted) {
      setState(() => showCards[currentCardIndex] = true);
    }
  }

  void _onCardAnimationComplete() {
    // Move to next card when current one finishes
    currentCardIndex++;
    if (currentCardIndex < widget.professionalExperience.length && mounted) {
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
            'Professional Experience',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...widget.professionalExperience.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> job = entry.value;
            return showCards[index]
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ExperienceCard(
                      job: job,
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
