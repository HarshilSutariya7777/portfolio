import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnologyShowcase extends StatelessWidget {
  final List<String> technologies;

  const TechnologyShowcase({super.key, required this.technologies});

  String _getAssetForTechnology(String technology) {
    final tech = technology.toLowerCase();
    if (tech.contains('flutter')) return 'assets/images/3d/flutter.png';
    if (tech.contains('dart')) return 'assets/images/3d/dart.webp';
    if (tech.contains('php')) return 'assets/images/3d/php.png';
    if (tech.contains('mysql') || tech.contains('sql')) return 'assets/images/3d/sql.webp';
    if (tech.contains('git')) return 'assets/images/3d/git.webp';
    if (tech.contains('figma')) return 'assets/images/3d/figma.webp';
    if (tech.contains('firebase')) return 'assets/images/3d/firebase.png';
    if (tech.contains('node')) return 'assets/images/3d/node.webp';
    if (tech.contains('react')) return 'assets/images/3d/react.png';
    if (tech.contains('cloud')) return 'assets/images/3d/cloud.png';
    // Default fallback or specific handling for others
    return 'assets/images/3d/code.png'; // Assuming a generic code icon exists or handle gracefully
  }

  String _getSubtitleForTechnology(String technology) {
    final tech = technology.toLowerCase();
    if (tech.contains('flutter')) return 'Frontend Structure'; // Or 'Cross-platform Framework'
    if (tech.contains('dart')) return 'Programming Language';
    if (tech.contains('php')) return 'Backend Language';
    if (tech.contains('mysql') || tech.contains('sql')) return 'Database';
    if (tech.contains('git')) return 'Version Control';
    if (tech.contains('figma')) return 'Design Tool';
    if (tech.contains('firebase')) return 'Backend as a Service';
    if (tech.contains('node')) return 'Backend Runtime';
    if (tech.contains('react')) return 'Frontend Library';
    if (tech.contains('html')) return 'Frontend Structure';
    if (tech.contains('css')) return 'Frontend Styling';
    if (tech.contains('javascript')) return 'Frontend Logic';
    
    return 'Technology';
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      children: [
        Text(
          'TECHNOLOGY SHOWCASE',
          textAlign: TextAlign.center,
          style: GoogleFonts.bebasNeue(
            fontSize: isMobile ? 30 : 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'The core technologies and tools used to build this project from the ground up.',
            textAlign: TextAlign.center,
            style: GoogleFonts.archivo(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 1500,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: technologies.map((tech) {
              return _TechCard(
                technology: tech,
                asset: _getAssetForTechnology(tech),
                subtitle: _getSubtitleForTechnology(tech),
                isMobile: isMobile,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _TechCard extends StatefulWidget {
  final String technology;
  final String asset;
  final String subtitle;
  final bool isMobile;

  const _TechCard({
    required this.technology,
    required this.asset,
    required this.subtitle,
    required this.isMobile,
  });

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile ? double.infinity : 300,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.9) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered ? Colors.deepPurple.withOpacity(0.3) : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.deepPurple.withOpacity(0.1) : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Row(
          children: [
            Container(
              width: widget.isMobile ? 80 : 100,
              height: widget.isMobile ? 80 : 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                    spreadRadius: -5,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  widget.asset,
                  width: widget.isMobile ? 80 : 100,
                  height: widget.isMobile ? 80 : 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.code, size: widget.isMobile ? 30 : 40),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.technology,
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 18 : 20,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.archivo(
                      fontSize: widget.isMobile ? 14 : 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
