import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your home screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset('lib/assets/images/logo.png', height: 60),
            ),
            const SizedBox(height: 30),
            const Text(
              'Log In',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your email and password',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Custom TextField for Email with underline
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              ),
            ),
            const SizedBox(height: 15),
            // Custom TextField for Password with underline
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add your forgot password logic here
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Log In Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            // Signup Section
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don’t have an account? '),
                  TextButton(
                    onPressed: () {
                      // Add sign up logic here
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
