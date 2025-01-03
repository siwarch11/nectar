import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Connexion de l'utilisateur avec email et mot de passe
  Future<PigeonUserDetails?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return PigeonUserDetails.fromFirebaseUser(userCredential.user!);
      }
      return null;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          throw Exception('Aucun utilisateur trouvé pour cet email.');
        } else if (e.code == 'wrong-password') {
          throw Exception('Mot de passe incorrect.');
        }
      }
      throw Exception("Erreur de connexion: $e");
    }
  }

  
  Future<PigeonUserDetails?> signupWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return PigeonUserDetails.fromFirebaseUser(userCredential.user!);
      }
      return null;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          throw Exception('Cet email est déjà utilisé.');
        }
      }
      throw Exception("Erreur d'inscription: $e");
    }
  }

  // Déconnexion de l'utilisateur
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Erreur de déconnexion: $e");
    }
  }
}

class PigeonUserDetails {
  final String uid;
  final String email;
  final String? displayName;

  PigeonUserDetails({
    required this.uid,
    required this.email,
    this.displayName,
  });

  factory PigeonUserDetails.fromFirebaseUser(User user) {
    return PigeonUserDetails(
      uid: user.uid,
      email: user.email ?? "No email",
      displayName: user.displayName ?? "No display name",
    );
  }
}
