
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/models/question_class.dart';
import 'package:spaced_repetition_app/repositories/SRLogic.dart';

import '../models/User.dart';
import '../user/userModel.dart';
import 'SRLogic.dart';

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
          'indexCards': [],
          'courses' : []
        });


  }
  Future<void> updateCourses(List<String> courseArr) async{

    await userCollection.doc(_usr?.uid).update({
      'courses' : courseArr
    });
  }
  Future<void> addQuestion(String courseName, String qText, String aText, int duration) async{
    int addDays = SRLogic.calculateAddDays(duration);
    DateTime nextReview = DateTime.now();
    nextReview = nextReview.add(Duration(days: addDays));
    print(nextReview);
    await userCollection.doc(_usr?.uid).update({
      'indexCards' : FieldValue.arrayUnion([Question(qText,aText,courseName,1,duration,nextReview).toJson()
      ]
      )
    });
  }
  Future<void> updateQuestion() async{

    await userCollection.doc(_usr?.uid).update({
      'indexCards' : FieldValue.arrayUnion([Question('Question Text','Ans Text','New Course',1,1,DateTime.now()).toJson()
      ]
      )
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


}