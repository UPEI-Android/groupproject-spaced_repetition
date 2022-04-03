import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaced_repetition_app/repositories/database.dart';
import 'package:spaced_repetition_app/screens/landing_screen.dart';
import 'package:spaced_repetition_app/screens/sign_in_screen.dart';
import 'package:spaced_repetition_app/screens/register_screen.dart';
import 'package:spaced_repetition_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spaced_repetition_app/navigators/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider (
      create: (_) =>DatabaseAction(),
    )
  ],
    child: MaterialApp(
      title: 'Spaced Repetition',
      initialRoute: "/",
      routes: {
        "/": (context) => const LandingScreen(),
        "/register_page": (context) => RegisterScreen(),
        "/sign_in_screen": (context) => SignInScreen(),
        // "/home_screen": (context) => HomeScreen(),
        "/main_screen": (context) => BottomNavigatorScreen(),
      },
    ),
  ));
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
        "/sign_in_screen": (context) => SignInScreen(),
        // "/home_screen": (context) => HomeScreen(),
        "/main_screen": (context) => BottomNavigatorScreen(),
      },
    );
  }
}