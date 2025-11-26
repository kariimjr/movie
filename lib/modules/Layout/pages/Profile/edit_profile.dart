import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/theme/app_colors.dart';
import 'package:movie/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'manager/profile_provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Profile")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 16),
              child: ChangeNotifierProvider(
                create: (context) => ProfileProvider(),
                child: Consumer<ProfileProvider>(
                  builder: (BuildContext context, profileProvider, child) {
                    return Form(
                      key: profileProvider.ProfileFormKey,
                      child: Column(
                        spacing: 50,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                (FirebaseAuth.instance.currentUser?.photoURL !=
                                        null &&
                                    FirebaseAuth
                                        .instance
                                        .currentUser!
                                        .photoURL!
                                        .isNotEmpty)
                                ? AssetImage(
                                    FirebaseAuth.instance.currentUser!.photoURL!,
                                  )
                                : const AssetImage("assets/avatars/av1.png"),
                          ),
                          Column(
                            spacing: 20,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  return null;
                                },
                                onTapOutside: (event) =>
                                    FocusManager.instance.primaryFocus?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.white,
                                  ),
                                  hintText: user?.displayName ?? "User",
                                ),
                             controller: profileProvider.nameController,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your Phone";
                                  }
                                  return null;
                                },

                                onTapOutside: (event) =>
                                    FocusManager.instance.primaryFocus?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.white,
                                  ),
                                  hintText: "",
                                ),
                              ),
                            ],
                          ),

                          Column(
                            spacing: 20,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(
                                    Size(
                                      MediaQuery.of(context).size.width,
                                      55, // fixed height
                                    ),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.redAccent,
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      bool localLoading = false; // local state
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Container(
                                            padding: EdgeInsets.all(20),
                                            height: 300,
                                            child: Column(
                                              spacing: 10,
                                              children: [
                                                Text('Confirm Delete'),
                                                SizedBox(height: 20),
                                                CustomBut(
                                                  text: 'Confirm',
                                                  isLoading: localLoading,
                                                  onPressed: () async {
                                                    setState(
                                                      () => localLoading = true,
                                                    ); // start spinner
                                                    await profileProvider
                                                        .deleteAccount(context);
                                                    setState(
                                                      () => localLoading = false,
                                                    );
                                                    Navigator.pushReplacementNamed(
                                                      context,
                                                      RouteName.Login,
                                                    );
                                                  },
                                                ),

                                                Text(
                                                  '*in case of failure re-Login*',
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ),

                              CustomBut(
                                onPressed: () {
                                  profileProvider.UpdateName(context);
                                },
                                text: "Update Account",
                                isLoading: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
