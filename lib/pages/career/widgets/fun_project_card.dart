import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typewritertext/typewritertext.dart';

class FunProjectCard extends StatefulWidget {
  final Map<String, String> project;
  final VoidCallback? onAnimationComplete;

  const FunProjectCard({
    super.key,
    required this.project,
    this.onAnimationComplete,
  });

  @override
  State<FunProjectCard> createState() => _FunProjectCardState();
}

class _FunProjectCardState extends State<FunProjectCard> {
  bool showTitle = false;
  bool showDescription = false;
  bool showLink = false;

  @override
  void initState() {
    super.initState();
    // Start title animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => showTitle = true);
    });
  }

  void _onTitleComplete(TypeWriterValue value) {
    if (mounted) setState(() => showDescription = true);
  }

  void _onDescriptionComplete(TypeWriterValue value) {
    if (mounted) setState(() => showLink = true);
  }

  void _onLinkComplete(TypeWriterValue value) {
    // Notify parent that this card's animation is complete
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

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
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.code, color: Color(0xFF143A52), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTitle)
                  GestureDetector(
                    onTap: () {
                      _launchUrl(widget.project['url']!);
                    },
                    child: TypeWriter.text(
                      widget.project['title']!,
                      duration: const Duration(milliseconds: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      onFinished: _onTitleComplete,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF143A52),
                        decoration: TextDecoration.underline,
                        height: 1.3,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                if (showDescription)
                  TypeWriter.text(
                    widget.project['description']!,
                    duration: const Duration(milliseconds: 1),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onDescriptionComplete,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6E828A),
                      height: 1.4,
                    ),
                  ),
                const SizedBox(height: 8),
                if (showLink)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.link, size: 14, color: Color(0xFF6E828A)),
                      const SizedBox(width: 4),
                      TypeWriter.text(
                        'View Project',
                        duration: const Duration(milliseconds: 1),
                        maintainSize: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        onFinished: _onLinkComplete,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF6E828A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
