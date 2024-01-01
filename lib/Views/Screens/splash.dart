import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed("/Homepage");
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/quotesbg.gif",
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
