import 'package:firebase_auth/firebase_auth.dart';
import 'package:spaced_repetition_app/repositories/database.dart';
class Authenticator {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name) async {
    try {
      print('here');
      UserCredential res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = res.user;
      await DatabaseAction(uid: firebaseUser?.uid).updateUser(name);

      // FirebaseUser user = result.user;
      // return _userFromFirebaseUser(user);
      // dynamic result = await _auth.registerWithEmailAndPassword(email, password);

    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
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