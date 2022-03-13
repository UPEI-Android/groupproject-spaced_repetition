import 'package:flutter/material.dart';

/**
 * I initially made this to serve as a splash screen for the application
 * but upon further research, I found out that flutter has a native splash screen
 * package so we use that instead of this widget, making this widget redundant
 */
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