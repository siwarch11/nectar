import 'package:flutter/material.dart';
import 'AuthService.dart';

class Authviewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

 
  Future<bool> login(String email, String password, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      
      final user = await _authService.loginWithEmail(email, password);
      _isLoading = false;
      notifyListeners();
      
      if (user != null) {
        return true; 
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

  
  Future<bool> signup(String email, String password, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      final user = await _authService.signupWithEmail(email, password);
      _isLoading = false;
      notifyListeners();

      if (user != null) {
        return true; 
      } else {
        throw Exception("Failed to sign up");
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

 
  Future<void> logout(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      
      await _authService.logout();
      _isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Déconnexion réussie")));
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erreur de déconnexion: $e")));
    }
  }

 
  void clearError() {
    notifyListeners();
  }
}
