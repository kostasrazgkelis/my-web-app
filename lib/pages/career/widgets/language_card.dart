import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class LanguageCard extends StatefulWidget {
  final Map<String, String> language;
  final VoidCallback? onAnimationComplete;

  const LanguageCard({
    super.key,
    required this.language,
    this.onAnimationComplete,
  });

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  bool showLanguage = false;
  bool showDegree = false;
  bool showLevel = false;

  @override
  void initState() {
    super.initState();
    // Start language animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => showLanguage = true);
    });
  }

  void _onLanguageComplete(TypeWriterValue value) {
    if (mounted) setState(() => showDegree = true);
  }

  void _onDegreeComplete(TypeWriterValue value) {
    if (mounted) setState(() => showLevel = true);

    // Since level is just a badge (not TypeWriter), complete immediately
    Future.delayed(const Duration(milliseconds: 100), () {
      if (widget.onAnimationComplete != null) {
        widget.onAnimationComplete!();
      }
    });
  }

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
            child: Text(
              widget.language['flag']!,
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showLanguage)
                  TypeWriter.text(
                    widget.language['language']!,
                    duration: const Duration(milliseconds: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onLanguageComplete,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF143A52),
                      height: 1.3,
                    ),
                  ),
                const SizedBox(height: 2),
                if (showDegree)
                  TypeWriter.text(
                    widget.language['degree']!,
                    duration: const Duration(milliseconds: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onDegreeComplete,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6E828A),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                const SizedBox(height: 4),
                if (showLevel)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF143A52),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.language['level']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
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
