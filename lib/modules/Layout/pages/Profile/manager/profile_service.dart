import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profileService {
  static Future<bool> updateAccount({
    required String name,
    required String phone,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);

      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return false;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'phone': phone,
        'name': name,
      });

      return true;
    } catch (e) {
      print('Error updating account: $e');


      return false;
    }
  }
}

