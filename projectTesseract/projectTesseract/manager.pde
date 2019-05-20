public class manager extends levelSlicer{
  private int _tx,_ty;
  private int _size,_level;
  public manager(){
    super(0,0,0);
  }
  public manager(int x, int y,int level){
    super(li.levelSelecter(level)[0][0][0][0][0],li.levelSelecter(level)[0][0][0][0][1],li.levelSelecter(level)[0][0][0][0][2]);
    _level = level;
    setLevel(li.levelSelecter(level)[1]);
    _tx = x;
    _ty = y;
    _size = li.levelSelecter(level)[0][0][0][0][0];
  }
  
  public void restart(){
    super.restart(li.levelSelecter(_level)[0][0][0][0][0],li.levelSelecter(_level)[0][0][0][0][1],li.levelSelecter(_level)[0][0][0][0][2]);
    setLevel(li.levelSelecter(_level)[1]);
    _tx = 0;
    _ty = 0;
    _size = li.levelSelecter(_level)[0][0][0][0][0];
  }
  
  public void nextLevel(){
    _level++;
    restart();
  }
  
  public void setLevel(int x){
    _level = x;
    restart();
  }
  
  public void kill(){
    restart();
    playState = 5;
  }
  
  public void move(int direction){
    //moves you across the screendoor unless in the tesseract you would be hitting something in tesseract
    //1 up, 2 left, 3 down, 4 right
    switch(direction){
      case 1:
        _tx++;
        if(_tx > _size - 1)
          _tx = _size - 1;
        if(getSlice()[_tx][_ty]%10 == 1)
          _tx--;
        if(getSlice()[_tx][_ty]%10 == 3 || getSlice()[_tx][_ty]%10 == 7)
          if(pushBlocks(1))
            pushCube(_tx,_ty,1);
        break;
      case 2:
        _ty++;
        if(_ty > _size - 1)
          _ty = _size - 1;
        if(getSlice()[_tx][_ty]%10 == 1)
          _ty--;
        if(getSlice()[_tx][_ty]%10 == 3 || getSlice()[_tx][_ty]%10 == 7)
          if(pushBlocks(2))
            pushCube(_tx,_ty,2);
        break;
      case 3:
        _tx--;
        if(_tx < 0)
          _tx = 0;
        if(getSlice()[_tx][_ty]%10 == 1)
          _tx++;
        if(getSlice()[_tx][_ty]%10 == 3 || getSlice()[_tx][_ty]%10 == 7)
          if(pushBlocks(3))
            pushCube(_tx,_ty,3);
        break;
      case 4:
        _ty--;
        if(_ty < 0)
          _ty = 0;
        if(getSlice()[_tx][_ty]%10 == 1)
          _ty++;
        if(getSlice()[_tx][_ty]%10 == 3 || getSlice()[_tx][_ty]%10 == 7)
          if(pushBlocks(4))
            pushCube(_tx,_ty,4);
        break;
    }
    setSubCords(_tx,_ty);
  }
  
  private boolean pushBlocks(int direction){
    //pushes blocks, returns true if it happened
    switch(direction){
      case 1:
        if(_tx + 1 > _size - 1){
          _tx = _size - 2;
          return false;
        }else if(getSlice()[_tx + 1][_ty]%10 == 2 && getSlice()[_tx + 1][_ty]%10 == 1){
          _tx--;
          return false;
        }
        break;
      case 2:
        if(_ty + 1 > _size - 1){
          _ty = _size - 2;
          return false;
        }else if(getSlice()[_tx][_ty + 1]%10 == 2 && getSlice()[_tx][_ty + 1]%10 == 1){
          _ty--;
          return false;
        }
        break;
      case 3:
        if(_tx - 1 < 0){
          _tx = 1;
          return false;
        }else if(getSlice()[_tx - 1][_ty]%10 == 2 && getSlice()[_tx - 1][_ty]%10 == 1){
          _tx++;
          return false;
        }
        break;
      case 4:
        if(_ty - 1 < 0){
          _ty = 1;
          return false;
        }else if(getSlice()[_tx][_ty - 1]%10 == 2 && getSlice()[_tx][_ty - 1]%10 == 1){
          _ty++;
          return false;
        }
        break;
    }
    return true;
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
        if(arr[i][j]%10 == 2){
          fill(232, 215, 30);
          rect(i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 3){
          image(Block,i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 4){
          image(e.eventdraw(arr[i][j]/10),i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 5){
          image(lava,i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 6){
          image(grid,i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 7){
          image(e.activeEventdraw(arr[i][j]/10),i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 8){
          image(lavaBurn,i * w / l, a + j * w / l, w / l, w / l);
        }else if(arr[i][j]%10 == 9){
          image(gridBurn,i * w / l, a + j * w / l, w / l, w / l);
        }
      }
    }
    if(getSlice()[_tx][_ty]%10 == 4)
      image(e.pActiveEventdraw(arr[_tx][_ty]/10),_tx * w / l, a + _ty * w / l, w / l, w / l);
    fill(250);
    image(player,_tx * w / l, a + _ty * w / l, w / l, w / l);
    if(arr[_tx][_ty]%10 == 2){
      text("! YOU DID IT !",_tx * w / l, a + _ty * w / l, w / l, w / l);
      q.ask();
    }
    if(arr[_tx][_ty]%10 == 5){
      kill();
    }
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
    
    for(int i = 0; i < l; i++){
      for(int j = 0; j < l; j++){
        if(arr[i][j]%10 == 8 ){
          setSubSquare(i,j,5);
        }
        if(arr[i][j]%10 == 9 ){
          setSubSquare(i,j,6);
        }
      }
    }
  }
}
