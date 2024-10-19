import 'dart:async';
import 'package:chat/UI/second_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SecondSplashScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        'assets/Splash (2).jpg',
      ),
    );
  }
}
