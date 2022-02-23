import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget
{

  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreen();


}

class _SplashScreen extends State<SplashScreen>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: const Color(0xFFDC1A22),
        child: const Center(
        child: Image(
          image: AssetImage("assets/logo.jpeg"),
        )
    )));
  }

}