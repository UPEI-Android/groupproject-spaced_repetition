import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/repositories/authenticator.dart';

class SignInScreen extends StatelessWidget {
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
                Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'What is your email address?',
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        //Validation for Input
                        if (value!.isEmpty) {
                          return "Field Cannot be Empty";
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(value)) {
                          return "Incorrect Email Value";
                        } else {
                          return null;
                        }
                      },
                    )),
                Container(
                    color: Colors.white,
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: 'Password to login to your account',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field Cannot be Empty";
                        } else if (value.length < 8) {
                          return "Field Cannot be less than 8 Characters";
                        } else {
                          return null;
                        }
                      },
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validate returns true if the form is valid, or false otherwise.
                      _auth.registerWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      print("registered without validation");
                    }
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
