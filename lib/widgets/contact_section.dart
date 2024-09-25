import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/constants/size.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool isHovered = false;

  void _handleSubmit() {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (name.isNotEmpty && email.isNotEmpty && message.isNotEmpty) {
      // Handle form submission logic here
      print("Name: $name, Email: $email, Message: $message");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message submitted successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 93, 93, 237),
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }

                // else
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 15),
          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              controller: _messageController,
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          // send button with hover effect
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isHovered ? Colors.blueAccent : Colors.blue,
                  ),
                  onPressed: _handleSubmit,
                  child: const Text("Submit"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),

          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () =>
                    _launchUrl('https://github.com/Alokkumar2003-Coder'),
                child: Image.asset(
                  "assets/github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchUrl(
                    'https://www.linkedin.com/in/alok-kumar-94399028a/'),
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchUrl('https://x.com/alokkumar29396'),
                child: Image.asset(
                  "assets/tw.jpeg",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () =>
                    _launchUrl('https://www.instagram.com/alok_____gangwar/'),
                child: Image.asset(
                  "assets/instagram.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 15),
        // email
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(height: 15),
        // email
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
