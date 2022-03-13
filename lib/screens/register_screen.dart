import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget
{
  RegisterScreen();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDC1A22),
        centerTitle: true,
        title: Text("Register to get Started"),
      ),
        body: Container(
          color: const Color(0xFFDC1A22),
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Column(
            children:<Widget>[
              const Image(
                  image: AssetImage("assets/logo.jpeg")
              ),

              Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(    // new line
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What name do you want displayed?',
                        labelText: 'Display Name',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'What is your email address?',
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: 'Password to secure your account?',
                        labelText: 'Password',
                      ),
                    ),

                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    print("I do nothing yet");
                    },
                  child: const Text('Submit'),

                )],
                ),
              ),
            ),
          ),
        ]
              )
        )
    );
  }

}