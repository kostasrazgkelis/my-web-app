import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  // Data dictionaries
  static const List<Map<String, dynamic>> professionalExperience = [
    {
      'title': 'Senior Software Developer',
      'company': 'Tech Innovations Ltd.',
      'period': '2022 - Present',
      'description':
          'Leading development of enterprise web applications using Flutter and modern frameworks. Mentoring junior developers and architecting scalable solutions.',
      'icon': Icons.work_outline,
    },
    {
      'title': 'Full Stack Developer',
      'company': 'Digital Solutions Inc.',
      'period': '2020 - 2022',
      'description':
          'Developed and maintained full-stack applications using React, Node.js, and Flutter. Implemented responsive designs and optimized performance.',
      'icon': Icons.code,
    },
    {
      'title': 'Junior Developer',
      'company': 'StartUp Ventures',
      'period': '2018 - 2020',
      'description':
          'Started career focusing on front-end development and user experience design. Contributed to multiple successful mobile and web projects.',
      'icon': Icons.school,
    },
  ];
  static const List<Map<String, String>> degrees = [
    {
      'title': 'Master of Computer Science',
      'institution': 'University of Technology',
      'year': '2018',
      'yearStart': '2016',
      'yearEnd': '2018',
      'type': 'Masters',
    },
    {
      'title': 'Bachelor of Software Engineering',
      'institution': 'Institute of Technology',
      'year': '2016',
      'yearStart': '2012',
      'yearEnd': '2016',
      'type': 'Bachelor',
    },
    {
      'title': 'Flutter Development Certification',
      'institution': 'Google Developers',
      'year': '2020',
      'yearStart': '2020',
      'yearEnd': '2020',
      'type': 'Certificate',
    },
  ];
  static const List<Map<String, String>> languages = [
    {
      'language': 'English',
      'level': 'Native',
      'flag': '🇺🇸',
      'degree': 'Native Speaker',
    },
    {
      'language': 'Spanish',
      'level': 'C2',
      'flag': '🇪🇸',
      'degree': 'Advanced Proficiency',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Career',
      child: Container(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [
            // Header Section
            _buildHeader(),
            const SizedBox(height: 48),

            // Main Content - Split Layout
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Half - Professional Experience
                  Expanded(child: _buildProfessionalExperience()),
                  const SizedBox(width: 48),
                  // Right Half - Education and Languages
                  Expanded(
                    child: Column(
                      children: [
                        // Top Half - Education
                        _buildEducationSection(),
                        const SizedBox(height: 48),
                        // Bottom Half - Languages
                        _buildLanguagesSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Professional Profile',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF143A52),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Experience, Education & Skills Overview',
          style: TextStyle(fontSize: 20, color: Color(0xFF6E828A)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfessionalExperience() {
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
              child: _buildExperienceCard(job),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
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
            'Education & Certifications',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          ...degrees.map(
            (degree) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _buildDegreeCard(degree),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguagesSection() {
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
              child: _buildLanguageCard(language),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Map<String, dynamic> job) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF143A52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(job['icon'], color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job['company'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job['period'],
                  style: TextStyle(fontSize: 14, color: Color(0xFF6E828A)),
                ),
                const SizedBox(height: 8),
                Text(
                  job['description'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDegreeCard(Map<String, String> degree) {
    IconData getIcon() {
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
            child: Icon(getIcon(), color: Color(0xFF143A52), size: 20),
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

  Widget _buildLanguageCard(Map<String, String> language) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Text(language['flag']!, style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language['language']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  language['degree']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF143A52),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    language['level']!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
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
