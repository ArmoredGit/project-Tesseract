public class PopUp{
  String _message;
  String _falseOption;
  String _trueOption;
  public PopUp(){
    _message = "press 'Q' to Continue\nOr 'E' to go to level select";
    _falseOption = "NO";
    _trueOption = "YES";
  }
  
  public PopUp(String m, String f, String t){
    _message = m;
    _falseOption = f;
    _trueOption = t;
  }
  
  public void ask(){
    playState = 3;
  }
  
  public void drawPopUp(){
    image(Pop, width / 4, width / 4, width / 2, width / 4);
    text(_message, width / 4, width / 4, width / 2, width / 4);
  }
}
