import 'dart:ui';
import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavHeader extends StatelessWidget {
  const NavHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: _buildDesktopHeader(context),
      mobile: _buildMobileHeader(context),
      tablet: _buildTabletHeader(context),
    );
  }

  Widget _buildTabletHeader(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, size: 32, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25), // Stronger blur for iOS feel
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Reduced vertical padding
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // More transparent
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.2), // Subtle border
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ // Reduced logo size
              Row(
                children: [
                  _NavButton(title: 'About Me', onTap: () => context.go('/about')),
                  _NavButton(title: 'Educational Diary', onTap: () => context.go('/education')),
                  _NavButton(title: 'My Projects', onTap: () => context.go('/projects')),
                  _NavButton(title: 'Contact', onTap: () => context.go('/contact')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://drive.google.com/file/d/1HQDtkdRSWNDA-jM4rpawQQ4AAjfvnKnK/view?usp=sharing'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text('Download CV',style: GoogleFonts.archivo(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25), // Stronger blur
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Reduced vertical padding
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6), // More transparent
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, size: 28, color: Colors.black), // Slightly smaller icon
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          _DrawerItem(title: 'Home', onTap: () { context.pop(); context.go('/'); }),
          _DrawerItem(title: 'About Me', onTap: () { context.pop(); context.go('/about'); }),
          _DrawerItem(title: 'Educational Diary', onTap: () { context.pop(); context.go('/education'); }),
          _DrawerItem(title: 'My Projects', onTap: () { context.pop(); context.go('/projects'); }),
          _DrawerItem(title: 'Contact', onTap: () { context.pop(); context.go('/contact'); }),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://drive.google.com/file/d/1HQDtkdRSWNDA-jM4rpawQQ4AAjfvnKnK/view?usp=sharing'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Download CV',style: GoogleFonts.archivo(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.archivo(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton({required this.title, required this.onTap});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.archivo(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: 2,
                width: _isHovered ? 50 : 0, // Expands from center
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
