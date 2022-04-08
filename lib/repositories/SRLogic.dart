class SRLogic{

  static List<double> percentage = [0.1, 0.15, 0.20, 0.20,0.3];
  static int calculateAddDays(int duration){
      return (duration*0.1).round();
  }
  static int reviewAction(int duration, int step, bool remember){
    if(step == 5) return(duration * percentage[0]).round();
    double intervalPerc = percentage[step];
    if (remember){
      return(duration * intervalPerc).round();
    }
    else{
      return(duration * percentage[0]).round();
    }
  }
}
