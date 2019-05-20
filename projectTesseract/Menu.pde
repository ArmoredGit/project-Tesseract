public class Menu extends levelSlicer {
  private int _tx, _ty;
  private int _size, _world;

  public Menu() {
    super(7, 1, 1);
    _world = 1;
    setLevel(li.menuSelecter(1)[1]);
    _tx = 0;
    _ty = 0;
    _size = li.menuSelecter(1)[0][0][0][0][0];
  }
  
  public int worldNum(){
    return _world;
  }
  
  public void warpWorld() {
    super.restart(7, 1, 1);
    setLevel(li.menuSelecter(_world)[1]);
    _tx = 0;
    _ty = 0;
  }

  public void nextWorld() {
    _world++;
    super.restart(7, 1, 1);
    setLevel(li.menuSelecter(_world)[1]);
    _tx = 0;
    _ty = 0;
  }
  
  public void prevWorld() {
    _world--;
    super.restart(7, 1, 1);
    setLevel(li.menuSelecter(_world)[1]);
    _tx = 0;
    _ty = 0;
  }

  public void move(int direction) {
    //moves you across the screendoor unless in the tesseract you would be hitting something in tesseract
    //1 up, 2 left, 3 down, 4 right
    switch(direction) {
    case 1:
      _tx++;
      if (_tx > _size - 1)
        _tx = _size - 1;
      if (getSlice()[_tx][_ty]%10 == 1)
        _tx--;
      break;
    case 2:
      _ty++;
      if (_ty > _size - 1)
        _ty = _size - 1;
      if (getSlice()[_tx][_ty]%10 == 1)
        _ty--;
      break;
    case 3:
      _tx--;
      if (_tx < 0)
        _tx = 0;
      if (getSlice()[_tx][_ty]%10 == 1)
        _tx++;
      break;
    case 4:
      _ty--;
      if (_ty < 0)
        _ty = 0;
      if (getSlice()[_tx][_ty]%10 == 1)
        _ty++;
      break;
    }
    setSubCords(_tx, _ty);
  }
  
  public void drawGame(){
    //draws the full game that you can see projected
    _ty = fixY();
    int w = width * 7 / 8;
    int a = width * 1 / 8;
    int[][] arr = getSlice();
    int l = arr.length;
    for(int i = 0; i < l; i++){
      for(int j = 0; j < l; j++){
        if((i%2 == 1)?j%2 == 1:j%2 == 0){
          fill(120,160,73);
          image(evenFloor,i * w / l, a + j * w / l, w / l, w / l);
          if(arr[i][j]%10 == 1){
            fill(37, 48, 24);
            image(evenWall,i * w / l, a + j * w / l, w / l, w / l);
          }
        }else{
          fill(180,220,133);
          image(oddFloor,i * w / l, a + j * w / l, w / l, w / l);
          if(arr[i][j]%10 == 1){
            fill(75, 89, 59);
            image(oddWall,i * w / l, a + j * w / l, w / l, w / l);
          }
        }
        if(arr[i][j]%10 == 4){
          image(e.eventdraw(arr[i][j]/10),i * w / l, a + j * w / l, w / l, w / l);
        }
      }
    }
    if(getSlice()[_tx][_ty]%10 == 4)
      image(e.pActiveEventdraw(arr[_tx][_ty]/10),_tx * w / l, a + _ty * w / l, w / l, w / l);
    fill(250);
    image(player,_tx * w / l, a + _ty * w / l, w / l, w / l);
  }
  
  public void triggerEvents(){
    //serches for events and triggers them and undose them if req are no longer met
    int l = getSlice().length;
    int[][] arr = getSlice();
    for(int i = 0; i < l; i++){
      for(int j = 0; j < l; j++){
        if((arr[i][j]%10 == 4 && _tx == i && _ty == j) || (arr[i][j]%10 == 7)){
          e.event(arr[i][j]/10);
        }
      }
    }
    
    for(int i = 0; i < l; i++){
      for(int j = 0; j < l; j++){
        if((arr[i][j]%10 != 4 || _tx != i || _ty != j) && (arr[i][j]%10 != 7)){
          e.undoEvent(arr[i][j]/10);
        }
      }
    }
  }
}
