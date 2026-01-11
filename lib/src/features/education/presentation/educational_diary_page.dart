import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/features/education/presentation/widgets/education_card.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationalDiaryPage extends StatelessWidget {
  const EducationalDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
      backgroundColor: Colors.white, // Light background
      endDrawer: isMobile || isTablet ? const MobileDrawer() : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Space for sticky navbar
                
                // Header Section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 80),
                  child: Column(
                    children: [
                      Text(
                        'MY EDUCATION',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: isMobile ? 50 : (isTablet ? 65 : 80),
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Black text
                          letterSpacing: 2,
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
                      
                      const SizedBox(height: 20),
                      
                      Text(
                        'Exploring my academic journey and professional development',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.archivo(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.grey[600], // Darker grey for readability
                          height: 1.5,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
                    ],
                  ),
                ),

                // Education Cards Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : (isTablet ? 60 : 500), vertical: 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Column(
                      children: [
                        EducationCard(
                          title: 'Bachelor of Computer Application (BCA)',
                          subtitle: 'SDJ International College (July 2021 – April 2024)',
                          details: const ['Distinction'],
                          link: 'https://drive.google.com/file/d/1EPB9lh1s_PKLnE6lpHU3xRIZjSOIvi97/view?usp=sharing', // Add link here
                          onTap: () {},
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
                        EducationCard(
                          title: 'Higher Secondary Education',
                          subtitle: 'Tapovan Vidhyalaya (Jun 2020 – Mar 2021)',
                          details: const ['Distinction'],
                          link: 'https://drive.google.com/file/d/1DfGGXDtejq89O0SuJXtfRb1kHA0zOP_6/view?usp=sharing', // Add link here
                          onTap: () {},
                        ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1, end: 0),

                        EducationCard(
                          title: 'Secondary Education',
                          subtitle: 'M N J Patel High School (Jun 2018 – Mar 2019)',
                          details: const ['Distinction'],
                          link: 'https://drive.google.com/file/d/1jgovZHF5uxWxcrvGVdxUlDtOCqcFqctq/view?usp=sharing',
                          onTap: () {},
                        ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.1, end: 0),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 60),
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
}
