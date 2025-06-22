import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class LanguageCard extends StatelessWidget {
  final Map<String, String> language;

  const LanguageCard({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Text(language['flag']!, style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TypeWriter.text(
                  language['language']!,
                  duration: const Duration(milliseconds: 50),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF143A52),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 2),
                TypeWriter.text(
                  language['degree']!,
                  duration: const Duration(milliseconds: 40),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E828A),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF143A52),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    language['level']!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
