class SRLogic{

  List<double> percentage = [0.1, 20, 45, 65,95];
  static int calculateAddDays(int duration){
      return (duration*0.1).round();
  }
}
