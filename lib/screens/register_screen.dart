import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen();

  @override
  Widget build(BuildContext context){
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
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintStyle: TextStyle(color: Colors.white60),
                      hintText: 'Enter an user name'
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
              ),

              Container(
                child: const TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.white60),
                      hintText: 'Enter a password',
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){print("Up was clicked");},
                      child: const Text("Sign Up"),
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 25)
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
              ),

            ],
          ),
        ),
      ),
    );
  }

}