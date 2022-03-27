import 'package:spaced_repetition_app/questions/question_class.dart';

///This will serve an object for a set of questions
///It will group alike questions for the users ease
///Maybe the questions are related by Subject or a particular field
///This class can help achieve that
class QuestionSet
{
  final String setName;
  final List<Question> questionList;

  QuestionSet( {required this.setName, required this.questionList});

  //get the size of the list
  int get listSize => questionList.length;

  //add questions to the list
  void addQuestion(Question newQ){
    questionList.add(newQ);
  }

  //get the question in the index of the list
  Question getQuestionAt (int index){
    return questionList[index];
  }
}