import 'package:flutter/material.dart';
import 'language_card.dart';

class LanguagesSection extends StatelessWidget {
  final List<Map<String, String>> languages;

  const LanguagesSection({super.key, required this.languages});

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
          ...languages.map(
            (language) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: LanguageCard(language: language),
            ),
          ),
        ],
      ),
    );
  }
}
