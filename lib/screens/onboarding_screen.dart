import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/onboarding.jpg',
              fit: BoxFit.cover,
            ),
          ),
         
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  Image.asset(
                    'lib/assets/images/logo.png',  
                    width: 80,  
                    height: 80, 
                  ),
                  

                  
                  Text(
                    'Welcome to our store',
                    style: TextStyle(
                      fontSize: 62,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.6, 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  
                 
                  Text(
                    'Get your groceries in as fast as one hour',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers l'écran de connexion
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 120, 
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
