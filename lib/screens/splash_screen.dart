import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            
            FaIcon(
              FontAwesomeIcons.carrot,  
              size: 60,  
              color: Colors.white, 
            ),
            SizedBox(width: 15), 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'nectar',
                  style: TextStyle(
                    fontSize: 60, 
                    fontWeight: FontWeight.w900, 
                    color: Colors.white,
                    fontFamily: 'Poppins', 
                    letterSpacing: 3.0, 
                  ),
                ),
                Text(
                  'online groceries',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white70,
                    fontFamily: 'Poppins', 
                    letterSpacing: 4, 
                    fontWeight: FontWeight.w600, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
