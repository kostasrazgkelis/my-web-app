import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  bool iconLoaded = false;

  @override
  void initState() {
    super.initState();
    _preloadIcon();
  }

  void _preloadIcon() async {
    if (_isSvg()) {
      // For SVG, we can start the animation immediately as SVGs load quickly
      _startAnimation();
    } else {
      // For image assets, preload them first
      try {
        await precacheImage(AssetImage(_getIconAsset()), context);
        if (mounted) {
          setState(() => iconLoaded = true);
          _startAnimation();
        }
      } catch (e) {
        // If preloading fails, start animation anyway
        if (mounted) {
          setState(() => iconLoaded = true);
          _startAnimation();
        }
      }
    }
  }

  void _startAnimation() {
    // Start title animation
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

  String _getIconAsset() {
    switch (widget.degree['type']) {
      case 'Masters':
        return 'icons/education/auth.png';
      case 'Bachelor':
        return 'icons/education/uom.jpeg';
      case 'Certificate':
        return 'icons/education/certificate.svg';
      case 'Derby':
        return 'icons/education/derby.jpeg';
      default:
        return 'icons/education/uom.jpeg';
    }
  }

  bool _isSvg() {
    return _getIconAsset().endsWith('.svg');
  }

  Widget _buildIcon() {
    if (!iconLoaded && !_isSvg()) {
      // Show a placeholder while image is loading
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF143A52).withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF143A52)),
            ),
          ),
        ),
      );
    }

    if (_isSvg()) {
      return SvgPicture.asset(
        _getIconAsset(),
        colorFilter: ColorFilter.mode(Color(0xFF143A52), BlendMode.srcIn),
        width: 40,
        height: 40,
      );
    } else {
      return Image.asset(
        _getIconAsset(),
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(milliseconds: 200),
            child: child,
          );
        },
      );
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF143A52).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: ClipOval(child: Center(child: _buildIcon())),
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
