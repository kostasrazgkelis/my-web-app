import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const AppLayout({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Menu Bar
          _buildMenuBar(context),
          // Main Content
          Expanded(child: child),
          // Footer
          _buildFooter(),
        ],
      ),
    );
  }  Widget _buildMenuBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFE3EFF3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [              // Navigation Menu - left side
              Row(
                children: [
                  _buildMenuText(
                    context,
                    'Home',
                    '/',
                    GoRouterState.of(context).uri.path == '/',
                  ),
                  const SizedBox(width: 24),
                  _buildMenuText(
                    context,
                    'Career',
                    '/career',
                    GoRouterState.of(context).uri.path == '/career',
                  ),
                  const SizedBox(width: 24),
                  _buildMenuText(
                    context,
                    'Contact',
                    '/contact',
                    GoRouterState.of(context).uri.path == '/contact',
                  ),
                  const SizedBox(width: 24),
                  _buildMenuText(
                    context,
                    'About',
                    '/about',
                    GoRouterState.of(context).uri.path == '/about',
                  ),
                ],
              ),              const SizedBox(width: 200), // Increase gap to move CV button more to the right
              // Download CV Button - center-right with more rounded design
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement CV download functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('CV download feature coming soon!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF143A52),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Download CV'),
                    const SizedBox(width: 8),
                    Icon(Icons.download, size: 18),
                  ],
                ),
              ),
              const Spacer(), // Push everything to the left side
            ],
          ),
        ),
      ),
    );
  }  Widget _buildMenuText(
    BuildContext context,
    String label,
    String route,
    bool isActive,
  ) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isActive ? Color(0xFF143A52) : Color(0xFF6E828A),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              width: label.length * 8.0, // Approximate width based on text
              color: isActive ? Color(0xFF143A52) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              // Portfolio Info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(                      children: [
                        Icon(Icons.person, color: Color(0xFF143A52), size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Portfolio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF143A52),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),                    Text(
                      'Passionate about creating innovative solutions and bringing ideas to life.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6E828A),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Navigation
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    Text(
                      'Navigation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF143A52),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFooterLink('Home', '/'),
                    _buildFooterLink('Career', '/career'),
                    _buildFooterLink('Contact', '/contact'),
                    _buildFooterLink('About', '/about'),
                  ],
                ),
              ),
              // Contact Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    Text(
                      'Get in Touch',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF143A52),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Email: contact@portfolio.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'LinkedIn: /in/yourprofile',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'GitHub: /yourusername',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              Text(
                '© 2025 Portfolio. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              Row(
                children: [
                  _buildSocialIcon(Icons.link), // LinkedIn
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.code), // GitHub
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.email), // Email
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String label, String route) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () => context.go(route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[600],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, size: 16, color: Colors.grey[600]),
    );
  }
}
