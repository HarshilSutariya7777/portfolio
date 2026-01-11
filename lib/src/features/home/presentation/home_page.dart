import 'package:flutter/material.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/features/home/presentation/widgets/hero_section.dart';
import 'package:harshil/src/features/home/presentation/widgets/logo_marquee.dart';
import 'package:harshil/src/features/projects/presentation/projects_section.dart';
import 'package:harshil/src/features/home/presentation/widgets/stats_section.dart';
import 'package:harshil/src/features/home/presentation/widgets/faq_section.dart';
import 'package:harshil/src/shared/widgets/fade_in_on_visibility.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Space for sticky navbar
                const HeroSection(),
                const FadeInOnVisibility(child: LogoMarquee()),
                const FadeInOnVisibility(child: ProjectsSection()),
                const StatsSection(), // Has its own visibility logic
                const FadeInOnVisibility(child: FaqSection()),
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
