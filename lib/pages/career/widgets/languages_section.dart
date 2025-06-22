import 'package:flutter/material.dart';
import 'language_card.dart';

class LanguagesSection extends StatefulWidget {
  final List<Map<String, String>> languages;
  final VoidCallback? onSectionComplete;

  const LanguagesSection({
    super.key,
    required this.languages,
    this.onSectionComplete,
  });

  @override
  State<LanguagesSection> createState() => _LanguagesSectionState();
}

class _LanguagesSectionState extends State<LanguagesSection> {
  List<bool> showCards = [];
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    showCards = List.filled(widget.languages.length, false);
    _startSequentialAnimation();
  }

  void _startSequentialAnimation() async {
    // Show first card immediately
    if (currentCardIndex < widget.languages.length && mounted) {
      setState(() => showCards[currentCardIndex] = true);
    }
  }

  void _onCardAnimationComplete() {
    // Move to next card when current one finishes
    currentCardIndex++;
    if (currentCardIndex < widget.languages.length && mounted) {
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
            'Languages',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...widget.languages.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, String> language = entry.value;
            return showCards[index]
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: LanguageCard(
                      language: language,
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
