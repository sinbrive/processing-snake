class Tile {
  int x, y;
  int w, h;
  color c;

  Tile (int ix, int iy, int iw, int ih, color ic) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    c = ic;
  }

  int getH() { 
    return h;
  }
  int getW() { 
    return w;
  }

  void setH(int ih) { 
    h = ih;
  }
  void setW(int iw) { 
    w = iw;
  }   
  
  
  int getX() { 
    return x;
  }
  int getY() { 
    return y;
  }

  void setX(int ix) { 
    x = ix;
  }
  void setY(int iy) { 
    x = iy;
  }
  
  void display() {
    fill(c);
    rect(x, y, w, h);
  }
}
