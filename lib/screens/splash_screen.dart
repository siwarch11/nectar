import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
           
            Image.asset(
              'lib/assets/images/logo.png',
              width: 80, 
              height: 80, 
            ),
            const SizedBox(width: 15), 
            
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
