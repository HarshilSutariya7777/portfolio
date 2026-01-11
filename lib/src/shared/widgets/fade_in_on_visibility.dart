import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInOnVisibility extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Offset beginOffset;

  const FadeInOnVisibility({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.beginOffset = const Offset(0, 0.2), // Default to vertical slide
  });

  @override
  State<FadeInOnVisibility> createState() => _FadeInOnVisibilityState();
}

class _FadeInOnVisibilityState extends State<FadeInOnVisibility> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('fade-in-${widget.hashCode}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
            _controller.forward();
          });
        }
      },
      child: widget.child
          .animate(controller: _controller, autoPlay: false)
          .fadeIn(duration: widget.duration, delay: widget.delay)
          .slide(begin: widget.beginOffset, end: Offset.zero, duration: widget.duration, curve: Curves.easeOut),
    );
  }
}
