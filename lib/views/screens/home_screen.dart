import 'package:flutter/material.dart';
import 'package:tiktok/views/widgets/custom_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom navigation bar to switch between different sections
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          // Home Tab
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // Home icon
            label: 'Home', // Label for Home tab
          ),

          // Search Tab
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30), // Search icon
            label: 'Search', // Label for Search tab
          ),

          // Custom Upload Button (Centered)
          BottomNavigationBarItem(
            icon: CustomIcon(), // Custom icon for the middle button
            label: ' ', // Empty label for spacing
          ),

          // Messages Tab
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30), // Message icon
            label: 'Message', // Label for Messages tab
          ),

          // Profile Tab
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), // Profile icon
            label: 'Profile', // Label for Profile tab
          ),
        ],
      ),

      // Main body of the screen, currently displaying 'Home' text
      body: Center(
        child: Text('Home'), // Placeholder for the home screen content
      ),
    );
  }
}
