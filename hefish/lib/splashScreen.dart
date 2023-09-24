import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hefish/auth/loginScreen.dart';

import 'constant/styles/imagePallet.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  startsplashScreen() async {
    final duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginScreen(),
        ),
      );
    });
  }

  void initState() {
    super.initState();
    startsplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        color: Colors.transparent,
        child: Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }
}
