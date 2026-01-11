import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/features/home/presentation/widgets/logo_marquee.dart';
import 'package:harshil/src/shared/widgets/fade_in_on_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MobileDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120), // Space for sticky navbar
                _buildIntroSection(context),
                const FadeInOnVisibility(child: LogoMarquee()),
                _buildSkillsSection(context),
                // const SizedBox(height: 60),
                // _buildCertificationsSection(context),
                // const SizedBox(height: 30),
                // Container(
                //   height: 1,
                //   margin: EdgeInsets.symmetric(horizontal: ResponsiveLayout.isMobile(context) ? 20 : 60, vertical: 40),
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Colors.transparent,
                //         Colors.grey[300]!,
                //         Colors.transparent,
                //       ],
                //     ),
                //   ),
                // ),
                // _buildExperienceSection(context),
                // const SizedBox(height: 80),
                const Footer(),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavHeader(),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Stack(
      children: [
        if(!isMobile && !isTablet)
        Positioned(
          top: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/harshil.png',
            fit: BoxFit.cover,
            height: 500,
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : (isTablet ? 40.0 : 24.0), 
            vertical: isMobile ? 30.0 : 40.0
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   // Removed Image for Tablet as per feedback
                  Text(
                    'ABOUT ME',
                    style: GoogleFonts.oswald(
                      fontSize: isMobile ? 40 : (isTablet ? 50 : 60),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'I am Harshil Sutariya, a passionate Flutter Developer focused on building clean, scalable, and user-friendly mobile applications.'
                    'I have hands-on experience developing production-ready apps using Flutter and Dart, with a strong understanding of state management, API integration, and performance optimization.'
                    'I also have working knowledge of backend technologies like Core PHP and Node.js, along with experience using databases such as MySQL and MongoDB, enabling me to collaborate effectively across the full development stack.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 16 : (isTablet ? 18 : 18),
                      height: 1.6,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Stack(
                    alignment: Alignment.center, // Ensure centering
                    children: [
                      Center(
                        child: RotatedBox(
                          quarterTurns: 0,
                          child: Text(
                            'FLUTTER',
                            textAlign: TextAlign.center, // Centered
                            style: GoogleFonts.archivo(
                              fontSize: isMobile ? 65 : (isTablet ? 100 : 150),
                              fontWeight: FontWeight.w900,
                              color: Colors.grey.withOpacity(0.3), // Lighter for better contrast
                            ),
                          ).animate().fadeIn(duration: 1200.ms).slideX(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
                        ),
                      ),
                      Center( // Wrapped in Center
                        child: Text(
                          'HARSHIL SUTARIYA',
                          style: GoogleFonts.italiana(
                            fontSize: isMobile ? 25 : (isTablet ? 40 : 50),
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final skills = [
      {
        'title': 'Application Development',
        'skills': 'Android, iOS, Web, Desktop, macOS (Flutter)',
        'icon': FontAwesomeIcons.mobileScreen,
      },
      {
        'title': 'Backend & API Integration',
        'skills': 'RESTful APIs, GraphQl APIs, Cloud Storage, Core PHP APIs, Node.js APIs',
        'icon': FontAwesomeIcons.server,
      },
      {
        'title': 'Programming Languages',
        'skills': 'Dart, Java, PHP',
        'icon': FontAwesomeIcons.code,
      },
      {
        'title': 'Payment Integration',
        'skills': 'Stripe, RazorPay, In-App Purchase (IOS)',
        'icon': FontAwesomeIcons.creditCard,
      },
      {
        'title': 'Development Tools',
        'skills': 'Android Studio, Visual Studio Code, Google Antigravity\n',
        'icon': FontAwesomeIcons.wrench,
      },
      {
        'title': 'Core Competencies',
        'skills': 'State Management (Riverpod,Bloc,Getx), Firebase Integration, Performance Optimization',
        'icon': FontAwesomeIcons.brain,
      },
    ];

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 20 : 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                isMobile ? 'MY SKILLS' : 'MY SKILLS & EXPERTISE',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: isMobile ? 36 : (isTablet ? 42 : 48),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: isTablet ? 20 : 40,
                runSpacing: isTablet ? 20 : 40,
                alignment: WrapAlignment.center,
                children: skills.map((skill) => _buildSkillCard(skill, isMobile)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill, bool isMobile) {
    return _SkillCard(skill: skill, isMobile: isMobile);
  }

  Widget _buildCertificationsSection(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'KEY CERTIFICATES',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildCertificateCard('AWS Cloud Computing', 'Certification\n', Colors.white, 'assets/images/3d/aws.png', 'https://drive.google.com/file/d/13hAEiJl8yvefMgbJ_dj6lvwY6kHUjbMs/view?usp=sharing', isMobile),
                _buildCertificateCard('Database Management System', 'Certification\n', Colors.white, 'assets/images/3d/dbms.webp', 'https://drive.google.com/file/d/18KKB1CUUseXSUxQxRWYvq521NqRLC6KM/view?usp=sharing', isMobile),
                _buildCertificateCard('MongoDB Basic to Advance', 'Certifications\n', Colors.white, 'assets/images/3d/mongo.png', 'https://drive.google.com/file/d/1L5uscaeeC_bUeYTb9fA3wiDsQgXlbBUv/view?usp=sharing', isMobile),
                _buildCertificateCard('Java - JDBC, Multithreading and Collection', 'Certifications', Colors.white, 'assets/images/3d/java.webp', 'https://drive.google.com/file/d/12FHvHbqZsmUoQDOB-FFk1K7Bu3S3hUea/view?usp=sharing', isMobile),
                _buildCertificateCard('ASP.NET Core', 'Certifications', Colors.white, 'assets/images/3d/asp.webp', 'https://drive.google.com/file/d/1gda9saUWKFOmcnK0fCT2bfbbJz010hXh/view?usp=sharing', isMobile),
                _buildCertificateCard('Mail Chip', 'Certifications', Colors.white, 'assets/images/3d/mail.png', 'https://drive.google.com/file/d/1rSi18zv0JgZrivjHj5dfa8fWFDGf-RUM/view?usp=sharing', isMobile),
                _buildCertificateCard('Applied Sustainability Engineering', 'Certifications', Colors.white, 'assets/images/3d/sus.webp', 'https://drive.google.com/file/d/1g2HRD5j-bC8EO33Dz1KFBxjIgHIESUVT/view?usp=sharing', isMobile),
                _buildCertificateCard('Career Launchpad', 'Certifications', Colors.white, 'assets/images/3d/career.webp', 'https://drive.google.com/file/d/1V9iHYQ29aNFMGVvG4XR-crHFraBTyV-O/view?usp=sharing', isMobile),
                _buildCertificateCard('Impactful Workplace Communication for Career Launch', 'Certifications', Colors.white, 'assets/images/3d/communication.webp', 'https://drive.google.com/file/d/1usIAihtsICz5qqJM4qgYI_ey3E6qy4fZ/view?usp=sharing', isMobile),
                _buildCertificateCard('Complete Interview Prep: Foundations, GD & Domain Interviews', 'Certifications', Colors.white, 'assets/images/3d/interview.webp', 'https://drive.google.com/file/d/17Qio7dfsELCLYpNya1TIPuIea69Glf6c/view?usp=sharing', isMobile),
                _buildCertificateCard('SOP Writing Mastery: Craft Statements That Stand Out', 'Certifications', Colors.white, 'assets/images/3d/sop.webp', 'https://drive.google.com/file/d/1CxuLAl6uznXxl8olLNnEmAOynQtH2t2I/view?usp=sharing', isMobile),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateCard(String title, String subtitle, Color color, String link, String url, bool isMobile) {
    return _CertificateCard(title, subtitle, color, link, url, isMobile);
  }

  Widget _buildExperienceSection(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    // Grouped images for experience items
    final experienceItems = [
      {
        'title': 'Appreciation Letter',
        'images': [
          "assets/images/letters/1.jpg",

        ]
      },
      {
        'title': 'CodzCart Infotech Appreciation Letter',
        'images': [
          "assets/images/letters/2.jpg",
          "assets/images/letters/3.jpg",
        ]
      },

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24.0, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EXPERIENCE & APPRECIATION',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50),

              // ⭐ GRID FOR EXPERIENCE ITEMS
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2, // 1 column on mobile, 2 on tablet/desktop
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.7, // A4 Portrait Ratio
                ),
                itemCount: experienceItems.length,
                itemBuilder: (context, index) {
                  final item = experienceItems[index];
                  final images = item['images'] as List<String>;
                  final firstImage = images.first;
                  final tag = 'experience_item_${index}_about';

                  return GestureDetector(
                    onTap: () => _openFullScreenGallery(context, images, 0, tag),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Hero(
                            tag: tag,
                            child: Image.asset(
                              firstImage,
                              fit: BoxFit.cover,
                              cacheWidth: 500, // Downsample for grid view to prevent memory crash
                              errorBuilder: (_, e, s) => Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                          // Overlay to indicate multiple images if applicable
                          if (images.length > 1)
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.collections, color: Colors.white, size: 14),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${images.length}',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              if (experienceItems.isEmpty)
                Text(
                  'Coming Soon...',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _openFullScreenGallery(BuildContext context, List<String> images, int initialIndex, String tag) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (context, animation, secondaryAnimation) {
          return _FullScreenGallery(
            images: images,
            initialIndex: initialIndex,
            heroTag: tag,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

}

class _FullScreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final String heroTag;

  const _FullScreenGallery({
    required this.images,
    required this.initialIndex,
    required this.heroTag,
  });

  @override
  State<_FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // PageView for swiping
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final imagePath = widget.images[index];
              // Only use Hero for the first image or the one that matches the initial tag if we want complex logic,
              // but for simplicity, we can just wrap the image. 
              // However, Hero transitions with PageView can be tricky. 
              // We'll apply Hero only if it's the initial image to avoid conflicts, or just on the container.
              // For now, let's keep it simple.
              return InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Center(
                  child: index == widget.initialIndex 
                    ? Hero(
                        tag: widget.heroTag,
                        child: Image.asset(imagePath, fit: BoxFit.contain, cacheWidth: 1000), // Downsample for full screen
                      )
                    : Image.asset(imagePath, fit: BoxFit.contain, cacheWidth: 1000), // Downsample for full screen
                ),
              );
            },
          ),

          // Close Button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Page Indicator (if multiple images)
          if (widget.images.length > 1)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_currentIndex + 1} / ${widget.images.length}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

          // Left Navigation Arrow
          if (widget.images.length > 1 && _currentIndex > 0)
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),

          // Right Navigation Arrow
          if (widget.images.length > 1 && _currentIndex < widget.images.length - 1)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  final bool isMobile;

  const _SkillCard({required this.skill, required this.isMobile});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile ? double.infinity : 350,
        constraints: const BoxConstraints(maxWidth: 350),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(_isHovered ? 0.3 : 0.1)),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              widget.skill['icon'] as IconData,
              color: const Color(0xFF00BFA6),
              size: 40,
            ),
            const SizedBox(height: 20),
            Text(
              widget.skill['title'] as String,
              style: GoogleFonts.oswald(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              widget.skill['skills'] as String,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey[400],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String link;
  final String url;
  final bool isMobile;

  const _CertificateCard(this.title, this.subtitle, this.color, this.link, this.url, this.isMobile);

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await launchUrl(Uri.parse(widget.url));
      },
      onHover: (val) => setState(() => _isHovered = val),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile ? double.infinity : 400,
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.black.withOpacity(0.15) : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 10),
            ),
          ],
          border: _isHovered ? Border.all(color: Colors.black.withOpacity(0.1)) : null,
        ),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 100,
                height: 100,
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
                    widget.link,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.code, size: 40),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: GoogleFonts.oswald(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              widget.subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
