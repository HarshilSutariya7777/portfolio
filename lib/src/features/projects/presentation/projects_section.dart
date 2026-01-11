import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/features/projects/data/project_data.dart';
import 'package:harshil/src/features/projects/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final displayProjects = ProjectData.projects.take(4).toList();
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'A SNAPSHOT OF MY RECENT PROJECTS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.archivo(
                    fontSize: isMobile ? 28 : 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : (ResponsiveLayout.isTablet(context) ? 40 : 300)),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 60,
                childAspectRatio: isMobile ? 1.1 : (ResponsiveLayout.isTablet(context) ? 1.0 : 1.3),
              ),
              itemCount: displayProjects.length,
              itemBuilder: (context, index) {
                return ProjectCard(project: displayProjects[index]);
              },
            ),
          ),


          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.push('/projects');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            child: Text('View All', style: GoogleFonts.archivo(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),),
          ),
        ],
      ),
    );
  }
}
