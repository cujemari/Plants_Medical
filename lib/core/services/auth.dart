import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  Future<User?> signInWithGoogle();
  Future<void> signOut();
  User? get currentUser;
  Stream<User?> get authStateChanges;
}
