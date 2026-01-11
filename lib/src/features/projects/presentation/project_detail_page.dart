import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/features/projects/data/project_data.dart';
import 'package:harshil/src/features/projects/presentation/widgets/development_process.dart';
import 'package:harshil/src/features/projects/presentation/widgets/technology_showcase.dart';
import 'package:harshil/src/features/projects/presentation/widgets/auto_scrolling_gallery.dart';
import 'package:harshil/src/features/projects/presentation/widgets/youtube_hero.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    debugPrint("rojectId:::$projectId");
    final project = ProjectData.projects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => ProjectData.projects[0], // Fallback
    );
    debugPrint("project:::$projectId");
    final isMobile = ResponsiveLayout.isMobile(context);
    final hasYoutubeVideo =
        project.youtubeVideoId != null && project.youtubeVideoId!.isNotEmpty;

    return Scaffold(
      endDrawer: isMobile || ResponsiveLayout.isTablet(context) ? const MobileDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavHeader(),
            SizedBox(
              height: isMobile ? 400 : 520,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 🔹 Video OR Image
                  hasYoutubeVideo
                      ? YoutubeHero(videoId: project.youtubeVideoId ?? '')
                      : Image.asset(
                    project.imageUrl,
                    fit: BoxFit.cover,
                  ),

                  // 🔹 Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // 🔹 Text content
                  Padding(
                    padding: EdgeInsets.all(isMobile ? 20 : 60),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.category.toUpperCase(),
                            style: GoogleFonts.archivo(
                              color: Colors.white70,
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ).animate().fadeIn().slideY(),
                          const SizedBox(height: 10),
                          Text(
                            project.title,
                            style: GoogleFonts.archivo(
                              color: Colors.white,
                              fontSize: isMobile ? 40 : 60,
                              fontWeight: FontWeight.w900,
                            ),
                          ).animate().fadeIn(delay: 200.ms).slideY(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // About Section
            Container(
              padding: EdgeInsets.all(isMobile ? 20 : 60),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About the Project',
                          style: GoogleFonts.archivo(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ).animate().fadeIn().slideY(),
                        const SizedBox(height: 20),
                        Text(
                          project.description,
                          style: GoogleFonts.archivo(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                        ).animate().fadeIn(delay: 100.ms),
                        const SizedBox(height: 30),
                        _ClientDetailsBox(
                          project: project,
                          onLinkTap: _launchUrl,
                        ).animate().fadeIn(delay: 200.ms).slideX(),
                        const SizedBox(height: 50),
                        DevelopmentProcess(project: project),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About the Project',
                                style: GoogleFonts.archivo(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ).animate().fadeIn().slideY(),
                              const SizedBox(height: 20),
                              Text(
                                project.description,
                                style: GoogleFonts.archivo(
                                  fontSize: 18,
                                  height: 1.6,
                                  color: Colors.black87,
                                ),
                              ).animate().fadeIn(delay: 100.ms),

                              SizedBox(height: 50,),

                              DevelopmentProcess(project: project),
                            ],
                          ),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 1,
                          child: _ClientDetailsBox(
                            project: project,
                            onLinkTap: _launchUrl,
                          ).animate().fadeIn(delay: 200.ms).slideX(),
                        ),
                      ],
                    ),
            ),

            // Section Divider
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey[300]!,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Technology Showcase Section
            Container(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 60),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: TechnologyShowcase(technologies: project.technologies)),
                ],
              ),
            ),

            // Section Divider
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey[300]!,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // Gallery Section
            Container(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 60,),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PROJECT GALLERY',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                      fontSize: isMobile ? 40 : 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ).animate().fadeIn().slideY(),
                   SizedBox(height: isMobile ? 0 : 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Explore the visual journey of this project',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ).animate().fadeIn(delay: 300.ms),
                  ),
                  SizedBox(height: isMobile ? 10 : 60),
                  AutoScrollingGallery(photos: project.photos, name : project.title),
                ],
              ),
            ),
            const SizedBox(height: 60),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.archivo(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: GoogleFonts.archivo(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientDetailsBox extends StatefulWidget {
  final Project project;
  final Future<void> Function(String) onLinkTap;

  const _ClientDetailsBox({required this.project, required this.onLinkTap});

  @override
  State<_ClientDetailsBox> createState() => _ClientDetailsBoxState();
}

class _ClientDetailsBoxState extends State<_ClientDetailsBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white : Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? Colors.deepPurple.withOpacity(0.3) : Colors.grey[200]!,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? Colors.deepPurple.withOpacity(0.1) : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 0,
              offset: Offset(0, _isHovered ? 10 : 0),
            ),
          ],
        ),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailItem(label: 'Client', value: widget.project.client),
            _DetailItem(label: 'Year', value: widget.project.year),
            _DetailItem(label: 'Role', value: widget.project.role),
            const SizedBox(height: 20),
            if (widget.project.playStoreLink.isNotEmpty)
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => widget.onLinkTap(widget.project.playStoreLink),
                child: Image.asset('assets/images/play.png', height: 70),
              ),
            if (widget.project.appStoreLink.isNotEmpty)
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => widget.onLinkTap(widget.project.appStoreLink),
                child: Image.asset('assets/images/app-store.png', height: 70),
              ),
          ],
        ),
      ),
    );
  }
}
