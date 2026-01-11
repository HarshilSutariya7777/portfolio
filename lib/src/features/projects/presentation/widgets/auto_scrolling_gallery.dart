import 'dart:async';
import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harshil/src/features/projects/presentation/widgets/full_screen_image_viewer.dart';

class AutoScrollingGallery extends StatefulWidget {
  final List<String> photos;
  final String name;

  const AutoScrollingGallery({
    super.key,
    required this.photos,
    required this.name,
  });

  @override
  State<AutoScrollingGallery> createState() => _AutoScrollingGalleryState();
}

class _AutoScrollingGalleryState extends State<AutoScrollingGallery> {
  late List<ScrollController> _scrollControllers;
  late List<Timer> _timers;

  bool isLightTheme = true;
  static const double scrollSpeed = 80; // Increased speed for mobile

  @override
  void initState() {
    super.initState();
    _scrollControllers = List.generate(3, (_) => ScrollController());
    _timers = [];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  // Get filtered photos based on project and theme
  List<String> _getFilteredPhotos() {
    final source = widget.photos;

    if (widget.name == "Daily Telly") {
      // Daily Telly: 1-14 light, 15+ dark
      if (isLightTheme) {
        return source.length >= 14 ? source.sublist(0, 14) : source;
      } else {
        return source.length > 14 ? source.sublist(14) : [];
      }
    } else if (widget.name == "Rangtarang") {
      // Rangtarang: 1-7 light, 8+ dark
      if (isLightTheme) {
        return source.length >= 7 ? source.sublist(0, 7) : source;
      } else {
        return source.length > 7 ? source.sublist(7) : [];
      }
    }

    // All other projects: show all images
    return source;
  }

  List<List<String>> _distributePhotos() {
    final filteredPhotos = _getFilteredPhotos();

    List<List<String>> rows = [[], [], []];

    // If we have few images (e.g., < 9), populate ALL rows with ALL images
    // but offset them so they look different.
    if (filteredPhotos.length < 9) {
      rows[0] = List.from(filteredPhotos);

      // Row 1: Shift by 1
      if (filteredPhotos.isNotEmpty) {
        rows[1] = [...filteredPhotos.sublist(1), ...filteredPhotos.sublist(0, 1)];
      }

      // Row 2: Shift by 2
      if (filteredPhotos.length > 1) {
        rows[2] = [...filteredPhotos.sublist(2), ...filteredPhotos.sublist(0, 2)];
      } else {
        rows[2] = List.from(filteredPhotos);
      }
    } else {
      // Standard distribution for larger sets
      for (int i = 0; i < filteredPhotos.length; i++) {
        rows[i % 3].add(filteredPhotos[i]);
      }
    }

    // Ensure sufficient items for scrolling by duplicating if count is low
    // We want at least ~10 items per row to ensure smooth scrolling before the loop reset
    for (int i = 0; i < rows.length; i++) {
      if (rows[i].isNotEmpty) {
        while (rows[i].length < 10) {
          rows[i] = [...rows[i], ...rows[i]];
        }
      }
    }

    // One final duplication for the seamless loop effect
    for (int i = 0; i < rows.length; i++) {
      if (rows[i].isNotEmpty) {
        rows[i] = [...rows[i], ...rows[i]];
      }
    }

    return rows;
  }

  void _startAutoScroll() async {
    // Wait for layout to complete to ensure maxScrollExtent is available
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    // Cancel existing timers
    for (var t in _timers) {
      t.cancel();
    }
    _timers.clear();

    final rows = _distributePhotos();

    for (int i = 0; i < 3; i++) {
      if (!_scrollControllers[i].hasClients || rows[i].isEmpty) continue;

      double direction = i == 1 ? -1 : 1;
      double maxScroll = _scrollControllers[i].position.maxScrollExtent;

      // Reset position if needed
      if (_scrollControllers[i].offset == 0 && direction == -1) {
         _scrollControllers[i].jumpTo(maxScroll);
      }

      _timers.add(
        Timer.periodic(const Duration(milliseconds: 16), (_) async {
          if (!_scrollControllers[i].hasClients || !mounted) return;

          double current = _scrollControllers[i].offset;
          double next = current + (direction * (scrollSpeed * 0.016));

          final max = _scrollControllers[i].position.maxScrollExtent;

          if (direction == 1 && next >= max) {
            _scrollControllers[i].jumpTo(0);
          } else if (direction == -1 && next <= 0) {
            _scrollControllers[i].jumpTo(max);
          } else {
            _scrollControllers[i].jumpTo(next); // Use jumpTo for smoother continuous scroll without animation overhead
          }
        }),
      );
    }
  }

  void _openFullScreen(int idx) {
    // Get the full photo list for full-screen viewing
    final allPhotos = widget.photos;

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (_, a, b) =>
            FullScreenImageViewer(photos: allPhotos, initialIndex: idx),
        transitionsBuilder: (_, a, b, child) => FadeTransition(opacity: a, child: child),
      ),
    );
  }

  @override
  void dispose() {
    for (var t in _timers) t.cancel();
    for (var c in _scrollControllers) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _distributePhotos();

    return Column(
      children: [
        // Show theme chips for Daily Telly and Rangtarang
        if (widget.name == "Daily Telly" || widget.name == "Rangtarang")
          _buildThemeChips(),

        for (int i = 0; i < 3; i++)
          if (rows[i].isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: _buildAnimatedRow(rows[i], i),
            ),
      ],
    );
  }

  // ⭐ THEME CHIP UI
  Widget _buildThemeChips() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip(
            label: Text("Light", style: GoogleFonts.archivo(fontSize: 18)),
            selected: isLightTheme,
            onSelected: (_) {
              setState(() {
                isLightTheme = true;
              });
              // Restart scrolling with new filtered photos
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _startAutoScroll();
              });
            },
            selectedColor: Colors.black,
            backgroundColor: Colors.grey[300],
            side: BorderSide(color: isLightTheme ? Colors.black : Colors.grey, width: 1.6),
            showCheckmark: false,
            labelStyle: TextStyle(color: isLightTheme ? Colors.white : Colors.black),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          const SizedBox(width: 12),
          ChoiceChip(
            label: Text("Dark", style: GoogleFonts.archivo(fontSize: 18)),
            selected: !isLightTheme,
            onSelected: (_) {
              setState(() {
                isLightTheme = false;
              });
              // Restart scrolling with new filtered photos
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _startAutoScroll();
              });
            },
            selectedColor: Colors.black,
            backgroundColor: Colors.grey[700],
            side: BorderSide(color: !isLightTheme ? Colors.black : Colors.grey, width: 1.6),
            showCheckmark: false,
            labelStyle: TextStyle(color: !isLightTheme ? Colors.white : Colors.white70),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
        ],
      ),
    );
  }

  // ⭐ ANIMATED AUTO-SCROLLING ROWS
  Widget _buildAnimatedRow(List<String> rowPhotos, int rowIndex) {
    final source = widget.photos;
    final isMobile = ResponsiveLayout.isMobile(context);

    // Determine if this is a desktop/web project (landscape images)
    final isDesktopProject = widget.name == "Rangtarang" ||
                             widget.name == "Angel Motors" ||
                             widget.name == "Maa Swasth Admin Panel";

    // Set dimensions based on project type
    double imageHeight = isDesktopProject ? 550 : 900;
    double imageWidth = isDesktopProject ? widget.name == "Angel Motors" ? 850 : 650 : 380;

    if (isMobile) {
      imageHeight = isDesktopProject ? 230 : 400; // Taller for mobile screenshots
      imageWidth = isDesktopProject ? 280 : 160; // Narrower aspect ratio
    }

    return SizedBox(
      height: imageHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollControllers[rowIndex],
        itemCount: rowPhotos.length,
        itemBuilder: (_, index) {
          final photoPath = rowPhotos[index];
          final originalIndex = source.indexOf(photoPath);
          if (originalIndex == -1) return const SizedBox();

          return Padding(
            padding: const EdgeInsets.only(right: 22),
            child: GestureDetector(
              onTap: () {
                debugPrint("Gallery image tapped: $originalIndex");
                _openFullScreen(originalIndex);
              },
              behavior: HitTestBehavior.opaque,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  width: imageWidth,
                  margin: EdgeInsets.symmetric(vertical: isMobile ? 25 : 35), // Increased vertical margin for shadow
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white, // White background for shadow visibility
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                        color: Colors.black.withOpacity(0.15), // Visible shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      photoPath,
                      fit: isMobile ? BoxFit.cover : (isDesktopProject ? widget.name == "Angel Motors" ? BoxFit.cover : BoxFit.fill : BoxFit.cover),
                      alignment: Alignment.center,
                      errorBuilder: (_, e, s) => Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported, size: 60),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}