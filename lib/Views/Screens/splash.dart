import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
          () {
        Navigator.pushReplacementNamed(context, 'home_page');
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Big_Splash.gif/640px-Big_Splash.gif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}