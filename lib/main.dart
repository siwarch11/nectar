import 'package:flutter/material.dart';
import 'package:nectar/screens/home_screen.dart';
import 'package:nectar/screens/splash_screen.dart';
import 'package:nectar/screens/onboarding_screen.dart';
import 'package:nectar/screens/login_screen.dart';

// Importations nécessaires pour Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Assurez-vous que les widgets Flutter sont initialisés avant Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase avec les options de la plateforme actuelle
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Lancement de l'application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nectar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
