import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),

      ),
      body: Center(
        child: Column(
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  (FirebaseAuth
                      .instance
                      .currentUser
                      ?.photoURL !=
                      null &&
                      FirebaseAuth
                          .instance
                          .currentUser!
                          .photoURL!
                          .isNotEmpty)
                      ? AssetImage(
                    FirebaseAuth
                        .instance
                        .currentUser!
                        .photoURL!,
                  )
                      : const AssetImage("assets/avatars/av1.png"),
                ),

              ],
            ),

          ],
        ),
      ),
      
    );
  }
}
