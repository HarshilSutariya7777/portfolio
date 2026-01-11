import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : (isTablet ? 40 : 40), vertical: isMobile ? 40 : (isTablet ? 60 : 100)),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isMobile ? 'FAQs' : 'FREQUENTLY ASKED QUESTIONS',
            textAlign: TextAlign.center,
            style: GoogleFonts.archivo(
              fontSize: isMobile ? 30 : (isTablet ? 35 : 40),
              fontWeight: FontWeight.w900,
            ),
          ),
           SizedBox(height: isMobile ? 20 : (isTablet ? 40 : 80)),
          SizedBox(
            width: isMobile ? double.infinity : (isTablet ? 600 : 800),
            child: Column(
              children: const [
                _FaqItem(
                  question: 'How to begin a project with me?',
                  answer: 'Simply contact me via the contact form or email, and we can discuss your requirements.',
                ),
                _FaqItem(
                  question: 'What are my project charges?',
                  answer: 'Charges vary based on project complexity and scope. Contact me for a quote.',
                ),
                _FaqItem(
                  question: 'What\'s included in my work?',
                  answer: 'I provide end-to-end development, including design, implementation, and deployment support.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _isExpanded = false;


  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column( // Changed Row to Column for centering
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded( // Expanded to ensure text can be centered properly if needed, but here we want the row to fill
                      child: Text(
                        widget.question.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.archivo(
                          fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(_isExpanded ? Icons.remove : Icons.add, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(
              widget.answer,
              textAlign: TextAlign.center,
              style: GoogleFonts.archivo(
                fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                color: Colors.grey[600],
                height: 1.6,
              ),
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
