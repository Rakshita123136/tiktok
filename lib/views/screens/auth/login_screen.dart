import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart'; // Importing constants (e.g., button color)
import 'package:tiktok/views/screens/auth/signup_screen.dart'; // Importing the Signup screen
import 'package:tiktok/views/widgets/text_input_field.dart'; // Importing custom text input field widget
import 'package:tiktok/controllers/auth_controller.dart'; // Importing the authentication controller

// LoginScreen is a StatelessWidget, meaning it does not maintain any internal state.
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // Controllers to retrieve input from text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides the basic structure of the screen
      body: Container(
        alignment: Alignment.center, // Centers the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Aligns children in the center
          children: [
            // App Title
            Text(
              'Tiktok Clone',
              style: TextStyle(
                fontSize: 35, // Large font size for the title
                color: buttonColor, // Using a predefined color
                fontWeight: FontWeight.w900, // Bold text
              ),
            ),
            // "Login" Text
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25), // Spacing between elements

            // Email Input Field
            Container(
              width: MediaQuery.of(context).size.width, // Full width
              margin: const EdgeInsets.symmetric(horizontal: 20), // Side margins
              child: TextInputField(
                controller: _emailController, // Connects input field to controller
                labelText: 'Email',
                icon: Icons.email, // Email icon
              ),
            ),
            const SizedBox(height: 25), // Spacing

            // Password Input Field
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock, // Lock icon for password
                isObscure: true, // Hides password input
              ),
            ),
            const SizedBox(height: 30),

            // Login Button
            Container(
              width: MediaQuery.of(context).size.width - 40, // Slightly smaller than full width
              height: 50, // Button height
              decoration: BoxDecoration(
                color: buttonColor, // Background color
                borderRadius: const BorderRadius.all(Radius.circular(5)), // Rounded corners
              ),
              child: InkWell(
                // When tapped, calls the login function from the auth controller
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15), // Spacing

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centers the row content
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  // Navigates to the signup screen when tapped
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
