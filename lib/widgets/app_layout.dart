import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLayout extends StatefulWidget {
  final Widget child;
  final String title;

  const AppLayout({super.key, required this.child, required this.title});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  // Helper function to launch URLs
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildMenuBar(context),
          Expanded(child: SingleChildScrollView(child: widget.child)),
        ],
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
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
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              // Navigation Menu - left side
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
              ),
              // Flexible spacer that adapts to screen size
              Expanded(
                flex: 3,
                child: Container(),
              ), // Download CV Button - positioned from center to right
              ElevatedButton(
                onPressed: () {
                  // Launch URL to download CV (replace with your actual CV URL)
                  _launchUrl('https://example.com/your-cv.pdf');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF143A52),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
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
              // Right spacer to keep button from edge
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuText(
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
}
