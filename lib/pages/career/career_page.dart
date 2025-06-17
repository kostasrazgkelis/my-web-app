import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Career',
      child: Container(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [            // Header Section
            Text(
              'My Career Journey',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF143A52),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Explore my professional experience and skills',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF6E828A),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            
            // Experience Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    Text(
                      'Professional Experience',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF143A52),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Experience Cards
                    _buildExperienceCard(
                      'Senior Software Developer',
                      'Tech Company Inc.',
                      '2022 - Present',
                      'Led development of web applications using Flutter and modern frameworks. Collaborated with cross-functional teams to deliver high-quality software solutions.',
                      Icons.work,
                    ),
                    const SizedBox(height: 24),
                    
                    _buildExperienceCard(
                      'Full Stack Developer',
                      'Digital Solutions Ltd.',
                      '2020 - 2022',
                      'Developed and maintained full-stack applications using various technologies. Implemented responsive designs and optimized application performance.',
                      Icons.code,
                    ),
                    const SizedBox(height: 24),
                    
                    _buildExperienceCard(
                      'Junior Developer',
                      'StartUp Ventures',
                      '2018 - 2020',
                      'Started career in software development, focusing on front-end technologies and user experience design. Contributed to multiple successful projects.',
                      Icons.school,
                    ),                    const SizedBox(height: 48),
                    
                    // Skills Section
                    Text(
                      'Technical Skills',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF143A52),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _buildSkillChip('Flutter'),
                        _buildSkillChip('Dart'),
                        _buildSkillChip('JavaScript'),
                        _buildSkillChip('React'),
                        _buildSkillChip('Node.js'),
                        _buildSkillChip('Python'),
                        _buildSkillChip('Firebase'),
                        _buildSkillChip('Git'),
                        _buildSkillChip('REST APIs'),
                        _buildSkillChip('UI/UX Design'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String title, String company, String period, String description, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Color(0xFF143A52), size: 32),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E828A),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF143A52).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Color(0xFF143A52),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
