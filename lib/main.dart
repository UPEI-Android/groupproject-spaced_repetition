import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/screens/landing_screen.dart';
import 'package:spaced_repetition_app/screens/register_screen.dart';
import 'package:spaced_repetition_app/screens/sign_in_page.dart';

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
        "/register_page": (context) => const RegisterScreen(),
        "/sign_in_page": (context) => const SignInPage(),

      },
    );
  }
}
