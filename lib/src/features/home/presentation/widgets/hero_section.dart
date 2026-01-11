import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      height: (isMobile || isTablet) ? null : MediaQuery.of(context).size.height * 0.95,
      width: double.infinity,
      color: Colors.white,
      padding: (isMobile || isTablet) ? const EdgeInsets.only(top: 20, bottom: 60) : null,
      child: Stack(
        children: [
          // Background Text
          if (!isMobile && !isTablet)
            Positioned(
              right: 0,
              top: 120,
              child: Center(
                child: RotatedBox(
                  quarterTurns: 0,
                  child: Text(
                    'FLUTTER\nDEVELOPER',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.archivo(
                      fontSize: 200,
                      fontWeight: FontWeight.w900,
                      height: 0.85,
                      color: Colors.grey.withOpacity(0.3), // Lighter for better contrast
                    ),
                  ).animate().fadeIn(duration: 1200.ms).slideX(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
                ),
              ),
            ),

          // Main Content
          if (isMobile)
            _buildMobileLayout(context)
          else if (isTablet)
            _buildTabletLayout(context)
          else
            _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Image on top for mobile
        SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: 20,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: Text(
                      'FLUTTER\nDEVELOPER',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                        fontSize: 55,
                        fontWeight: FontWeight.w900,
                        height: 0.85,
                        color: Colors.grey.withOpacity(0.3), // Lighter for better contrast
                      ),
                    ).animate().fadeIn(duration: 1200.ms).slideX(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
                  ),
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/harshil.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.person, size: 200, color: Colors.grey),
                      ),
                    );
                  },
                ).animate().fadeIn(duration: 1000.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey There,',
                style: GoogleFonts.archivo(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ).animate().fadeIn(duration: 800.ms).slideX(curve: Curves.easeOut),
              
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I\'m ',
                      style: GoogleFonts.archivo(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Harshil\nSutariya',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        height: 0.9,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideX(curve: Curves.easeOut),

              const SizedBox(height: 20),
              Text(
                'Crafting digital experiences with\nvisual excellence.',
                style: GoogleFonts.archivo(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),

              const SizedBox(height: 40),
              
              // Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                    child: Text(
                      'Get in Touch',
                      style: GoogleFonts.archivo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: _launchEmail,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 2.5),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Email Me',
                          style: GoogleFonts.archivo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.2, curve: Curves.easeOutBack),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        // Image on top for tablet
        SizedBox(
          height: 500,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: 20,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: Text(
                      'FLUTTER\nDEVELOPER',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                        fontSize: 100,
                        fontWeight: FontWeight.w900,
                        height: 0.85,
                        color: Colors.grey.withOpacity(0.3), // Lighter for better contrast
                      ),
                    ).animate().fadeIn(duration: 1200.ms).slideX(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
                  ),
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/harshil.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.person, size: 200, color: Colors.grey),
                      ),
                    );
                  },
                ).animate().fadeIn(duration: 1000.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hey There,',
                style: GoogleFonts.archivo(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ).animate().fadeIn(duration: 800.ms).slideX(curve: Curves.easeOut),
              
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I\'m ',
                      style: GoogleFonts.archivo(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Harshil Sutariya',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        height: 0.9,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideX(curve: Curves.easeOut),

              const SizedBox(height: 30),
              Text(
                'Crafting digital experiences with\nvisual excellence.',
                textAlign: TextAlign.center,
                style: GoogleFonts.archivo(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),

              const SizedBox(height: 50),
              
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                    child: Text(
                      'Get in Touch',
                      style: GoogleFonts.archivo(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  OutlinedButton(
                    onPressed: _launchEmail,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 2.5),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          'Email Me',
                          style: GoogleFonts.archivo(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.2, curve: Curves.easeOutBack),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
              children: [
                // Left Side
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey There,',
                          style: GoogleFonts.archivo(
                            fontSize: 45,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                          ),
                        ).animate().fadeIn(duration: 800.ms).slideX(curve: Curves.easeOut),
                        
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I\'m ',
                                style: GoogleFonts.archivo(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  height: 1.0,
                                ),
                              ),
                              TextSpan(
                                text: ' Harshil\nSutariya',
                                style: GoogleFonts.playfairDisplay( // Changed to Playfair Display for "Attractive" look
                                  fontSize: 110,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideX(curve: Curves.easeOut),

                        const SizedBox(height: 30),
                        Text(
                          'Crafting digital experiences with\nvisual excellence.',
                          style: GoogleFonts.archivo(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ).animate().fadeIn(delay: 400.ms, duration: 800.ms),

                        const SizedBox(height: 60),
                        
                        // Buttons
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => context.go('/contact'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 10,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              child: Text(
                                'Get in Touch',
                                style: GoogleFonts.archivo(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            OutlinedButton(
                              onPressed: _launchEmail,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                side: const BorderSide(color: Colors.black, width: 2.5),
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.email_outlined, size: 24),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Email Me',
                                    style: GoogleFonts.archivo(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.2, curve: Curves.easeOutBack),
                      ],
                    ),
                  ),
                ),

                // Right Side: Image
                Expanded(
                  flex: 6,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        child: Image.asset(
                          'assets/images/harshil.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback to network image if local asset fails (debugging step)
                            // Or just show icon
                            return Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(Icons.person, size: 200, color: Colors.grey),
                              ),
                            );
                          },
                        ).animate().fadeIn(duration: 1000.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut),
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white,
                                ],
                                stops: const [0.0, 2],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
    );
  }
}
