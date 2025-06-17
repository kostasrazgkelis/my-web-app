import 'package:flutter/material.dart';
import 'package:test_web_app/widgets/app_layout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
              children: [                // Header Section
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
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6E828A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                
                // Contact Content
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Information
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [                            Text(
                              'Contact Information',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF143A52),
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            _buildContactItem(
                              Icons.email,
                              'Email',
                              'contact@portfolio.com',
                            ),
                            const SizedBox(width: 24),
                            
                            _buildContactItem(
                              Icons.phone,
                              'Phone',
                              '+1 (555) 123-4567',
                            ),
                            const SizedBox(width: 24),
                            
                            _buildContactItem(
                              Icons.location_on,
                              'Location',
                              'Your City, Country',
                            ),
                            const SizedBox(height: 32),
                              Text(
                              'Social Media',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF143A52),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            Row(
                              children: [
                                _buildSocialButton(Icons.link, 'LinkedIn'),
                                const SizedBox(width: 16),
                                _buildSocialButton(Icons.code, 'GitHub'),
                                const SizedBox(width: 16),
                                _buildSocialButton(Icons.language, 'Website'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 48),
                      
                      // Contact Form
                      Expanded(
                        child: Container(
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
                            children: [                              Text(
                                'Send a Message',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF143A52),
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Form Fields
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Your Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Subject',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              TextField(
                                maxLines: 4,
                                decoration: InputDecoration(
                                  labelText: 'Message',
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Message sent successfully!')),
                                    );
                                  },                                  style: ElevatedButton.styleFrom(
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

  Widget _buildSocialButton(IconData icon, String platform) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Add social media links
      },
      icon: Icon(icon, size: 18),
      label: Text(platform),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.withOpacity(0.1),
        foregroundColor: Colors.blue,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.blue.withOpacity(0.3)),
        ),
      ),
    );
  }
}
