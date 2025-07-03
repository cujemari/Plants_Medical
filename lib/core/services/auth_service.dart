import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart'; // Para kIsWeb
import 'auth.dart';

class AuthService implements Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Flutter Web
        final userCredential = await _auth.signInWithPopup(
          GoogleAuthProvider(),
        );
        return userCredential.user;
      } else {
        // Android / iOS
        final googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return null;

        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      debugPrint('Error al iniciar sesión con Google: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
