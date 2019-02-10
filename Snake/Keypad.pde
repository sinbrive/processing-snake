boolean leftKey=false;
boolean rightKey=false;
boolean upKey=false;
boolean downKey=false;

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      leftKey = true;
      break;
    case RIGHT:
      rightKey = true;
      break;
    case DOWN:
      downKey = true;
      break;
    case UP:
      upKey = true;
      break;
    }
  } 
}


void keyReleased() {
   if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      leftKey = false;
      break;
    case RIGHT:
      rightKey = false;
      break;
    case DOWN:
      downKey = false;
      break;
    case UP:
      upKey = false;
      break;
    }
  }  
  
}
