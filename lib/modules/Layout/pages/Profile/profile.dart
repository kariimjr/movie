import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/routes/app_routes_name.dart';
import 'package:movie/core/theme/app_colors.dart';

import '../../../../core/widgets/custom_btn.dart';
import 'ProfileTabBar/HistoryTab.dart';
import 'ProfileTabBar/WatchListTab.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final String? imageUrl = user?.photoURL;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: AppColors.accentColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:52 ,horizontal:24 ),
                    child: Column(
                      spacing: 20,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 40,
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
                                Text(
                                  user?.displayName ?? "Name",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              spacing: 10,
                              children: [Text("12"), Text("Watch List")],
                            ),
                            Column(
                              spacing: 10,

                              children: [Text("12"), Text("History")],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              flex: 6,
                              child: CustomBut(
                                isLoading: false,
                                onPressed: () {
                                  Navigator.pushNamed(context, RouteName.EditProfile);
                                },
                                text: "Edit Profile",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CustomBut(
                                isLoading: false,
                                onPressed: () async{
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacementNamed(context, RouteName.Login);
                                },
                                text: "Exit",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:
                    DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 3,
                            indicatorColor: AppColors.primaryColor, // color under selected
                            labelColor: AppColors.primaryColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.list, size: 50),
                                text: "Watch List",
                              ),
                              Tab(
                                icon: Icon(Icons.folder, size: 50),
                                text: "History",
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                WatchListTab(),   // your Watch List content
                                HistoryTab(),     // your History content
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
