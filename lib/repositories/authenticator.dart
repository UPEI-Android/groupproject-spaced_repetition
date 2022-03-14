import 'package:firebase_auth/firebase_auth.dart';
class Authenticator {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // FirebaseUser user = result.user;
      // return _userFromFirebaseUser(user);
      // dynamic result = await _auth.registerWithEmailAndPassword(email, password);

    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}