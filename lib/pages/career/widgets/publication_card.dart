import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:typewritertext/typewritertext.dart';

class PublicationCard extends StatefulWidget {
  final Map<String, String> publication;
  final VoidCallback? onAnimationComplete;

  const PublicationCard({
    super.key,
    required this.publication,
    this.onAnimationComplete,
  });

  @override
  State<PublicationCard> createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  bool showTitle = false;
  bool showPublisher = false;
  bool showYear = false;
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
    if (mounted) setState(() => showPublisher = true);
  }

  void _onPublisherComplete(TypeWriterValue value) {
    if (mounted) setState(() => showYear = true);
  }

  void _onYearComplete(TypeWriterValue value) {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isHovering
              ? Color(0xFFE3EFF3).withOpacity(0.8)
              : Color(0xFFE3EFF3).withOpacity(0.5),
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
              spacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF143A52).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    Icons.article,
                    color: Color(0xFF143A52),
                    size: 20,
                  ),
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
                          widget.publication['title']!,
                          duration: const Duration(milliseconds: 1),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          onFinished: _onTitleComplete,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF143A52),
                            height: 1.3,
                          ),
                        ),
                      const SizedBox(height: 6),
                      if (showPublisher)
                        TypeWriter.text(
                          widget.publication['publisher']!,
                          duration: const Duration(milliseconds: 1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          onFinished: _onPublisherComplete,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6E828A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      const SizedBox(height: 4),
                      if (showYear)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TypeWriter.text(
                              widget.publication['year']!,
                              duration: const Duration(milliseconds: 1),
                              maintainSize: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              onFinished: _onYearComplete,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF6E828A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.link,
                              size: 14,
                              color: Color(0xFF6E828A),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ), // Hover button
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
                      onTap: () => _launchUrl(widget.publication['url']!),
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
    );
  }
}
