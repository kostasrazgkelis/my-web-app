import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'About',
      child: Container(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 64,
                        color: Color(0xFF143A52),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF143A52),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Learn more about my journey and passion',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF6E828A),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                // Content
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Story',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF143A52),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'I am passionate about creating exceptional digital experiences using modern technologies. I combine creativity with technical expertise to deliver solutions that make a difference in people\'s lives.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6E828A),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'My Mission',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF143A52),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'To create intuitive, performant, and beautiful applications that serve users worldwide. I believe in the power of technology to connect people and solve real-world problems through innovative solutions.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6E828A),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Why Flutter?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF143A52),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Flutter enables me to create beautiful, natively compiled applications from a single codebase. Its performance, developer experience, and growing ecosystem make it the perfect choice for modern development.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6E828A),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Call to Action
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/');
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
                                'Back to Home',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.home, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
