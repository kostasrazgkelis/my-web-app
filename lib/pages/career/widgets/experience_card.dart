import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> job;
  final VoidCallback? onAnimationComplete;

  const ExperienceCard({
    super.key,
    required this.job,
    this.onAnimationComplete,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool showTitle = false;
  bool showCompany = false;
  bool showPeriod = false;
  bool showDescription = false;

  @override
  void initState() {
    super.initState();
    // Start title animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => showTitle = true);
    });
  }

  void _onTitleComplete(TypeWriterValue value) {
    if (mounted) setState(() => showCompany = true);
  }

  void _onCompanyComplete(TypeWriterValue value) {
    if (mounted) setState(() => showPeriod = true);
  }

  void _onPeriodComplete(TypeWriterValue value) {
    if (mounted) setState(() => showDescription = true);
  }

  void _onDescriptionComplete(TypeWriterValue value) {
    // Notify parent that this card's animation is complete
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
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
              color: Color(0xFF143A52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(widget.job['icon'], color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTitle)
                  TypeWriter.text(
                    widget.job['title'],
                    duration: const Duration(microseconds: 1),
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
                if (showCompany)
                  TypeWriter.text(
                    widget.job['company'],
                    duration: const Duration(microseconds: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onCompanyComplete,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6E828A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const SizedBox(height: 4),
                if (showPeriod)
                  TypeWriter.text(
                    widget.job['period'],
                    duration: const Duration(microseconds: 1),
                    maintainSize: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onPeriodComplete,
                    style: TextStyle(fontSize: 10, color: Color(0xFF6E828A)),
                  ),
                const SizedBox(height: 8),
                if (showDescription)
                  TypeWriter.text(
                    widget.job['description'],
                    duration: const Duration(microseconds: 1),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    onFinished: _onDescriptionComplete,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6E828A),
                      height: 1.4,
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
