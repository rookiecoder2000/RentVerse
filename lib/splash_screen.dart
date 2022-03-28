import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'package:rentverse1/welcomepage.dart';
import 'package:rentverse1/welcomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => welcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                titleHugeFont(38.0, 'Welcome To', Colors.indigo),
                Container(
                  child: Image.asset(
                    'assets/images/rentlogo.png',
                    height: 200.0,
                    width: 300.0,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            CircularProgressIndicator(
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
