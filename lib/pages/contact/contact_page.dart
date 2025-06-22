import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Data dictionaries
  static const List<Map<String, dynamic>> contactInfo = [
    {'icon': Icons.email, 'title': 'Email', 'value': 'contact@portfolio.com'},
    {'icon': Icons.phone, 'title': 'Phone', 'value': '+1 (555) 123-4567'},
    {
      'icon': Icons.location_on,
      'title': 'Location',
      'value': 'Your City, Country',
    },
  ];

  static const List<Map<String, dynamic>> socialMedia = [
    {
      'icon': Icons.link,
      'platform': 'LinkedIn',
      'url': 'https://linkedin.com/in/yourprofile',
    },
    {
      'icon': Icons.code,
      'platform': 'GitHub',
      'url': 'https://github.com/yourusername',
    },
  ];

  static const List<Map<String, String>> formFields = [
    {'label': 'Your Name', 'type': 'text'},
    {'label': 'Email Address', 'type': 'email'},
    {'label': 'Subject', 'type': 'text'},
    {'label': 'Message', 'type': 'textarea'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Contact',
      child: Container(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Section
                Text(
                  'Get In Touch',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'I\'d love to hear from you. Send me a message and I\'ll respond as soon as possible.',
                  style: TextStyle(fontSize: 20, color: Color(0xFF6E828A)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Contact Content
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      // Desktop layout - two columns
                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Contact Information
                            Flexible(
                              flex: 1,
                              child: _buildContactInfoSection(),
                            ),
                            const SizedBox(width: 48),
                            // Contact Form
                            Flexible(
                              flex: 1,
                              child: _buildContactFormSection(context),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Mobile layout - single column
                      return Column(
                        children: [
                          _buildContactInfoSection(),
                          const SizedBox(height: 48),
                          _buildContactFormSection(context),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF143A52),
          ),
        ),
        const SizedBox(height: 24),
        ...contactInfo.map(
          (contact) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildContactItem(
              contact['icon'],
              contact['title'],
              contact['value'],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Social Media',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF143A52),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          children: socialMedia
              .map(
                (social) => _buildSocialButton(
                  social['icon'],
                  social['platform'],
                  social['url'],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildContactFormSection(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Send a Message',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 24),
          // Form Fields
          ...formFields.map(
            (field) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildFormField(field),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Message sent successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF143A52),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Send Message', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.send, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6E828A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF143A52),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String platform, String url) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF6E828A).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF6E828A).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Color(0xFF143A52)),
          const SizedBox(width: 8),
          Text(
            platform,
            style: TextStyle(
              color: Color(0xFF143A52),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(Map<String, String> field) {
    if (field['type'] == 'textarea') {
      return TextField(
        maxLines: 4,
        decoration: InputDecoration(
          labelText: field['label'],
          alignLabelWithHint: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF143A52)),
          ),
        ),
      );
    }

    return TextField(
      keyboardType: field['type'] == 'email'
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: field['label'],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF143A52)),
        ),
      ),
    );
  }
}
