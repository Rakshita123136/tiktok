import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45, // Setting the width of the custom icon
      height: 30, // Setting the height of the custom icon
      child: Stack(
        children: [
          // Left-side colored rectangle (Pink)
          Container(
            margin: const EdgeInsets.only(left: 10), // Shifts it slightly to the right
            width: 38, // Width of the rectangle
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 45, 100), // Pink color
              borderRadius: BorderRadius.circular(7), // Rounded corners
            ),
          ),

          // Right-side colored rectangle (Blue)
          Container(
            margin: const EdgeInsets.only(right: 10), // Shifts it slightly to the left
            width: 38, // Width of the rectangle
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 211, 234), // Blue color
              borderRadius: BorderRadius.circular(7), // Rounded corners
            ),
          ),

          // Center white rectangle with add (+) icon
          Center(
            child: Container(
              height: double.infinity, // Takes full height of parent SizedBox
              width: 38, // Same width as the other rectangles
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(7), // Rounded corners
              ),
              child: const Icon(
                Icons.add, // Add (+) icon
                color: Colors.black, // Black color for visibility
                size: 20, // Icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
