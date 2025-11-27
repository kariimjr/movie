import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/Dialog/app_dialogs.dart';
import 'package:movie/core/constants/profile_avatar.dart';
import 'package:movie/core/theme/app_colors.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../../layout/manager/layout_cubit.dart';
import '../../../layout/manager/layout_state.dart';
import '../../manager/layout_state.dart'
    hide
        LayoutState,
        UpdateProfileErrorState,
        UpdateProfileSuccessState,
        GetProfileLoadingState,
        UpdateProfileLoadingState;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedAvatarUrl;

  @override
  void initState() {
    super.initState();
    selectedAvatarUrl = FirebaseAuth.instance.currentUser?.photoURL;
  }

  void _changeAvatar(String newUrl) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    setState(() => selectedAvatarUrl = newUrl);

    await user.updatePhotoURL(newUrl);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'avatar': newUrl});
  }

  @override
  Widget build(BuildContext context) {
    final LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    cubit.getProfile();

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile Updated Successfully")),
            );
          }
          if (state is UpdateProfileErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to update profile")),
            );
          }
        },
        builder: (context, state) {
          final data = cubit.profileData ?? {};
          nameController.text =
              data["name"] ?? FirebaseAuth.instance.currentUser?.displayName ?? "";
          phoneController.text = data["phone"] ?? "";

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // Avatar
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColors.secondaryColor,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.9,
                                  mainAxisSpacing: 19,
                                  crossAxisSpacing: 18,
                                ),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  final avatar = AvatarData.Avtar[index].images;
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () => _changeAvatar(avatar),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      height: 105,
                                      width: 108,
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Image.asset(avatar),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 80,
                        backgroundImage: selectedAvatarUrl != null
                            ? (selectedAvatarUrl!.startsWith('http')
                            ? NetworkImage(selectedAvatarUrl!)
                            : AssetImage(selectedAvatarUrl!) as ImageProvider)
                            : const AssetImage("assets/avatars/av1.png"),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 56,
                          child: TextFormField(
                            style: TextStyle(fontSize: 18),

                            controller: nameController,
                            validator: (value) => value == null || value.isEmpty ? "Enter your name" : null,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline, color: AppColors.primaryColor),
                              hintText: "Name",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                          child: TextFormField(
                            style: TextStyle(fontSize: 18),
                            controller: phoneController,
                            validator: (value) => value == null || value.isEmpty ? "Enter your phone" : null,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone_outlined, color: AppColors.primaryColor),
                              hintText: "Phone",
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.resetPassword();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please check your email to reset password")),
                            );
                          },
                          child: const Text("Reset Password", style: TextStyle(fontSize: 18)),
                        ),


                      ],
                    ),

                    Column(
                      spacing: 20,

                      children: [
                        CustomBut(
                          text: "Update Profile",
                          isLoading: state is UpdateProfileLoadingState,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.updateProfile({
                                "name": nameController.text,
                                "phone": phoneController.text,
                                "avatar": selectedAvatarUrl,
                              });
                            }
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                            minimumSize: WidgetStatePropertyAll(
                              Size(MediaQuery.of(context).size.width, 55),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(Colors.redAccent),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                bool loading = false;
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      height: 250,
                                      child: Column(
                                        children: [
                                          const Text("Confirm Delete", style: TextStyle(fontSize: 20)),
                                          const SizedBox(height: 16),
                                          CustomBut(
                                            text: "Confirm",
                                            isLoading: loading,
                                            onPressed: () async {
                                              setState(() => loading = true);
                                              await cubit.deleteUser();
                                              Navigator.pushReplacementNamed(context, RouteName.Login);
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          const Text(
                                            "*Re-login if account deletion fails*",
                                            style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Text("Delete Account", style: TextStyle(fontSize: 18, color: AppColors.secondaryColor)),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

