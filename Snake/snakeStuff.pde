final color colorSnake = #7B6DB7;

void snakeInit() {
  snakeList.clear();
  // ini snakelist with 2 Tilees
  snakeList.add(new Tile(snakeHeadX, snakeHeadY, wTile, hTile, colorSnake));
  snakeList.add(new Tile(0, 0, wTile, hTile, colorSnake));
  println(snakeList.size());
  gameOverKey = false;
  snakeDirection = 'R';
  snakeHeadX = 0;
  snakeHeadY = 0;
}

void drawSnake() {
  Tile p;
  for (int i=snakeList.size()-1; i>0; i--) {
    p = snakeList.get(i-1);
    snakeList.set(i, p);
  }

  p = new Tile(snakeHeadX, snakeHeadY, wTile, hTile,colorSnake);
  snakeList.set(0, p);

  for (int i=0; i<snakeList.size(); i++) {
    p = snakeList.get(i);
    p.display();
  }
}

boolean isSnakeDie() {
  if ( snakeHeadX < 0 || snakeHeadX >= width || snakeHeadY < 0 || snakeHeadY >= height) {
    showGameOver();
    return true;
  }

  if ( snakeList.size() > 2 ) {
    for ( int i=1; i<snakeList.size(); i++ ) {
      Tile p;
      p = snakeList.get(i);
      if ( snakeHeadX == p.getX() && snakeHeadY == p.getY() ) {
        showGameOver();
        return true;
      }
    }
  }
  return false;
}

void checkCollision() {
  if ( snakeHeadX == food.getX() && snakeHeadY == food.getY() ) {  // dist(snakeHeadX, snakeHeadY, foodX, foodY) < h
    snakeList.add(new Tile(0, 0, wTile, hTile, colorSnake));
    food = new Tile(int( random(0, width)/wTile  ) * wTile, int( random(0, height)/hTile  ) * hTile, wTile, hTile, colorFood);
  }
}
