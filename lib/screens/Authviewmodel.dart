import 'package:flutter/material.dart';
import 'AuthService.dart';

class Authviewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // Login logic using AuthService
  Future<bool> login(String email, String password, BuildContext context) async {
    try {
      final user = await _authService.loginWithEmail(email, password);
      notifyListeners(); // Notify listeners that login has happened
      return user != null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      notifyListeners();
      return false;
    }
  }

  // Logout logic using AuthService
  Future<void> logout(BuildContext context) async {
    try {
      await _authService.logout();
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Logged out successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout error: $e")));
    }
  }

  // Clear any errors (if needed for your app)
  void clearError() {
    notifyListeners();
  }
}
