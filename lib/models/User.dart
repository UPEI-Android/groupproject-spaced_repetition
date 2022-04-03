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
    List<Question> cards = <Question>[];
    // List<Question> indexCards = map['indexCards'].cast<Question>() as List<Question>;
    // final quesData = map['indexCards'];
    // print(quesData[0].questionText.isEmpty);
    // quesData.forEach((val) {
    //   cards?.add(Question.fromMap(val));
    // });
    cards.insert(0, new Question('a', 'answerText', 1, 1, DateTime.now()));
    // print(cards);
    return UserData(name, courseRef, cardRef, courses, uid, cards);
  }
}