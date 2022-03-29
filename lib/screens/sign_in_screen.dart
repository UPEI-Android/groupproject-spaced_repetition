import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/helper_widgets/snackbar.dart';
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
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
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
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
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
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {

                      // TODO 2: Implement Sign In Authentication
                      /*
                      Registered users will need to be able to sign in and
                      authenticate themselves to use our application and access
                      their information.
                      Use the Sign in cubit here after their values have been
                      authenticated
                       */

                      //Print Value for Us to See
                      // print(_emailController.text);
                      // print(_passwordController.text);

                      /*
                      Use this snackbar to inform user that they are signed in
                       */
                      //SnackBarCreator().showSnackBar(context, "You are signed in");

                      /*
                      Wrap this Navigator.pushNamed statement in an if statement
                       that ensures the user authentication passed and the user
                       can progress to the main screen
                       */
                      Navigator.pushNamed(context, "/main_screen");


                      // _auth.registerWithEmailAndPassword(
                      //     _emailController.text, _passwordController.text);
                      // print("registered without validation");
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
