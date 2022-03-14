import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/repositories/authenticator.dart';

class RegisterScreen extends StatelessWidget {
  String email = "";
  String password = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // const RegisterScreen();
  final _formKey = GlobalKey<FormState>();

  final Authenticator _auth = Authenticator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFFDC1A22),
      padding: const EdgeInsets.symmetric(horizontal: 43.0),
      child: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage("assets/logo.jpeg")),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'What name do you want displayed?',
                    labelText: 'Display Name',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.alternate_email),
                    hintText: 'What is your email address?',
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Password to secure your account?',
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    _auth.registerWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                    print("registered without validation");
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
