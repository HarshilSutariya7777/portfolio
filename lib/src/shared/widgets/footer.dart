import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sutariyaharshil123@gmail.com',
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 80),
      child: Column(
        children: [
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HS.',
                  style: GoogleFonts.archivo(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'A passionate developer crafting beautiful\nand functional digital experiences. Let\'s\nbuild something amazing together.',
                  style: GoogleFonts.archivo(
                    fontSize: 16,
                    color: Colors.grey[400],
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'HAVE A PROJECT IN MIND?',
                  style: GoogleFonts.archivo(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: _launchEmail,
                  child: Text(
                    'sutariyaharshil123@gmail.com',
                    style: GoogleFonts.archivo(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Navigation Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAVIGATION',
                          style: GoogleFonts.archivo(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 25),
                        _FooterLink(title: 'About Me', onTap: () => context.go('/about')),
                        const SizedBox(height: 15),
                        _FooterLink(title: 'My Projects', onTap: () => context.go('/projects')),
                        const SizedBox(height: 15),
                        _FooterLink(title: 'Contact', onTap: () => context.go('/contact')),
                      ],
                    ),

                    // Location Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOCATION',
                          style: GoogleFonts.archivo(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 25),
                        _FooterText(text: 'Gujarat, India'),
                        const SizedBox(height: 15),
                        _FooterText(text: 'Remote Work Preferred', isHighlight: true),
                        const SizedBox(height: 15),
                        _FooterText(text: 'Flexible Hours'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: Logo, Description, Email
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HS.',
                        style: GoogleFonts.archivo(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'A passionate developer crafting beautiful\nand functional digital experiences. Let\'s\nbuild something amazing together.',
                        style: GoogleFonts.archivo(
                          fontSize: 16,
                          color: Colors.grey[400],
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'HAVE A PROJECT IN MIND?',
                        style: GoogleFonts.archivo(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: _launchEmail,
                        child: Text(
                          'sutariyaharshil123@gmail.com',
                          style: GoogleFonts.archivo(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Right Columns: Navigation & Location
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Navigation Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NAVIGATION',
                            style: GoogleFonts.archivo(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 25),
                          _FooterLink(title: 'About Me', onTap: () => context.go('/')),
                          const SizedBox(height: 15),
                          _FooterLink(title: 'My Projects', onTap: () => context.go('/projects')),
                          const SizedBox(height: 15),
                          _FooterLink(title: 'Contact', onTap: () => context.go('/contact')),
                        ],
                      ),

                      // Location Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOCATION',
                            style: GoogleFonts.archivo(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 25),
                          _FooterText(text: 'Gujarat, India'),
                          const SizedBox(height: 15),
                          _FooterText(text: 'Remote Work Preferred', isHighlight: true),
                          const SizedBox(height: 15),
                          _FooterText(text: 'Flexible Hours'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          
          const SizedBox(height: 80),
          const Divider(color: Colors.white24),
          const SizedBox(height: 40),

          // Bottom Row: Copyright & Socials
          if (isMobile)
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '© 2026 Harshil Sutariya. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Developed by Harshil Sutariya',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialIcon(icon: FontAwesomeIcons.github, onTap: () => _launchUrl('https://github.com/HarshilSutariya7777')), // Placeholder
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.linkedinIn, onTap: () => _launchUrl('https://www.linkedin.com/in/harshil-sutariya-083778279')), // Placeholder
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.instagram, onTap: () => _launchUrl('https://www.instagram.com/harshil_sutariya_2.0')), // Placeholder
                  ],
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '© 2026 Harshil Sutariya. All rights reserved.',
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Developed by Harshil Sutariya',
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _SocialIcon(icon: FontAwesomeIcons.github, onTap: () => _launchUrl('https://github.com/HarshilSutariya7777')), // Placeholder
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.linkedinIn, onTap: () => _launchUrl('https://www.linkedin.com/in/harshil-sutariya-083778279')), // Placeholder
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.instagram, onTap: () => _launchUrl('https://www.instagram.com/harshil_sutariya_2.0')), // Placeholder
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: GoogleFonts.archivo(
          fontSize: 16,
          color: Colors.grey[400],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  final String text;
  final bool isHighlight;

  const _FooterText({required this.text, this.isHighlight = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.archivo(
        fontSize: 16,
        color: isHighlight ? Colors.white : Colors.grey[400],
        fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w500,
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
