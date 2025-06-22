import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typewritertext/typewritertext.dart';

class PublicationCard extends StatelessWidget {
  final Map<String, String> publication;

  const PublicationCard({super.key, required this.publication});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3EFF3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.article, color: Color(0xFF143A52), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchUrl(publication['url']!);
                  },
                  child: TypeWriter.text(
                    publication['title']!,
                    duration: const Duration(milliseconds: 50),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF143A52),
                      decoration: TextDecoration.underline,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                TypeWriter.text(
                  publication['publisher']!,
                  duration: const Duration(milliseconds: 40),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TypeWriter.text(
                      publication['year']!,
                      duration: const Duration(milliseconds: 30),
                      maintainSize: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF6E828A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.link, size: 14, color: Color(0xFF6E828A)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
