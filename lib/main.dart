import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/screens/landing_screen.dart';
import 'package:spaced_repetition_app/screens/splash_screen.dart';
import 'package:spaced_repetition_app/screens/register_screen.dart';
import 'package:spaced_repetition_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spaced Repetition',
      initialRoute: "/",
      routes: {
        "/": (context) => const LandingScreen(),
        "/register_page": (context) => RegisterScreen(),
      },
    );
  }
}
