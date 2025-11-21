import 'package:firebase_auth/firebase_auth.dart';

class authService {
  static Future<UserCredential?> CreateAccount({
    required String Name,
    required String Email,
    required String Password,
    required String Phone,
    required String Avatar,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
      await credential.user?.updateProfile(displayName: Name);
      await credential.user?.sendEmailVerification();
      await credential.user?.updateDisplayName(Name);
      await credential.user?.updatePhotoURL(Avatar);
      await credential.user?.reload();
      print("${credential.user!.displayName}");

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<UserCredential?> Login({
    required String Email,
    required String Password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      return credential;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Invalid Email or Password.';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      }
    }catch (e) {
      print(e);
    }
  }


}
