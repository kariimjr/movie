import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/routes/app_routes_name.dart';
import 'package:movie/core/theme/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../manager/layout_cubit.dart';
import 'edit_profile.dart';
import 'profile_tab_bar/history_tab.dart';
import 'profile_tab_bar/watch_list_tab.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();


    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final profileData =
            snapshot.data!.data() as Map<String, dynamic>? ?? {};
        final avatarUrl = profileData['avatar'] ?? "assets/avatars/av1.png";
        final name = profileData['name'] ?? "Name";
        final watchlistCount =
            (profileData['watchlist'] as List<dynamic>?)?.length ?? 0;
        final historyCount =
            (profileData['history'] as List<dynamic>?)?.length ?? 0;

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
                        padding: const EdgeInsets.symmetric(
                          vertical: 52,
                          horizontal: 24,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          avatarUrl.startsWith('http')
                                          ? NetworkImage(avatarUrl)
                                          : AssetImage(avatarUrl)
                                                as ImageProvider,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 40),
                                Column(
                                  children: [
                                    Text("$watchlistCount"),
                                    const Text("Watch List"),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text("$historyCount"),
                                    const Text("History"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: CustomBut(
                                    isLoading: false,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => BlocProvider.value(
                                            value: context.read<LayoutCubit>(),
                                            child: EditProfile(),
                                          ),
                                        ),
                                      );
                                    },
                                    text: "Edit Profile",
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                      ),
                                      minimumSize: WidgetStatePropertyAll(
                                        Size(
                                          MediaQuery.of(context).size.width,
                                          55,
                                        ),
                                      ),
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                            Colors.redAccent,
                                          ),
                                    ),
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacementNamed(
                                        context,
                                        RouteName.Login,
                                      );
                                    },
                                    child: Text(
                                      "Exit",
                                      style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 3,
                                indicatorColor: AppColors.primaryColor,
                                labelColor: AppColors.primaryColor,
                                unselectedLabelColor: Colors.grey,
                                tabs: const [
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
                                  children: const [
                                    WatchListTab(),
                                    HistoryTab(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int> _getSubcollectionCount(String subcollection, String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(subcollection)
        .get();
    return snapshot.docs.length;
  }
}
