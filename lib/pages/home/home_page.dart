import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data dictionaries
  static const Map<String, String> personalInfo = {
    'name': 'John Doe',
    'title': 'Full Stack Developer & UI/UX Designer',
    'description':
        'Passionate about creating innovative digital solutions and bringing ideas to life through code.',
  };

  static const List<Map<String, dynamic>> services = [
    {
      'icon': Icons.web,
      'title': 'Web Development',
      'description':
          'Creating responsive and modern web applications using the latest technologies and frameworks.',
    },
    {
      'icon': Icons.mobile_friendly,
      'title': 'Mobile Development',
      'description':
          'Building cross-platform mobile applications with Flutter for iOS and Android.',
    },
    {
      'icon': Icons.design_services,
      'title': 'UI/UX Design',
      'description':
          'Designing intuitive and beautiful user interfaces that provide excellent user experiences.',
    },
  ];

  static const List<Map<String, String>> statistics = [
    {'number': '50+', 'label': 'Projects Completed'},
    {'number': '3+', 'label': 'Years Experience'},
    {'number': '20+', 'label': 'Happy Clients'},
    {'number': '5+', 'label': 'Technologies'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Home',
      child: Container(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(64),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFCDE3EB), Color(0xFFE3EFF3)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Profile Picture Placeholder
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF143A52),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    personalInfo['name']!,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF143A52),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    personalInfo['title']!,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF6E828A),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    personalInfo['description']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6E828A),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.go('/contact');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF143A52),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get In Touch',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.go('/career');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF143A52),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Color(0xFF143A52)),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View My Work',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.work, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
            // What I Do Section
            Text(
              'What I Do',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF143A52),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Services/Skills Section
            Row(
              children: [
                ...services
                    .map(
                      (service) => [
                        Expanded(
                          child: _buildServiceCard(
                            service['icon'],
                            service['title'],
                            service['description'],
                          ),
                        ),
                        if (service != services.last) const SizedBox(width: 32),
                      ],
                    )
                    .expand((widgets) => widgets),
              ],
            ),
            const SizedBox(height: 64),
            // Quick Stats
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Color(0xFF143A52),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: statistics
                    .map(
                      (stat) => _buildStatItem(stat['number']!, stat['label']!),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: Color(0xFF143A52)),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6E828A),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Color(0xFFCDE3EB)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
