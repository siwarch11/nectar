import 'package:flutter/material.dart';
import 'package:nectar/screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nectar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
  '/onboarding': (context) => OnboardingScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  
},

    );
  }
}
