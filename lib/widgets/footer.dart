import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Made with  ",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const Icon(
            Icons.favorite, // You can use any icon you like
            color: Colors.red, // Change the color if desired
            size: 24, // Adjust the size of the icon
          ),
          const Text(
            "  by Alok Kumar",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
