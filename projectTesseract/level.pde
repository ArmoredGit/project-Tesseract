public class levelSlicer{
  private int _size,_planeCount,_rotation;
  private int _x;
  private int _y;
  private int _z;
  private int _w;
  private int[][][][] teseract;
  public levelSlicer(int size, int plane, int planes){
    _size = size;
    _planeCount = planes;
    _rotation = plane;
    teseract = new int[size][size][size][size];
    view = "X/Y";
    _x = 0;
    _y = 0;
    _z = 0;
    _w = 0;
  }
  
  public void restart(int size, int plane, int planes){
    _size = size;
    _planeCount = planes;
    _rotation = plane;
    teseract = new int[size][size][size][size];
    view = "X/Y";
    _x = 0;
    _y = 0;
    _z = 0;
    _w = 0;
  }
  
  //marking scheme for teserct w z y x
  //x is the rotational acess and doesn't change upon spin
  //planes are 1 = xy , 2 = xz , 3 = xw
  
  public void setLevel(int[][][][] arr){
    teseract = arr;
  }
  
  public void setCords(int x, int y, int z, int w){
    _x = x;
    _y = y;
    _z = z;
    _w = w;
  }
  
  public int[] getCords(){
    int[] arr = {_x,_y,_z,_w};
    return arr;
  }
  
  public void setSubCords(int x, int y){
    if(_rotation == 1){
      _y = y;
      _x = x;
    }else if(_rotation == 2){
      _z = y;
      _x = x;
    }else if(_rotation == 3){
      _w = y;
      _x = x;
    }
  }
  
  public int[][] getSlice(){
    // get the 2D slice of the tesseract
    int[][] arr = new int[_size][_size];
    for(int i = 0; i < _size; i++){
      for(int j = 0; j < _size; j++){
        if(_rotation == 1)
          arr[i][j] = teseract[_w][_z][j][i];
        else if(_rotation == 2)
          arr[i][j] = teseract[_w][j][_y][i];
        else if(_rotation == 3)
          arr[i][j] = teseract[j][_z][_y][i];
      }
    }
    return arr;
  }
  
  public void rotatePlane(int r){
    _rotation += r;
    if(_rotation < 1)
      _rotation = _planeCount;
    if(_rotation > _planeCount)
      _rotation = 1;
    //swaps to the next plane ex. xy to xz
  }
  
  public int fixY(){
    if(_rotation == 1){
      view = "X/Y";
      return _y;
    }else if(_rotation == 2){
      view = "X/Z";
      return _z;
    }else if(_rotation == 3){
      view = "X/W";
      return _w;
    }
    return _y;
  }
  
  public int getSubSquare(int x, int y){
    //sets the point in the tesseract by giving 2d cords of the slice
    int i = 0;
    if(_rotation == 1){
      i = teseract[_w][_z][y][x];
    }else if(_rotation == 2){
      i = teseract[_w][y][_y][x];
    }else if(_rotation == 3){
      i = teseract[y][_z][_y][x];
    }
    return i;
  }
  
  public int setSubSquare(int x, int y, int set){
    //sets the point in the tesseract by giving 2d cords of the slice
    int i = 0;
    if(set == 0 && getSubSquare(x,y) == 3)
      set = 3;
    if(_rotation == 1){
      i = teseract[_w][_z][y][x];
      teseract[_w][_z][y][x] = set;
    }else if(_rotation == 2){
      i = teseract[_w][y][_y][x];
      teseract[_w][y][_y][x] = set;
    }else if(_rotation == 3){
      i = teseract[y][_z][_y][x];
      teseract[y][_z][_y][x] = set;
    }
    return i;
  }
  
  public void pushCube(int x, int y, int augment){
    //pushes a block at xy in the direcrtion augment 
    if(_rotation == 1){
      teseract[_w][_z][y][x] -= 3;
    }else if(_rotation == 2){
      teseract[_w][y][_y][x] -= 3;
    }else if(_rotation == 3){
      teseract[y][_z][_y][x] -= 3;
    }
    switch(augment){
      case 1:
        x++;
        break;
      case 2:
        y++;
        break;
      case 3:
        x--;
        break;
      case 4:
        y--;
        break;
    }
    if(_rotation == 1){
      teseract[_w][_z][y][x] += 3;
    }else if(_rotation == 2){
      teseract[_w][y][_y][x] += 3;
    }else if(_rotation == 3){
      teseract[y][_z][_y][x] += 3;
    }
  }
  
  public void setSquare(int x, int y, int z, int w, int set){
    //sets the point in the tesseract via 4d point
    teseract[w][z][y][x] = set;
  }
}
