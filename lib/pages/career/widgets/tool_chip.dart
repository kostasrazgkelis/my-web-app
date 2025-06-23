import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolChip extends StatelessWidget {
  final Map<String, dynamic> tool;

  const ToolChip({super.key, required this.tool});  Widget _buildIcon() {
    final iconData = tool['icon'];
    
    if (iconData is String && iconData.endsWith('.svg')) {
      // It's an SVG asset path
      try {
        return SvgPicture.asset(
          iconData,
          width: 18,
          height: 18,
          placeholderBuilder: (context) => Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Color(0xFF143A52).withOpacity(0.1),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              Icons.code,
              color: Color(0xFF143A52),
              size: 12,
            ),
          ),
          fit: BoxFit.contain,
        );
      } catch (e) {
        // If SVG fails to load, show a fallback
        print('Error loading SVG: $iconData - $e');
        return Icon(Icons.error, color: Colors.red, size: 18);
      }
    } else if (iconData is IconData) {
      // It's a Material icon
      return Icon(iconData, color: Color(0xFF143A52), size: 18);
    } else {
      // Fallback to a default icon
      return Icon(Icons.code, color: Color(0xFF143A52), size: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFCDE3EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF143A52).withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(),
          const SizedBox(width: 8),
          Text(
            tool['name'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF143A52),
            ),
          ),
        ],
      ),
    );
  }
}
