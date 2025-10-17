import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF312E2B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/note_logo.png',
              width: 200,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}