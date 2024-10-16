import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:url_launcher/url_launcher.dart'; 

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/img.jpg",
              width: screenWidth,
              fit: BoxFit.cover, 
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Hi,\nI'm Alok Kumar \nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 190.0,
            child: ElevatedButton(
              onPressed: () {
                _launchUrl('https://drive.google.com/file/d/1AQ-51ZwPOwbqnKJSIHEc3yDxIlF09cTX/view?usp=drivesdk'); // Replace with your CV URL
              },
              child: const Text("Download CV"),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
