import 'package:spaced_repetition_app/models/question_class.dart';

///This will serve an object for a set of questions
///It will group alike questions for the users ease
///Maybe the questions are related by Subject or a particular field
///This class can help achieve that
class QuestionSet
{
  final String setName;
  final List<Question> questionList;

  QuestionSet( {required this.setName, required this.questionList});

  int get setSize => questionList.length;
}