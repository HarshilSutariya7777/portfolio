import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> details;
  final String? link;
  final VoidCallback? onTap;

  const EducationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.details,
    this.link,
    this.onTap,
  });

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    if (widget.link != null && widget.link!.isNotEmpty) {
      final Uri url = Uri.parse(widget.link!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: _isHovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
        margin: const EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(isMobile ? 20 : 30),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.8) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered ? Colors.deepPurple.shade200 : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.deepPurple.withOpacity(0.1) : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              widget.title,
              style: GoogleFonts.archivo(
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: GoogleFonts.archivo(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            
            if (widget.details.isNotEmpty) ...[
              const SizedBox(height: 20),
              // Divider
              Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: _isHovered ? Colors.deepPurple : Colors.black87,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              // Details List
              ...widget.details.map((detail) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: _isHovered ? Colors.deepPurple : Colors.black54
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        detail,
                        style: GoogleFonts.archivo(
                          fontSize: 15,
                          color: Colors.grey[800],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],

            const SizedBox(height: 25),

            // View Detail Button
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: ElevatedButton(
            //     onPressed: _launchUrl,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: _isHovered ? Colors.deepPurple : Colors.black,
            //       foregroundColor: Colors.white,
            //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       elevation: _isHovered ? 4 : 0,
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           'View Detail',
            //           style: GoogleFonts.archivo(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //         const SizedBox(width: 8),
            //         const Icon(Icons.arrow_forward_rounded, size: 16),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
