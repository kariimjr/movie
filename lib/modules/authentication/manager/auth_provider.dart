
import 'package:flutter/material.dart';

import '../../../core/Dialog/app_dialogs.dart';
import '../../../core/routes/app_routes_name.dart';
import 'auth_service.dart';
import 'package:movie/core/constants/profile_avatar.dart';


class AuthProvider extends ChangeNotifier {
  int avatarIndex=0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Future<void> CreateAcc(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (!formKey.currentState!.validate()){
    }
    {
      isLoading = true;
      notifyListeners();
      try {
        var data = await authService.CreateAccount(
          Name: nameController.text,
          Email: emailController.text,
          Password: passwordController.text,
          Phone: phoneController.text,
          Avatar: AvatarData.Avtar[avatarIndex].images,
        );
        if (data != null && data.user != null) {
          await authService.saveUserData(
            uid: data.user!.uid,
            Name: nameController.text,
            Email: emailController.text,
            Phone: phoneController.text,
            Avatar: AvatarData.Avtar[avatarIndex].images,
          );
          AppDialog.showMessage(
            "Welcome to Movie",
            context,
            type: DialogType.success,
          );
        }
      } catch (e) {
        AppDialog.showMessage(e.toString(), context, type: DialogType.error);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> Login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (!formKey.currentState!.validate())
    {
    }
    isLoading = true;
    notifyListeners();
    try {
      final user = await authService.Login(
        Email: emailController.text.trim(),
        Password: passwordController.text.trim(),
      );

      if (user != null) {
        AppDialog.showMessage(
          "Welcome ${user.user?.displayName ?? ''}",
          context,
          type: DialogType.success,
        );
        Navigator.pushReplacementNamed(context, RouteName.Layout);
      }
    } catch (e) {
      AppDialog.showMessage(
        e.toString(),
        context,
        type: DialogType.error,
      );
    }
    isLoading = false;
    notifyListeners();
  }
  Future<void> ForgetPassword(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await authService.ForgetPassword(
        Email: emailController.text.trim(),
      );
      AppDialog.showMessage(
        "Email Send Successfully",
        context,
        type: DialogType.success,
      );

    } catch (e) {
      AppDialog.showMessage(
        e.toString(),
        context,
        type: DialogType.error,
      );
    }
    isLoading = false;
    notifyListeners();
  }

}