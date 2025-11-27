import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Invalid Email or Password.';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> ForgetPassword({required String Email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Invalid Email or Password.';
      } else {
        throw 'Something went wrong. Try again.';
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> saveUserData({
    required String uid,
    required String Name,
    required String Email,
    required String Phone,
    required String Avatar,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': Name,
        'email': Email,
        'phone': Phone,
        'avatar': Avatar,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving user data: $e');
      throw 'Failed to save user data';
    }
  }
  /// Google Sign-In
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null; // user cancelled

      final googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (!doc.exists) {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'phone': user.phoneNumber ?? '',
            'avatar': user.photoURL ?? '',
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }

      return userCredential;
    } catch (e, st) {
      print('Google Sign-In Error: $e\n$st');
      rethrow;
    }
  }

}
