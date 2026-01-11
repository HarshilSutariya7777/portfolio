import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection> with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return VisibilityDetector(
      key: const Key('stats-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : (isTablet ? 30 : 40), vertical: 50),
        color: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _AnimatedStatItem(
                targetValue: 8.4,
                label: 'CGPA',
                isFloat: true,
                isVisible: _isVisible,
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
            Expanded(
              child: _AnimatedStatItem(
                targetValue: 3,
                label: isMobile ? 'PROJECTS\nCOMPLETED' : 'PROJECTS COMPLETED',
                suffix: '+',
                isVisible: _isVisible,
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
            Expanded(
              child: _AnimatedStatItem(
                targetValue: 100,
                label: 'SATISFACTION',
                suffix: '%',
                isVisible: _isVisible,
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedStatItem extends StatelessWidget {
  final double targetValue;
  final String label;
  final bool isFloat;
  final String suffix;
  final bool isVisible;
  final bool isMobile;
  final bool isTablet;

  const _AnimatedStatItem({
    required this.targetValue,
    required this.label,
    this.isFloat = false,
    this.suffix = '',
    required this.isVisible,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isVisible)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: targetValue),
            duration: const Duration(seconds: 2),
            curve: Curves.easeOutExpo,
            builder: (context, value, child) {
              return Text(
                '${isFloat ? value.toStringAsFixed(1) : value.toInt()}$suffix',
                style: GoogleFonts.archivo(
                  fontSize: isMobile ? 35 : (isTablet ? 60 : 80),
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              );
            },
          )
        else
          Text(
            '0$suffix',
             style: GoogleFonts.archivo(
                  fontSize: isMobile ? 35 : (isTablet ? 60 : 80),
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
          ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.archivo(
            fontSize: isMobile ? 10 : (isTablet ? 13 : 16),
            fontWeight: FontWeight.bold,
            letterSpacing: isMobile ? 1 : 2,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
