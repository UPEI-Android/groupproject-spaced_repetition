import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:spaced_repetition_app/screens/landing_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFDC1A22),
        child: Center(
          child: Column(
            children: <Widget>[
              const Image(
                image: AssetImage("assets/logo.jpeg")
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: (){
                          // Navigator.pushNamed(context, "/");

                          //This navigator method comes with the
                          //Persistent Nav Bar package and it helps preseve the bar
                          //and state
                          pushNewScreen(
                            context,
                            screen: LandingScreen(),
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                          );
                        },
                        child: const Text("View Question List"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          textStyle: const TextStyle(fontSize: 28)
                      ),
                    ),
                  ],
                ),
                  padding: EdgeInsets.all(10.0),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){print("Set was clicked");},
                      child: const Text("Set A Question"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          textStyle: const TextStyle(fontSize: 28)
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){print("Setting was clicked");},
                      child: const Text("Settings"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          textStyle: const TextStyle(fontSize: 28)
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
              )

            ],
          )
        )
      )
    );
  }
}