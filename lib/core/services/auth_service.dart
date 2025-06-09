import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth.dart';

class AuthService implements Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    // Cierra sesión en Google y Firebase
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
