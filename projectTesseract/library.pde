public class library{
  //this class contains all the levels played in the game and some not played in the game and some not
  
  //nothing needed for constuctor, but I did not want to make a static class
  public library(){
    
  }
  
  //format for returrned levels is {{{{{_size,_plane,_planeCount}}}},tesseract} ~ eventualy may add an arrray of sprite references
  //this selects and returns a level from the levels used for mechanics and bug testing
  public int[][][][][] demoSelecter(int level){
    int[][][][][] a = {{{{{7,1,1}}}},demoMapSelecter(level)};
    switch(level){
      default:
        return a;
    }
  }
  
  //this selects and returns a level from the levels used for menu world
  public int[][][][][] menuSelecter(int level){
    int[][][][][] w1 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    int[][][][][] w2 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    int[][][][][] w3 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    int[][][][][] w4 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    int[][][][][] w5 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    int[][][][][] w6 = {{{{{7,1,1}}}},menuMapSelecter(level)};
    switch(level){
      case 1:
        return w1;
      case 2:
        return w2;
      case 3:
        return w3;
      case 4:
        return w4;
      case 5:
        return w5;
      case 6:
        return w6;
      default:
        return w1;
    }
  }
  
  //this selects and returns a level from the levels used for playing the main game
  public int[][][][][] levelSelecter(int level){
    int[][][][][] s1 = {{{{{4,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s2 = {{{{{4,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s3 = {{{{{3,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s4 = {{{{{4,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s5 = {{{{{5,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s6 = {{{{{6,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s7 = {{{{{7,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s8 = {{{{{7,1,1}}}},levelMapSelecter(level)};
    int[][][][][] s9 = {{{{{9,1,1}}}},levelMapSelecter(level)};
    int[][][][][] t3 = {{{{{3,1,3}}}},levelMapSelecter(level)};
    int[][][][][] t4 = {{{{{4,1,3}}}},levelMapSelecter(level)};
    int[][][][][] c1 = {{{{{3,1,2}}}},levelMapSelecter(level)};
    int[][][][][] c2 = {{{{{4,1,2}}}},levelMapSelecter(level)};
    switch(level){
      case 1:
        return s1;
      case 2:
        return s2;
      case 3:
        return s3;
      case 4:
        return s4;
      case 5:
        return s5;
      case 6:
        return s6;
      case 7:
        return s7;
      case 8:
        return s8;
      case 9:
        return s9;
      case 10:
        return c1;
      case 11:
        return c2;
      default:
        return t4;
    }
  }
  
  ////this selects and returns a level from the levels maps used for mechanics and bug testing
  public int[][][][] demoMapSelecter(int level){
    int[][][][] a = {{
      {{0,0,0,0,0,0,0},{0,3,0,0,0,0,0},{0,3,0,0,0,0,0},{0,0,0,0,0,0,0},{0,0,0,0,0,0,0},{0,4,0,1,0,2,0},{174,0,0,0,0,0,0}}}};
    switch(level){
      default:
        return a;
    }
  }
  
  //this selects and returns a level map from the levels used for menu world
  public int[][][][] menuMapSelecter(int level){
    int[][][][] w1 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{0,0,0,0,0,0,424}}}};
    int[][][][] w2 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{434,0,0,0,0,0,424}}}};
    int[][][][] w3 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{434,0,0,0,0,0,424}}}};
    int[][][][] w4 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{434,0,0,0,0,0,424}}}};
    int[][][][] w5 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{434,0,0,0,0,0,424}}}};
    int[][][][] w6 = {{
      {{0,0,0,0,0,0,0},{0,54,0,64,0,74,0},{0,0,0,0,0,0,0},{0,84,0,94,0,104,0},{0,0,0,0,0,0,0},{0,114,0,124,0,134,0},{434,0,0,0,0,0,0}}}};
    
    switch(level){
      case 1:
        return w1;
      case 2:
        return w2;
      case 3:
        return w3;
      case 4:
        return w4;
      case 5:
        return w5;
      case 6:
        return w6;
      default:
        return w1;
    }
  }
  
  //this selects and returns a level map from the levels used for playing the main game
  public int[][][][] levelMapSelecter(int level){
    int[][][][] t4 = {{
      {{0,0,1,0},  {0,0,1,0},  {1,0,0,0},  {0,1,0,1}},
      {{1,1,0,0},  {0,0,0,1},  {0,1,1,1},  {0,0,1,0}},
      {{0,0,0,1},  {0,1,1,0},  {1,0,0,0},  {0,1,0,1}},
      {{1,0,0,1},  {0,0,1,1},  {0,1,1,0},  {0,0,1,0}}},
      {
      {{0,1,1,1},  {1,0,0,1},  {1,1,0,1},  {0,0,1,0}},
      {{0,1,0,0},  {1,1,1,0},  {1,2,1,1},  {0,1,0,1}},
      {{1,0,1,1},  {1,1,0,0},  {0,0,1,1},  {1,1,0,1}},
      {{0,0,1,0},  {0,1,0,1},  {1,1,0,1},  {0,0,1,1}}},
      {
      {{0,0,1,1},  {0,1,1,0},  {1,0,1,1},  {0,1,1,0}},
      {{1,1,0,1},  {0,0,1,1},  {1,1,0,0},  {1,0,1,1}},
      {{0,1,0,0},  {1,0,1,0},  {1,1,0,1},  {1,1,1,0}},
      {{0,0,0,1},  {0,1,1,0},  {0,0,1,1},  {1,0,0,0}}},
      {
      {{1,0,0,0},  {0,1,1,1},  {1,1,0,1},  {0,1,0,0}},
      {{0,0,1,0},  {1,1,1,0},  {0,1,0,0},  {1,0,1,1}},
      {{0,0,1,0},  {1,1,0,1},  {0,1,1,0},  {1,0,0,1}},
      {{1,1,1,0},  {1,0,0,1},  {0,0,1,0},  {0,1,1,1}}}};
    
    int[][][][] t3 = {{
      {{0,0,0},  {1,1,1},  {0,0,0}},
      {{0,1,0},  {0,1,1},  {0,0,1}},
      {{1,0,0},  {0,0,0},  {0,0,1}}},
      {
      {{1,1,1},  {0,1,1},  {0,0,1}},
      {{0,1,1},  {1,2,0},  {0,1,0}},
      {{0,0,0},  {1,1,1},  {0,1,0}}},
      {
      {{0,0,0},  {0,0,0},  {1,1,0}},
      {{1,0,0},  {0,1,1},  {0,0,1}},
      {{0,0,1},  {0,1,0},  {1,0,0}}}};
      
      int[][][][] s1 = {{
      {{0,1,2,0},{0,1,1,0},{0,1,0,0},{0,0,0,1}}}};
      
      int[][][][] s2 = {{
      {{0,1,3,0},{0,1,0,1},{0,1,0,0},{0,24,1,2}}}};
      
      int[][][][] s3 = {{
      {{0,1,0},{0,1,2},{0,3,34}}}};
      
      int[][][][] s4 = {{
      {{0,3,44,0},{1,0,1,1},{0,0,1,2},{3,0,0,0}}}};
      
      int[][][][] s5 = {{
      {{0,0,0,0,5},{3,3,0,0,0},{144,5,0,0,0},{0,1,5,0,144},{5,2,1,0,5}}}};
      
      int[][][][] s6 = {{
      {{0,0,0,1,0,2},{6,1,0,1,0,1},{154,1,0,1,0,0},{1,0,0,0,1,1},{5,0,0,0,0,0},{5,5,5,164,5,5}}}};
      
      int[][][][] s7 = {{
      {{0,0,0,1,1,1,2},{0,194,0,6,0,0,1},{0,0,0,6,214,0,1},{1,6,6,1,5,5,1},{0,0,0,6,0,0,0},{6,184,0,6,0,204,0},{174,6,0,1,5,5,5}}}};
      
      int[][][][] s8 = {{
      {{6,294,0,6,1,0,224},{294,0,0,6,5,5,1},{6,6,6,6,5,1,234},{6,274,6,6,5,244,5},{284,6,0,6,5,1,254},{6,264,0,6,5,5,5},{174,6,6,6,1,0,2}}}};
      
      int[][][][] s9 = {{
      {{0,5,6,6,6,0,0,6,304},{0,317,364,6,1,0,0,0,6},{0,354,324,6,1,0,5,5,5},{0,5,6,6,1,0,0,0,334},{6,1,1,1,1,1,1,1,1},{0,3,374,1,1,6,3,6,414},{397,0,1,0,1,6,3,0,6},{1,0,384,1,1,1,1,1,1},{6,407,5,344,1,2,1,0,0}}}};
      
      int[][][][] c1 = {{
        {{0,0,454},{1,1,1},{444,0,2}},
        {{0,0,0},{1,1,1},{0,1,1}},
        {{444,0,0},{0,0,0},{0,0,454}}}};
        
      int[][][][] c2 = {{
        {{0,0,0,454},{1,1,1,1},{1,1,0,0},{454,444,1,2}},
        {{0,0,0,0},{1,1,1,1},{1,1,1,1},{0,0,1,1}},
        {{0,0,0,0},{1,1,1,1},{1,1,1,1},{0,0,0,0}},
        {{444,0,0,454},{0,3,0,0},{0,0,464,0},{444,0,0,454}}}};
      
      int[][][][] c3 = {{
        {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
        {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}};
        
    switch(level){
      case 1:
        return s1;
      case 2:
        return s2;
      case 3:
        return s3;
      case 4:
        return s4;
      case 5:
        return s5;
      case 6:
        return s6;
      case 7:
        return s7;
      case 8:
        return s8;
      case 9:
        return s9;
      case 10:
        return c1;
      case 11:
        return c2;
      default:
        return t4;
    }
  }
  
}
