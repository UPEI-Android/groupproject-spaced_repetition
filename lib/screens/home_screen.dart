import 'package:flutter/material.dart';

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
                        onPressed: (){print("View was clicked");},
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