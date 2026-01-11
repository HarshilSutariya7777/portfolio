import 'dart:convert';
import 'dart:ui';
import 'package:harshil/src/core/utils/responsive_layout.dart';
import 'package:harshil/src/shared/widgets/footer.dart';
import 'package:harshil/src/shared/widgets/fade_in_on_visibility.dart';
import 'package:harshil/src/shared/widgets/nav_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  Future<void> sendContactMail({
    required String userName,
    required String userEmail,
    required String userPhone,
    required String message,
  }) async {
    const serviceId = "service_jz2slai"; // ✅ Your service ID from EmailJS
    const templateId = "template_d7mrkyh"; // ✅ Your template ID from EmailJS
    const publicKey = "IUWEyZR3DemDVqo8w"; // ✅ Public key from EmailJS

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": publicKey,
        "template_params": {
          "name": userName,        // 👈 matches {{name}}
          "email": userEmail,      // 👈 matches {{email}} (Reply To)
          "phone": userPhone,      // 👈 you can add {{phone}} in body if you want
          "message": message,
        }
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("✅ Email Sent Successfully 🚀");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("✅ Message sent successfully!", style: GoogleFonts.archivo(fontSize: 16)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } else {
      debugPrint("❌ Error: ${response.body}");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("❌ Failed to send message!", style: GoogleFonts.archivo(fontSize: 16)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: isMobile || isTablet ? const MobileDrawer() : null,
      body: Stack(
        children: [
          // Background with subtle gradient or image if desired
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[50]!,
                  Colors.white,
                  Colors.grey[100]!,
                ],
              ),
            ),
          ),
          // Decorative circles for glassy effect background
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.05),
              ),
            ).animate().scale(duration: 2.seconds, curve: Curves.easeInOut),
          ),
          Positioned(
            bottom: 100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.05),
              ),
            ).animate().scale(duration: 2.seconds, delay: 1.seconds, curve: Curves.easeInOut),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Space for sticky navbar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
                    vertical: isMobile ? 40 : 80,
                  ),
                  child: isMobile
                      ? _buildMobileLayout(context)
                      : (isTablet
                          ? _buildTabletLayout(context)
                          : _buildDesktopLayout(context)),
                ),
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

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderSection(context),
        const SizedBox(height: 40),
        _buildContactInfo(context),
        const SizedBox(height: 50),
        _buildGlassyForm(context),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            const SizedBox(height: 40),
            _buildContactInfo(context),
            const SizedBox(height: 50),
            _buildGlassyForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(context),
              const SizedBox(height: 60),
              _buildContactInfo(context),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 6,
          child: _buildGlassyForm(context),
        ),
      ],
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LET\'S WORK\nTOGETHER',
          style: GoogleFonts.archivo(
            fontSize: isMobile ? 40 : 70,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 30),
        Text(
          'Have a project in mind? I\'d love to hear about it. Send me a message and let\'s discuss how we can bring your ideas to life.',
          style: GoogleFonts.archivo(
            fontSize: isMobile ? 16 : 18,
            color: Colors.grey[600],
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.email_outlined, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Me',
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'sutariyaharshil123@gmail.com',
                  style: GoogleFonts.archivo(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildGlassyForm(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send a Message',
                style: GoogleFonts.archivo(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _ContactField(label: 'Name', hint: 'Your Name', controller: _nameController),
              const SizedBox(height: 25),
              _ContactField(label: 'Email', hint: 'Your Email Address', controller: _emailController),
              const SizedBox(height: 25),
              _ContactField(label: 'Contact Number', hint: 'Your Phone Number', controller: _phoneController),
              const SizedBox(height: 25),
              _ContactField(label: 'Message', hint: 'Tell me about your project', maxLines: 5, controller: _messageController),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSending ? null : () async {
                    if (_nameController.text.trim().isEmpty ||
                        _emailController.text.trim().isEmpty ||
                        _phoneController.text.trim().isEmpty ||
                        _messageController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("⚠ Please fill all fields"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return; // ❗ stop execution here
                    }

                    setState(() => _isSending = true);

                    try {
                      await sendContactMail(
                        userName: _nameController.text,
                        userEmail: _emailController.text,
                        userPhone: _phoneController.text,
                        message: _messageController.text,
                      );

                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("✅ Message sent successfully!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("❌ Failed to send: $e"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        );
                      }
                    } finally {
                      if (mounted) setState(() => _isSending = false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    elevation: 10,
                    shadowColor: Colors.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isSending
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                      : const Text(
                    "RSend Message",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ).animate().shimmer(delay: 1000.ms, duration: 1500.ms),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.1, end: 0);
  }
}

class _ContactField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController controller;

  const _ContactField({
    required this.label,
    required this.hint,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.archivo(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: GoogleFonts.archivo(fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.archivo(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }
}
