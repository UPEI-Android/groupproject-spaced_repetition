
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';
import '../user/userModel.dart';

class DatabaseAction {

  final String? uid;
  UserData? _usr;

  DatabaseAction({ this.uid });
  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore? _instance;

  Future<void> updateUser(String name) async {
    var cardField,courseField;
    DocumentReference cardRef = await  FirebaseFirestore.instance.collection("indexCards").add(
        {
        });
    DocumentReference courseRef = await  FirebaseFirestore.instance.collection("courses").add(
        {
        });
    cardField = 'indexCards/'+cardRef.id;
    courseField = 'courses/' + courseRef.id;
    await userCollection.doc(uid).set({
          'cardData': cardField,
          'name': name,
          'courseData': courseField,
          'courses' : []
        });


  }
  Future<void> updateCourses(List<String> courseArr) async{
    await userCollection.doc(_usr?.uid).set({
      'cardData': _usr?.cardRef,
      'name': _usr?.name,
      'courseData': _usr?.coursesRef,
      'courses' : courseArr
    });
  }
  UserData getUser(){
    return _usr!;
  }
  Future<void> loadUserDataCollectionFromFirebase(String uid) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('users');

    DocumentSnapshot snapshot = await categories.doc(uid).get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> data = snapshot.data() as Map<dynamic, dynamic>;
      print(data);
      _usr = UserData.fromMap(data,uid);

    }
  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<dynamic, dynamic> data = snapshot.data() as Map<dynamic, dynamic>;
    return UserData.fromMap(data,uid!);
  }
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
  // Future<UserData> demo() async {
  //   // String myDocId = 'user.uid';
  //   DocumentSnapshot? documentSnapshot;
  //
  //   await FirebaseFirestore.instance
  //       .collection('users') // suppose you have a collection named "Users"
  //       .doc(uid)
  //       .get()
  //       .then((value) {
  //     documentSnapshot = value; // you get the document here
  //   });
  //
  //   //now you can access the document field value
  //   var name = documentSnapshot?['name'];
  //   var card = documentSnapshot?['cardData'];
  //   var course = documentSnapshot?['courseData'];
  //   // var location = documentSnapshot?['location'];
  //   // return UserData(name: name, cardRef: card, coursesRef: course);
  // }

}