import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:harshil/src/features/projects/domain/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/project/${widget.project.id}');
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          )
                        ]
                      : [],
                  image: DecorationImage(
                    image: AssetImage(widget.project.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(_isHovered ? 0.4 : 0.1), // Darker on hover
                      ],
                    ),
                  ),
                  child: _isHovered 
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white.withOpacity(0.5)),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Text(
                                  'VIEW PROJECT',
                                  style: GoogleFonts.archivo(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.project.title.toUpperCase(),
              style: GoogleFonts.archivo(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
             Text(
              widget.project.description,
              style: GoogleFonts.archivo(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'VIEW PROJECT',
                  style: GoogleFonts.archivo(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(left: _isHovered ? 5 : 0),
                  child: const Icon(Icons.arrow_forward, size: 14, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
