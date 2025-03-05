import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/views/screens/auth/login_screen.dart';
import 'package:tiktok/models/user.dart' as model;
import 'package:tiktok/views/screens/home_screen.dart';

// Controller class to handle user authentication
class AuthController extends GetxController {
  // Creating a static instance to access this controller from anywhere
  static AuthController instance = Get.find();

  // Rx is a reactive variable that updates the UI when the value changes
  late Rx<User?> _user; // Holds the current logged-in user
  late Rx<File?> _pickedImage; // Holds the picked profile image

  // Getter to access the picked profile image
  File? get profilePhoto => _pickedImage.value;

  // Getter to access the current user (ensured non-null)
  User get user => _user.value!;

  // Called when the controller is initialized
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser); // Initialize user state
    _user.bindStream(firebaseAuth.authStateChanges()); // Listen for auth state changes
    ever(_user, _setInitialScreen); // Call _setInitialScreen whenever _user changes
  }

  // Method to navigate the user to the correct screen based on authentication state
  _setInitialScreen(User? user) {
    if (user == null) {
      // If no user is logged in, go to LoginScreen
      Get.offAll(() => LoginScreen());
    } else {
      // If a user is logged in, go to HomeScreen
      Get.offAll(() => const HomeScreen());
    }
  }

  // Method to pick an image from the gallery
  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Show a confirmation message
      Get.snackbar('Profile Picture', 'You have successfully selected your profile picture!');
    }
    // Store the picked image file in _pickedImage
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // Method to upload the selected image to Firebase Storage
  Future<String> _uploadToStorage(File image) async {
    // Create a reference to the user's profile picture in Firebase Storage
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    // Upload the image
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;

    // Get the download URL of the uploaded image
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // Method to register a new user
  void registerUser(String username, String email, String password, File? image) async {
    try {
      // Ensure all fields are filled
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null) {
        // Create a new user in Firebase Authentication
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Upload the profile picture and get the URL
        String downloadUrl = await _uploadToStorage(image);

        // Create a user object
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );

        // Store user details in Firestore
        await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      } else {
        // Show an error message if any field is empty
        Get.snackbar('Error Creating Account', 'Please enter all the fields');
      }
    } catch (e) {
      // Show an error message if registration fails
      Get.snackbar('Error Creating Account', e.toString());
    }
  }

  // Method to log in an existing user
  void loginUser(String email, String password) async {
    try {
      // Ensure fields are filled
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        // Show an error message if any field is empty
        Get.snackbar('Error Logging in', 'Please enter all the fields');
      }
    } catch (e) {
      // Show an error message if login fails
      Get.snackbar('Error Logging in', e.toString());
    }
  }

  // Method to sign out the user
  void signOut() async {
    await firebaseAuth.signOut();
  }
}
