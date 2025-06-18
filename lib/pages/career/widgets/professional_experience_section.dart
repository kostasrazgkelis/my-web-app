import 'package:flutter/material.dart';
import 'experience_card.dart';

class ProfessionalExperienceSection extends StatelessWidget {
  final List<Map<String, dynamic>> professionalExperience;

  const ProfessionalExperienceSection({
    super.key,
    required this.professionalExperience,
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
            'Professional Experience',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...professionalExperience.map(
            (job) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ExperienceCard(job: job),
            ),
          ),
        ],
      ),
    );
  }
}
