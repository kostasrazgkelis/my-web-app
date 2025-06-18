import 'package:flutter/material.dart';
import 'publication_card.dart';

class PublicationsSection extends StatelessWidget {
  final List<Map<String, String>> publications;

  const PublicationsSection({super.key, required this.publications});

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
            'Academic Publications',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...publications.map(
            (publication) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PublicationCard(publication: publication),
            ),
          ),
        ],
      ),
    );
  }
}
