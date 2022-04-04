import 'package:spaced_repetition_app/models/question_class.dart';

class UserData{

  final String name;
  final String coursesRef;
  final String cardRef;
  final List<String> courses;
  final String uid;
  final List<Question> indexCards;
  const UserData(this.name, this.coursesRef, this.cardRef, this.courses, this.uid,this.indexCards);
  factory UserData.fromMap(Map<dynamic,dynamic> map, String uid){
    String name = map ['name'] as String;
    String courseRef = map ['courseData'] as String;
    String cardRef = map ['cardData'] as String;
    List<String> courses = map['courses'].cast<String>() as List<String>;
    // this.indexCards != null ? this.tags.map((i) => i.toJson()).toList() : null;
    // print(map['indexCards'][0]['questionText']);

    List<Question> cards = <Question>[];
    map['indexCards'].forEach((val) => {
      cards.insert(0,Question.fromMap(val))
    });
    print('end here');

    return UserData(name, courseRef, cardRef, courses, uid, cards);
  }
}