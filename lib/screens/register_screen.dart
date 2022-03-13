import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/repositories/authenticator.dart';

class RegisterScreen extends StatelessWidget
{
  String email = "";
  String password = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // const RegisterScreen();
  final Authenticator _auth = Authenticator();

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
                child:  TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      labelText: 'Email',
                      hintStyle:  TextStyle(color: Colors.white60),
                      hintText: 'Enter an user name'
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
              ),

              Container(
                child:  TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
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
                      onPressed: (){
                         _auth.registerWithEmailAndPassword(_emailController.text, _passwordController.text);
                      },
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