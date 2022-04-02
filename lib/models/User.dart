class UserData{

  final String name;
  final String coursesRef;
  final String cardRef;
  final List<String> courses;
  final String uid;
  const UserData(this.name, this.coursesRef, this.cardRef, this.courses, this.uid);
  factory UserData.fromMap(Map<dynamic,dynamic> map, String uid){
    String name = map ['name'] as String;
    String courseRef = map ['courseData'] as String;
    String cardRef = map ['cardData'] as String;
    List<String> courses = map['courses'].cast<String>() as List<String>;
    return UserData(name, courseRef, cardRef, courses, uid);
  }
}