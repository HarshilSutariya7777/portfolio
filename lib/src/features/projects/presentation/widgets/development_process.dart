import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/features/projects/domain/project_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevelopmentProcess extends StatelessWidget {
  final Project project;

  const DevelopmentProcess({super.key, required this.project});

  String _getAssetForTechnology(String technology) {
    final tech = technology.toLowerCase();
    if (tech.contains('flutter')) return 'assets/images/3d/flutter.png';
    if (tech.contains('dart')) return 'assets/images/3d/dart.webp';
    if (tech.contains('php')) return 'assets/images/3d/php.png';
    if (tech.contains('mysql') || tech.contains('sql')) return 'assets/images/3d/sql.webp';
    if (tech.contains('git')) return 'assets/images/3d/git.webp';
    if (tech.contains('figma')) return 'assets/images/3d/figma.webp';
    if (tech.contains('firebase')) return 'assets/images/3d/firebase.webp';
    if (tech.contains('node')) return 'assets/images/3d/node.webp';
    if (tech.contains('react')) return 'assets/images/3d/react.png';
    if (tech.contains('cloud')) return 'assets/images/3d/cloud.png';
    return 'assets/images/3d/code.png'; 
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'THE DEVELOPMENT PROCESS',
          style: GoogleFonts.bebasNeue(
            fontSize: isMobile ? 30 : 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'From initial design to final deployment',
          textAlign: TextAlign.center,
          style: GoogleFonts.archivo(
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _buildProcessCard(
              context,
              'Frontend',
              project.frontend,
              'Frontend Structure',
            ),
            _buildProcessCard(
              context,
              'Backend',
              project.backend,
              'Backend Language',
            ),
            _buildProcessCard(
              context,
              'Database',
              project.database,
              'Database',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProcessCard(BuildContext context, String title, String technology, String subtitle) {
    return _ProcessCard(
      title: title,
      technology: technology,
      subtitle: subtitle,
      asset: _getAssetForTechnology(technology),
    );
  }
}

class _ProcessCard extends StatefulWidget {
  final String title;
  final String technology;
  final String subtitle;
  final String asset;

  const _ProcessCard({
    required this.title,
    required this.technology,
    required this.subtitle,
    required this.asset,
  });

  @override
  State<_ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<_ProcessCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isMobile ? double.infinity : 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.9) : Colors.white,
          borderRadius: BorderRadius.circular(20),
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
              width: isMobile ? 80 : 100,
              height: isMobile ? 80 : 100,
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
                  width: isMobile ? 80 : 100,
                  height: isMobile ? 80 : 100,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.code, size: isMobile ? 40 : 50),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.technology,
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 18 : 20,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.archivo(
                      fontSize: isMobile ? 14 : 15,
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
