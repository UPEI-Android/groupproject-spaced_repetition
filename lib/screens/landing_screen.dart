import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget
{

  const LandingScreen();

  @override
  State<LandingScreen> createState() => _LandingScreen();


}

class _LandingScreen extends State<LandingScreen>
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
                      image: AssetImage("assets/logo.jpeg"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lets Get you Started!",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),

                    Container(
                      child: Column(
                        children: <Widget>[
                      const Text(
                      "Are you a New Member?",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.0
                        ),
                      ),
                          ElevatedButton(
                            onPressed: () { 
                              Navigator.pushNamed(context, "/register_page");
                            },
                            child: Text("Register"),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 35)
                            )
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                    ),

                    Container(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            "Already have an account?",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/sign_in_page");
                            },
                            child: Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 35)
                            )

                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                    )
                  ],
                )
            )));
  }

}