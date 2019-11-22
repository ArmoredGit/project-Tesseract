class manager extends levelSlicer{
  //private var _tx,_ty;
  //private var _size,_level;
  //this class manages the level class at a more abstacted view in order to play the main game
  //it returns needed values and all around runs the game 
  
  //blank constuctor for loading reasons 
  constructor(){
    super(0,0,0);
  }
  
  //constuctor loads in the level and needed variables
  constructor( x, y, level){
    super(li.levelSelecter(level)[0][0][0][0][0],li.levelSelecter(level)[0][0][0][0][1],li.levelSelecter(level)[0][0][0][0][2]);
    this._level = level;
    setLevel(li.levelSelecter(level)[1]);
    this._tx = x;
    this._ty = y;
    this._size = li.levelSelecter(level)[0][0][0][0][0];
  }
  
  //resets the level 
  restart(){
    super.restart(li.levelSelecter(this._level)[0][0][0][0][0],li.levelSelecter(this._level)[0][0][0][0][1],li.levelSelecter(this._level)[0][0][0][0][2]);
    setLevel(li.levelSelecter(this._level)[1]);
    this._tx = 0;
    this._ty = 0;
    this._size = li.levelSelecter(this._level)[0][0][0][0][0];
  }
  
  //go to the next level
  nextLevel(){
    this._level++;
    this.restart();
  }
  
  //fixes the Y after forced rotation and things the like
  fixYNow(){
    this._ty = fixY();
  }
  
  //sets the level to level x
  setLevel(x){
    this._level = x;
    restart();
  }
  
  //restarts the level and displays the dead screen
  kill(){
    restart();
    playState = 5;
  }
  
  //returns the current level
  getLevel(){
    return this._level;
  }
  
  //moves the character in direction
  move( direction){
    //moves you across the screendoor unless in the tesseract you would be hitting something in tesseract
    //1 up, 2 left, 3 down, 4 right
    switch(direction){
      case 1:
        this._tx++;
        if(this._tx > this._size - 1){
          this._tx = this._size - 1;
        }
        if(getSlice()[this._tx][this._ty]%10 == 1){
          this._tx--;
        }
        if(getSlice()[this._tx][this._ty]%10 == 3 || getSlice()[this._tx][this._ty]%10 == 7){
          if(pushBlocks(1)){
            pushCube(this._tx,this._ty,1);
          }
        }
        break;
      case 2:
        this._ty++;
        if(this._ty > this._size - 1){
          this._ty = this._size - 1;
        }
        if(getSlice()[this._tx][this._ty]%10 == 1){
          this._ty--;
        }
        if(getSlice()[this._tx][this._ty]%10 == 3 || getSlice()[this._tx][this._ty]%10 == 7){
          if(pushBlocks(2)){
            pushCube(this._tx,this._ty,2);
          }
        }
        break;
      case 3:
        this._tx--;
        if(this._tx < 0){
          this._tx = 0;
        }
        if(getSlice()[this._tx][this._ty]%10 == 1){
          this._tx++;
        }
        if(getSlice()[this._tx][this._ty]%10 == 3 || getSlice()[this._tx][this._ty]%10 == 7){
          if(pushBlocks(3)){
            pushCube(this._tx,this._ty,3);
          }
        }
        break;
      case 4:
        this._ty--;
        if(this._ty < 0){
          this._ty = 0;
        }
        if(getSlice()[this._tx][this._ty]%10 == 1){
          this._ty++;
        }
        if(getSlice()[this._tx][this._ty]%10 == 3 || getSlice()[this._tx][this._ty]%10 == 7)
          if(pushBlocks(4))
            pushCube(this._tx,this._ty,4);
        break;
    }
    setSubCords(this._tx,this._ty);
  }
  
  //checks if a block can be pushed in direction
  pushBlocks( direction){
    //pushes blocks, returns true if it happened
    switch(direction){
      case 1:
        if(this._tx + 1 > this._size - 1){
          this._tx = this._size - 2;
          return false;
        }else if(getSlice()[this._tx + 1][this._ty]%10 == 2 || getSlice()[this._tx + 1][this._ty]%10 == 1 || getSlice()[this._tx + 1][this._ty]%10 == 3|| getSlice()[this._tx + 1][this._ty]%10 == 7){
          this._tx--;
          return false;
        }
        break;
      case 2:
        if(this._ty + 1 > this._size - 1){
          this._ty = this._size - 2;
          return false;
        }else if(getSlice()[this._tx][this._ty + 1]%10 == 2 || getSlice()[this._tx][this._ty + 1]%10 == 1 || getSlice()[this._tx][this._ty + 1]%10 == 3 || getSlice()[this._tx][this._ty + 1]%10 == 7){
          this._ty--;
          return false;
        }
        break;
      case 3:
        if(this._tx - 1 < 0){
          this._tx = 1;
          return false;
        }else if(getSlice()[this._tx - 1][this._ty]%10 == 2 || getSlice()[this._tx - 1][this._ty]%10 == 1 || getSlice()[this._tx - 1][this._ty]%10 == 3 || getSlice()[this._tx - 1][this._ty]%10 == 7){
          this._tx++;
          return false;
        }
        break;
      case 4:
        if(this._ty - 1 < 0){
          this._ty = 1;
          return false;
        }else if(getSlice()[this._tx][this._ty - 1]%10 == 2 || getSlice()[this._tx][this._ty - 1]%10 == 1 || getSlice()[this._tx][this._ty - 1]%10 == 3 || getSlice()[this._tx][this._ty - 1]%10 == 7){
          this._ty++;
          return false;
        }
        break;
    }
    return true;
  }
  
  //draws the game 
  drawGame(){
    //draws the full game that you can see projected
    this._ty = fixY();
    let w = width * 7 / 8;
    let a = width * 1 / 8;
    let arr = getSlice();
    let l = arr.length;
    for(let i = 0; i < l; i++){
      for(let j = 0; j < l; j++){
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
    if(getSlice()[this._tx][this._ty]%10 == 4){
      image(e.pActiveEventdraw(arr[this._tx][this._ty]/10),this._tx * w / l, a + this._ty * w / l, w / l, w / l);
    }
    fill(250);
    image(player,this._tx * w / l, a + this._ty * w / l, w / l, w / l);
    if(arr[_tx][_ty]%10 == 2){
      text("! YOU DID IT !",this._tx * w / l, a + this._ty * w / l, w / l, w / l);
      q.ask();
    }
    if(arr[this._tx][this._ty]%10 == 5){
      kill();
    }
  }
  
  //runs all buttons and kills all cubes in iligal areas 
  triggerEvents(){
    //serches for events and triggers them and undose them if req are no longer met
    let l = getSlice().length;
    let arr = getSlice();
    for(let i = 0; i < l; i++){
      for(let j = 0; j < l; j++){
        if((arr[i][j]%10 == 4 && this._tx == i && this._ty == j) || (arr[i][j]%10 == 7)){
          e.event(arr[i][j]/10);
        }
      }
    }
    
    for(let i = 0; i < l; i++){
      for(let j = 0; j < l; j++){
        if((arr[j][i]%10 != 4 || this._tx != j || this._ty != i) && (arr[j][i]%10 != 7)){
          e.undoEvent(arr[j][i]/10);
        }
      }
    }
    
    for(let i = 0; i < l; i++){
      for(let j = 0; j < l; j++){
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
