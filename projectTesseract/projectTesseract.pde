PImage button;
PImage pressButton;
PImage pressButtonWBlock;
PImage Block;
PImage player;
PImage evenFloor;
PImage evenWall;
PImage oddFloor;
PImage oddWall;
PImage levelButton1;
PImage levelButton2;
PImage levelButton3;
PImage levelButton4;
PImage levelButton5;
PImage levelButton6;
PImage levelButton7;
PImage levelButton8;
PImage levelButton9;
PImage Pop;
PImage Popbox;
PImage lava;
PImage lavaBurn;
PImage grid;
PImage gridBurn;
PImage logo1;
PImage keys;
int playState;
int load = 0;
String view;
library li;
manager p;
eventTiles e;
Menu m;
PopUp q;

void setup(){
  size(1008,1008);
  background(0);
  player = loadImage("character.png");
}

void draw(){
  if(load == 0){
    loadingScreen();
    load = 1;
  }else if(load == 1){
    loadAll();
    load = 2;
  }else{
    if(playState == 0){
      background(0);
      image(logo1,width/4,width/4,width/2,width/2);
      text("[ Press key to Play ]", width / 2, 3 * width / 4);
    }else if(playState == 1){
      background(0);
      p.drawGame();
      p.triggerEvents();
      fill(255);
      int[] pos = p.getCords();
      image(keys,0,0,width/4,width/4);
      //adjust text based on level world!
      text("X: " + pos[0] + ", Y: " + pos[1] + ", Z: " + pos[2] + ", W: " + pos[3] + ", view is " + view, width / 2, width / 11);
    }else if(playState == 3){
      q.drawPopUp();
    }else if(playState == 4){
      background(255);
      m.drawGame();
      m.triggerEvents();
      fill(0);
      text("world #" + m.worldNum(), width / 2, width / 11);
    }else if(playState == 5){
      background(0);
      fill(255, 60, 25);
      text("Well, you died...", width / 2, width / 4);
      fill(255);
      text("[ Press key to Play ]", width / 2, width / 2);
    }
  }
}

void loadingScreen(){
  textAlign(CENTER);
  textSize(40);
  image(player,width/4,width/4,width/2,width/2);
  text("LOADING. . .",width/2,width/2);
}

void loadAll(){
  playState = 0;
  li = new library();
  p = new manager(0,0,1);
  e = new eventTiles();
  m = new Menu();
  q = new PopUp();
  evenFloor = loadImage("evenFloor.png");
  button = loadImage("unPressedButton.png");
  evenWall = loadImage("evenWall.png");
  oddFloor = loadImage("oddFloor.png");
  oddWall = loadImage("oddWall.png");
  pressButton = loadImage("PressedButton.png");
  pressButtonWBlock = loadImage("PressedButtonWBlock.png");
  Block = loadImage("Block.png");
  levelButton1 = loadImage("level1.png");
  levelButton2 = loadImage("level2.png");
  levelButton3 = loadImage("level3.png");
  levelButton4 = loadImage("level4.png");
  levelButton5 = loadImage("level5.png");
  levelButton6 = loadImage("level6.png");
  levelButton7 = loadImage("level7.png");
  levelButton8 = loadImage("level8.png");
  levelButton9 = loadImage("level9.png");
  Pop = loadImage("PopupBoard.png");
  Popbox = loadImage("PopupButton.png");
  lava = loadImage("lava.png");
  lavaBurn = loadImage("lavaBurn.png");
  grid = loadImage("grid.png");
  gridBurn = loadImage("gridBurn.png");
  logo1 = loadImage("logo1.png");
  keys = loadImage("key.png");
}

void keyPressed(){
  if(playState == 0){
    playState = 1;
  }else if(playState == 1){
    switch(keyCode){
      case 87:
        p.move(4);
        break;
      case 65:
        p.move(3);
        break;
      case 83:
        p.move(2);
        break;
      case 68:
        p.move(1);
        break;
      case 81:
        p.rotatePlane(-1);
        break;
      case 69:
        p.rotatePlane(1);
        break;
      case 82:
        p.restart();
        break;
      case 76:
        p.nextLevel();
        break;
    }
  }else if(playState == 3){
    switch(keyCode){
      case 81:
        p.nextLevel();
        playState = 1;
        break;
      case 69:
        m.warpWorld();
        playState = 4;
        break;
    }
  }else if(playState == 4){
    switch(keyCode){
      case 87:
        m.move(4);
        break;
      case 65:
        m.move(3);
        break;
      case 83:
        m.move(2);
        break;
      case 68:
        m.move(1);
        break;
    }
  }else if(playState == 5){
    playState = 1;
  }
}
