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
      'title': 'M.Sc. Data and Web Science',
      'institution': 'Aristotle University of Thessaloniki',
      'year': '2022',
      'yearStart': '2022',
      'yearEnd': 'present',
      'type': 'Masters',
    },
    {
      'title': 'B.Sc. Applied Informatics',
      'institution': 'University of Macedonia',
      'year': '2016',
      'yearStart': '2016',
      'yearEnd': '2022',
      'type': 'Bachelor',
    },
    {
      'title': 'Erasmus: Computer Science',
      'institution': 'University of Derby',
      'year': '2019',
      'yearStart': '2019',
      'yearEnd': '2020',
      'type': 'Derby',
    },
  ];
  static const List<Map<String, String>> languages = [
    {
      'language': 'English',
      'level': 'C2',
      'flag': '🇺🇸',
      'degree': 'Advanced Proficiency',
    },
    {
      'language': 'Greek',
      'level': 'Native',
      'flag': '🇬🇷',
      'degree': 'Native Speaker',
    },
  ];

  static const List<Map<String, String>> publications = [
    {
      'title':
          'PRES^3 : Private Record Linkage Using Services, Spark and Soundex',
      'publisher': 'Springer Nature Link',
      'year': '2023',
      'url': 'https://link.springer.com/chapter/10.1007/978-3-031-26507-5_37',
    },
  ];
  static const List<Map<String, String>> funProjects = [
    {
      'title': 'Spark on Kubernetes',
      'description':
          'A scalable Apache Spark cluster deployed on Kubernetes using Helm. Includes custom Spark configurations, persistent storage, and dynamic executor scaling. Designed for efficient big data processing in a cloud-native environment.',
      'url': 'https://github.com/kostasrazgkelis/spark-on-k8s-cluster',
      'keywords': 'Spark, Kubernetes, Docker, Helm, Big Data, Scala',
    },
    {
      'title': 'My Web Page',
      'description':
          'This website is a fun project showcasing my skills and interests. It includes sections on my professional experience, education, languages, publications, fun projects, and tools/frameworks I use. ',
      'url': 'https://github.com/kostasrazgkelis/my-web-app',
      'keywords': 'Flutter, Web, Dart, Responsive Design, UI/UX',
    },
  ];
  static const List<Map<String, dynamic>> programmingLanguages = [
    {'name': 'Java', 'icon': 'icons/toolsandframeworks/java.svg'},
    {'name': 'Python', 'icon': 'icons/toolsandframeworks/python.svg'},
    {'name': 'Dart', 'icon': 'icons/toolsandframeworks/dart.svg'},
    {'name': 'SQL', 'icon': Icons.storage},
  ];
  static const List<Map<String, dynamic>> frameworks = [
    {'name': 'Spring Boot', 'icon': 'icons/toolsandframeworks/spring-boot.svg'},
    {'name': 'Django', 'icon': 'icons/toolsandframeworks/django.svg'},
    {'name': 'Flutter', 'icon': 'icons/toolsandframeworks/flutter.svg'},
  ];
  static const List<Map<String, dynamic>> versionControl = [
    {'name': 'Git', 'icon': 'icons/toolsandframeworks/git.svg'},
    {'name': 'GitHub', 'icon': 'icons/toolsandframeworks/github.svg'},
    {'name': 'GitLab', 'icon': 'icons/toolsandframeworks/gitlab.svg'},
  ];
  static const List<Map<String, dynamic>> dataProcessing = [
    {
      'name': 'Apache Spark',
      'icon': 'icons/toolsandframeworks/apache-spark.svg',
    },
    {
      'name': 'Hadoop',
      'icon': 'icons/toolsandframeworks/hadoop-distributed-file-system.svg',
    },
    {
      'name': 'Apache Kafka',
      'icon': 'icons/toolsandframeworks/apache-kafka.svg',
    },
  ];
  static const List<Map<String, dynamic>> containerOrchestration = [
    {'name': 'Docker', 'icon': 'icons/toolsandframeworks/docker.svg'},
    {'name': 'Kubernetes', 'icon': 'icons/toolsandframeworks/kubernetes.svg'},
  ];
  static const List<Map<String, dynamic>> databases = [
    {'name': 'MySQL', 'icon': 'icons/toolsandframeworks/mysql.svg'},
    {'name': 'PostgreSQL', 'icon': 'icons/toolsandframeworks/postgresql.svg'},
    {'name': 'MongoDB', 'icon': 'icons/toolsandframeworks/mongodb.svg'},
    {'name': 'Firebase', 'icon': 'icons/toolsandframeworks/firebase.svg'},
  ];
  static const List<Map<String, dynamic>> cicdDevOps = [
    {'name': 'GitHub Actions', 'icon': 'icons/toolsandframeworks/github.svg'},
    {'name': 'GitLab CI/CD', 'icon': 'icons/toolsandframeworks/gitlab.svg'},
  ];
  static const List<Map<String, dynamic>> operatingSystems = [
    {'name': 'Linux', 'icon': 'icons/toolsandframeworks/linux.svg'},
    {'name': 'Ubuntu', 'icon': 'icons/toolsandframeworks/ubuntu.svg'},
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
                                    programmingLanguages: programmingLanguages,
                                    frameworks: frameworks,
                                    versionControl: versionControl,
                                    dataProcessing: dataProcessing,
                                    containerOrchestration:
                                        containerOrchestration,
                                    databases: databases,
                                    cicdDevOps: cicdDevOps,
                                    operatingSystems: operatingSystems,
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
