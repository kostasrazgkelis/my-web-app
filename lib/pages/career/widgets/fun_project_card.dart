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
  bool showKeywords = false;
  bool isHovering = false;

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
    if (mounted) setState(() => showKeywords = true);
  }

  void _onKeywordsComplete(TypeWriterValue value) {
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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: () {
          _launchUrl(widget.project['url']!);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isHovering
                ? Color(0xFFCDE3EB).withOpacity(0.5)
                : Color(0xFFCDE3EB).withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovering
                  ? Color(0xFF143A52).withOpacity(0.3)
                  : Color(0xFF143A52).withOpacity(0.1),
              width: 1,
            ),
            boxShadow: isHovering
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Stack(
            children: [
              Row(
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
                          TypeWriter.text(
                            widget.project['title']!,
                            duration: const Duration(milliseconds: 1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            onFinished: _onTitleComplete,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF143A52),
                              height: 1.3,
                            ),
                          ),
                        const SizedBox(height: 4),
                        if (showDescription)
                          TypeWriter.text(
                            widget.project['description']!,
                            duration: const Duration(milliseconds: 1),
                            maxLines: 5,
                            overflow: TextOverflow.visible,
                            onFinished: _onDescriptionComplete,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6E828A),
                              height: 1.1,
                            ),
                          ),
                        const SizedBox(height: 16),
                        if (showKeywords)
                          Row(
                            children: [
                              Icon(
                                Icons.local_offer,
                                size: 14,
                                color: Color(0xFF6E828A),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: TypeWriter.text(
                                  widget.project['keywords']!,
                                  duration: const Duration(milliseconds: 1),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  onFinished: _onKeywordsComplete,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF6E828A),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              // Hover button
              if (isHovering)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isHovering ? 1.0 : 0.0,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => _launchUrl(widget.project['url']!),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF143A52),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.open_in_new,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
