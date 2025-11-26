import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/routes/app_routes_name.dart';


class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  final user = FirebaseAuth.instance.currentUser;
  TextEditingController nameController = TextEditingController();
  final ProfileFormKey = GlobalKey<FormState>();



  Future<void> deleteAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();

        await user.delete();

        Navigator.pushReplacementNamed(context, RouteName.Login);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: Please re-Login')),

      );

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }





  Future <void>UpdateName(BuildContext contex)async {
    if(!ProfileFormKey.currentState!.validate()){
      try{
        await FirebaseAuth.instance.currentUser?.updateDisplayName(nameController.text);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .update({"name": nameController.text});
        await FirebaseAuth.instance.currentUser?.reload();
        notifyListeners();
      }catch(e,s){
        print(e);


      }
    }


}

}
