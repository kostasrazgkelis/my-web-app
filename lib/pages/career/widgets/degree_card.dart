import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class DegreeCard extends StatefulWidget {
  final Map<String, String> degree;
  final VoidCallback? onAnimationComplete;

  const DegreeCard({super.key, required this.degree, this.onAnimationComplete});

  @override
  State<DegreeCard> createState() => _DegreeCardState();
}

class _DegreeCardState extends State<DegreeCard> {
  bool showTitle = false;
  bool showInstitution = false;
  bool showYear = false;

  @override
  void initState() {
    super.initState();
    // Start title animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => showTitle = true);
    });
  }

  void _onTitleComplete(TypeWriterValue value) {
    if (mounted) setState(() => showInstitution = true);
  }

  void _onInstitutionComplete(TypeWriterValue value) {
    if (mounted) setState(() => showYear = true);
  }

  void _onYearComplete(TypeWriterValue value) {
    // Notify parent that this card's animation is complete
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

  IconData _getIcon() {
    switch (widget.degree['type']) {
      case 'Masters':
        return Icons.school;
      case 'Bachelor':
        return Icons.menu_book;
      case 'Certificate':
        return Icons.verified;
      default:
        return Icons.school;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3EFF3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_getIcon(), color: Color(0xFF143A52), size: 22),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 1,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTitle)
                  TypeWriter.text(
                    widget.degree['title']!,
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
                if (showInstitution)
                  TypeWriter.text(
                    widget.degree['institution']!,
                    duration: const Duration(milliseconds: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onInstitutionComplete,
                    style: TextStyle(fontSize: 13, color: Color(0xFF6E828A)),
                  ),
                if (showYear)
                  TypeWriter.text(
                    '${widget.degree['yearStart']!} - ${widget.degree['yearEnd']!}',
                    duration: const Duration(milliseconds: 1),
                    maintainSize: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onYearComplete,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF6E828A),
                      fontWeight: FontWeight.w500,
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
