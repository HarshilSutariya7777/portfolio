import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/features/projects/data/project_data.dart';
import 'package:harshil/src/features/projects/presentation/widgets/project_card.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/shared/widgets/fade_in_on_visibility.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
      endDrawer: isMobile || isTablet ? const MobileDrawer() : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Space for sticky navbar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : (isTablet ? 40 : 40), vertical: isMobile ? 0 : (isTablet ? 20 : 80)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInOnVisibility(
                        beginOffset: const Offset(-0.2, 0), // Slide from Left
                        child: Text(
                          'ALL PROJECTS',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivo(
                            fontSize: isMobile ? 40 : (isTablet ? 50 : 60),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      FadeInOnVisibility(
                        delay: const Duration(milliseconds: 200),
                        beginOffset: const Offset(0.2, 0), // Slide from Right
                        child: Text(
                          'Showcasing my expertise in Cross Platform Development',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivo(
                            fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
                            fontWeight: FontWeight.w500,
                            color: Colors.black38
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      FadeInOnVisibility(
                        delay: const Duration(milliseconds: 400),
                        beginOffset: const Offset(0, 0.2), // Slide from Bottom
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : (isTablet ? 40 : 300)),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 1 : 2,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 60,
                              childAspectRatio: isMobile ? 1.1 : (isTablet ? 1.0 : 1.3),
                            ),
                            itemCount: ProjectData.projects.length,
                            itemBuilder: (context, index) {
                              return ProjectCard(project: ProjectData.projects[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const FadeInOnVisibility(child: Footer()),
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
}
