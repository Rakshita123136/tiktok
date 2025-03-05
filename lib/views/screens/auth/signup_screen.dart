import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart'; // Import global constants (like colors)
import 'package:tiktok/controllers/auth_controller.dart'; // Import the authentication controller
import 'package:tiktok/views/screens/auth/login_screen.dart'; // Import the Login screen
import 'package:tiktok/views/widgets/text_input_field.dart'; // Import the custom TextInputField widget

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  // Controllers for handling user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Title
            Text(
              'Tiktok Clone',
              style: TextStyle(
                fontSize: 35,
                color: buttonColor, // Uses predefined button color
                fontWeight: FontWeight.w900,
              ),
            ),
            // Register Heading
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25), // Spacing

            // Profile Picture Selection
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
                  ),
                  backgroundColor: Colors.black, // Default background color
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    // Calls the function to pick an image from the gallery
                    onPressed: () => authController.pickImage(),
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Username Input Field
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _usernameController,
                labelText: 'Username',
                icon: Icons.person,
              ),
            ),
            const SizedBox(height: 15),

            // Email Input Field
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 15),

            // Password Input Field (Obscured for security)
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            const SizedBox(height: 30),

            // Register Button
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor, // Uses predefined button color
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                // Calls the register function when the button is tapped
                onTap: () => authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  authController.profilePhoto,
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Navigation to Login Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  // Navigates to the Login Screen when tapped
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                  child: Text(
                    'Login',
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
