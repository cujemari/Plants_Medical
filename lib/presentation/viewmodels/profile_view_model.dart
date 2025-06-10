import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/services/auth_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  void loadUser() {
    _user = _authService.currentUser;
    notifyListeners();
  }

  Future<void> logout(BuildContext context, VoidCallback onLogout) async {
    await _authService.signOut();
    onLogout();
  }
}
