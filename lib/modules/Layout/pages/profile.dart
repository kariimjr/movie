import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final String? imageUrl = user?.photoURL;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Avatar
        CircleAvatar(
          radius: 50,
          backgroundImage: (FirebaseAuth.instance.currentUser?.photoURL != null &&
              FirebaseAuth.instance.currentUser!.photoURL!.isNotEmpty)
              ? AssetImage(FirebaseAuth.instance.currentUser!.photoURL!)
              : const AssetImage("assets/avatars/av1.png"),
        ),
        const SizedBox(height: 20),

        // Name
        Text(
          user?.displayName ?? "Name",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),

        // Email
        Text(
          user?.email ?? "Email",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
