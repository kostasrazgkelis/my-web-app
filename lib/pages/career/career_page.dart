import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';
import 'widgets/professional_experience_section.dart';
import 'widgets/education_section.dart';
import 'widgets/languages_section.dart';
import 'widgets/publications_section.dart';
import 'widgets/fun_projects_section.dart';
import 'widgets/tools_and_frameworks_section.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  // Data dictionaries
  static const List<Map<String, dynamic>> professionalExperience = [
    {
      'title': 'Senior Software Develop23er',
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
  static const List<Map<String, String>> publications = [
    {
      'title':
          'Modern Flutter Development: Best Practices for Web Applications',
      'publisher': 'IEEE Computer Society',
      'year': '2023',
      'url': 'https://example.com/publication1',
    },
    {
      'title':
          'Cross-Platform Mobile Development with Flutter: A Comprehensive Study',
      'publisher': 'ACM Digital Library',
      'year': '2022',
      'url': 'https://example.com/publication2',
    },
    {
      'title': 'Responsive Web Design Patterns in Modern Frameworks',
      'publisher': 'Journal of Web Development',
      'year': '2021',
      'url': 'https://example.com/publication3',
    },
  ];
  static const List<Map<String, String>> funProjects = [
    {
      'title': 'Portfolio Weather App',
      'description':
          'A beautiful weather application built with Flutter featuring real-time weather data, animated backgrounds, and location-based forecasts.',
      'url': 'https://github.com/yourprofile/weather-app',
    },
    {
      'title': 'Recipe Finder',
      'description':
          'Interactive recipe discovery platform with ingredient-based search, meal planning, and nutritional information using modern web technologies.',
      'url': 'https://github.com/yourprofile/recipe-finder',
    },
    {
      'title': 'Task Management Dashboard',
      'description':
          'Collaborative task management tool with real-time updates, team collaboration features, and productivity analytics.',
      'url': 'https://github.com/yourprofile/task-dashboard',
    },
  ];
  static const List<Map<String, dynamic>> toolsAndFrameworks = [
    {'name': 'Flutter', 'icon': Icons.flutter_dash},
    {'name': 'React', 'icon': Icons.web},
    {'name': 'Node.js', 'icon': Icons.dns},
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'JavaScript', 'icon': Icons.javascript},
    {'name': 'TypeScript', 'icon': Icons.code_outlined},
    {'name': 'Firebase', 'icon': Icons.cloud},
    {'name': 'Git', 'icon': Icons.source},
    {'name': 'Docker', 'icon': Icons.inventory_2},
    {'name': 'MongoDB', 'icon': Icons.storage},
    {'name': 'PostgreSQL', 'icon': Icons.table_chart},
    {'name': 'AWS', 'icon': Icons.cloud_upload},
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
            const SizedBox(height: 48), // Main Content - Split Layout
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Half - Professional Experience, Publications, and Tools
                  Expanded(
                    child: Column(
                      children: [
                        ProfessionalExperienceSection(
                          professionalExperience: professionalExperience,
                        ),
                        const SizedBox(height: 32),
                        PublicationsSection(publications: publications),
                        const SizedBox(height: 32),
                        ToolsAndFrameworksSection(
                          toolsAndFrameworks: toolsAndFrameworks,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ), // Right Half - Education, Languages, and Fun Projects
                  Expanded(
                    child: Column(
                      children: [
                        // Education
                        EducationSection(degrees: degrees),
                        const SizedBox(height: 32),
                        // Languages
                        LanguagesSection(languages: languages),
                        const SizedBox(height: 32),
                        // Fun Projects
                        FunProjectsSection(funProjects: funProjects),
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
          'My Career Journey',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF143A52),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Experience, Education & Skills Overview',
          style: TextStyle(fontSize: 20, color: Color(0xFF6E828A)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
