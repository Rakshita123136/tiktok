import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart'; // Importing constants (e.g., colors, styles)

class TextInputField extends StatelessWidget {
  // Controller to manage the text input field
  final TextEditingController controller;

  // Label text that appears inside the text field
  final String labelText;

  // Determines whether the text should be obscured (used for passwords)
  final bool isObscure;

  // Icon to be displayed inside the text field
  final IconData icon;

  // Constructor to initialize required values
  const TextInputField({
    Key? key,
    required this.controller, // Required text controller
    required this.labelText, // Required label text
    this.isObscure = false, // Defaults to false (not obscured)
    required this.icon, // Required icon for input field
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Assigning the text controller
      decoration: InputDecoration(
        labelText: labelText, // Setting the label text
        prefixIcon: Icon(icon), // Adding an icon to the left
        labelStyle: const TextStyle(
          fontSize: 20, // Setting font size for label text
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), // Adding border radius
          borderSide: const BorderSide(
            color: borderColor, // Border color from constants.dart
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners when focused
          borderSide: const BorderSide(
            color: borderColor, // Border color when focused
          ),
        ),
      ),
      obscureText: isObscure, // Hides text if isObscure is true (for passwords)
    );
  }
}
