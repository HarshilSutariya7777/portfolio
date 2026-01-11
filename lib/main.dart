import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harshil/src/core/theme/app_theme.dart';
import 'package:harshil/src/core/utils/smooth_scroll_behavior.dart';
import 'package:harshil/src/features/about/presentation/about_page.dart';
import 'package:harshil/src/features/contact/presentation/contact_page.dart';
import 'package:harshil/src/features/education/presentation/educational_diary_page.dart';
import 'package:harshil/src/features/home/presentation/home_page.dart';
import 'package:harshil/src/features/projects/presentation/project_detail_page.dart';
import 'package:harshil/src/features/projects/presentation/projects_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Harshil Sutariya',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Default to light for now
      scrollBehavior: SmoothScrollBehavior(),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/projects',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ProjectsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/project/:id',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        debugPrint("iddddd:$id");
        return CustomTransitionPage(
          key: state.pageKey,
          child: ProjectDetailPage(projectId: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/education',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const EducationalDiaryPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const ContactPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AboutMePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);
