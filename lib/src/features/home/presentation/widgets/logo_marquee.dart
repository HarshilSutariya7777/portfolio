import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoMarquee extends StatefulWidget {
  const LogoMarquee({super.key});

  @override
  State<LogoMarquee> createState() => _LogoMarqueeState();
}

class _LogoMarqueeState extends State<LogoMarquee> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  final List<String> logos = const [
    'assets/images/flutter.png',
    'assets/images/dart.png',
    'assets/images/react.png',
    'assets/images/node.svg',
    'assets/images/mysql.png',
    'assets/images/android.png',
    'assets/images/Google.webp',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_scrollController.hasClients) {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(_scrollController.position.pixels + 1.5); // Speed
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Duplicate list to create infinite effect illusion
    final displayLogos = [...logos, ...logos, ...logos, ...logos];

    return Column(
      children: [
        const Divider(height: 1, thickness: 1, color: Colors.black26),
        Container(
          height: 120, // Increased height
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(), // Disable manual scroll
            itemCount: displayLogos.length,
            itemBuilder: (context, index) {
              final logo = displayLogos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30), // Adjusted spacing
                child: logo.endsWith('.svg')
                    ? SvgPicture.asset(
                        logo,
                        height: 110, // Increased size
                        width: 110,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        logo,
                        height: 110, // Increased size
                        width: 110,
                        fit: BoxFit.contain,
                      ),
              );
            },
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black26),
      ],
    );
  }
}
