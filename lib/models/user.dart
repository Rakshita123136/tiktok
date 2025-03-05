import 'package:cloud_firestore/cloud_firestore.dart';

// User model class to store user information
class User {
  // User properties
  String name; // Stores the user's name
  String profilePhoto; // Stores the URL of the user's profile picture
  String email; // Stores the user's email
  String uid; // Stores the unique user ID from Firebase Authentication

  // Constructor to initialize the user object
  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
  });

  // Converts the User object into a JSON (Map) format for Firestore storage
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  // Factory method to create a User object from Firestore snapshot data
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>; // Convert snapshot data into a Map
    return User(
      name: snapshot['name'], // Retrieve 'name' from the snapshot
      email: snapshot['email'], // Retrieve 'email' from the snapshot
      uid: snapshot['uid'], // Retrieve 'uid' from the snapshot
      profilePhoto: snapshot['profilePhoto'], // Retrieve 'profilePhoto' from the snapshot
    );
  }
}
