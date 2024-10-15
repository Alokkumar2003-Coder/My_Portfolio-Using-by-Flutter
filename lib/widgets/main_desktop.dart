import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  // Replace with your CV URL
  final String cvUrl = 'https://drive.google.com/file/d/1AQ-51ZwPOwbqnKJSIHEc3yDxIlF09cTX/view?usp=drivesdk'; // Update this with your actual CV URL

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Intro message
              const Text(
                "Hi,\nI'm Alok Kumar Software Developer\nin India\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              // Contact button
              SizedBox(
                width: 250.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await canLaunch(cvUrl)) {
                      await launch(cvUrl);
                    } else {
                      throw 'Could not launch $cvUrl';
                    }
                  },
                  child: const Text("Download CV"),
                ),
              ),
            ],
          ),
          // Avatar image with clipping to remove black background
          ClipOval(
            child: Image.asset(
              "assets/img.jpg",
              width: screenWidth / 4,
              fit: BoxFit.cover, // Ensures the image covers the clipped area
            ),
          ),
        ],
      ),
    );
  }
}
