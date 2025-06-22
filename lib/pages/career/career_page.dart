import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';
import 'widgets/professional_experience_section.dart';
import 'widgets/education_section.dart';
import 'widgets/languages_section.dart';
import 'widgets/publications_section.dart';
import 'widgets/fun_projects_section.dart';
import 'widgets/tools_and_frameworks_section.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  int currentSectionIndex = 0;
  List<bool> showSections = [];

  @override
  void initState() {
    super.initState();
    showSections = List.filled(6, false); // 6 sections total

    _controllers = List.generate(
      6, // Number of sections
      (index) => AnimationController(
        duration: const Duration(
          milliseconds: 600,
        ), // Faster entrance animation
        vsync: this,
      ),
    );

    _animations = _controllers
        .map(
          (controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        )
        .toList();

    _startAnimations();
  }

  void _startAnimations() async {
    // Start first section immediately
    if (currentSectionIndex < showSections.length && mounted) {
      setState(() => showSections[currentSectionIndex] = true);
      _controllers[currentSectionIndex].forward();
    }
  }

  void _onSectionComplete() {
    // Move to next section when current one finishes
    currentSectionIndex++;
    if (currentSectionIndex < showSections.length && mounted) {
      setState(() => showSections[currentSectionIndex] = true);
      _controllers[currentSectionIndex].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
            const SizedBox(height: 48),
            // Main Content - Split Layout with Animated Sections
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Half - Experience, Publications, and Tools
                  Expanded(
                    child: Column(
                      children: [
                        // Experience (Animation Index 0)
                        if (showSections[0])
                          AnimatedBuilder(
                            animation: _animations[0],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[0].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[0].value,
                                  child: ProfessionalExperienceSection(
                                    professionalExperience:
                                        professionalExperience,
                                    onSectionComplete: currentSectionIndex == 0
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        if (showSections[0]) const SizedBox(height: 32),
                        // Publications (Animation Index 3)
                        if (showSections[3])
                          AnimatedBuilder(
                            animation: _animations[3],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[3].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[3].value,
                                  child: PublicationsSection(
                                    publications: publications,
                                    onSectionComplete: currentSectionIndex == 3
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        if (showSections[3]) const SizedBox(height: 32),
                        // Tools (Animation Index 5)
                        if (showSections[5])
                          AnimatedBuilder(
                            animation: _animations[5],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[5].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[5].value,
                                  child: ToolsAndFrameworksSection(
                                    toolsAndFrameworks: toolsAndFrameworks,
                                    onSectionComplete: currentSectionIndex == 5
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
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
                        // Education (Animation Index 1)
                        if (showSections[1])
                          AnimatedBuilder(
                            animation: _animations[1],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[1].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[1].value,
                                  child: EducationSection(
                                    degrees: degrees,
                                    onSectionComplete: currentSectionIndex == 1
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        if (showSections[1]) const SizedBox(height: 32),
                        // Languages (Animation Index 2)
                        if (showSections[2])
                          AnimatedBuilder(
                            animation: _animations[2],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[2].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[2].value,
                                  child: LanguagesSection(
                                    languages: languages,
                                    onSectionComplete: currentSectionIndex == 2
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        if (showSections[2]) const SizedBox(height: 32),
                        // Fun Projects (Animation Index 4)
                        if (showSections[4])
                          AnimatedBuilder(
                            animation: _animations[4],
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  50 * (1 - _animations[4].value),
                                ),
                                child: Opacity(
                                  opacity: _animations[4].value,
                                  child: FunProjectsSection(
                                    funProjects: funProjects,
                                    onSectionComplete: currentSectionIndex == 4
                                        ? _onSectionComplete
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
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
