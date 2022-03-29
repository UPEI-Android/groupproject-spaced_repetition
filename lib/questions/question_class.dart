///This is the question class.
///This class contains the question, the answer and the chosen date that the question will pop up.
///The date will be chosen by divide the input of the time interval the user want
///by 10-20-40-70-100% of the interval based on the spaced repetition method.

class Question {
  //question related
  String questionText;
  String answerText;

  //Course
  String courseName;

  //Spaced Repetition related
  int step;
  int duration;
  DateTime nextReview;

  //constructor for question class
  Question(
      {required this.questionText,
        required this.answerText,
        required this.courseName,
        required this.step,
        required this.duration,
        required this.nextReview});

  //get the question and answer
  String get returnQuestionText => this.questionText;

  String get returnQuestionAns => this.answerText;

  //Retrieve spaced repetition algo values
  int get returnStep => this.step;

  int get returnDuration => this.duration;

  DateTime get returnNextReview => this.nextReview;
}