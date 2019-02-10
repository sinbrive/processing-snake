/*-----------------------------------
 snake game by processing
 original author  paper date    2014-07
 Forked by sinBrive Jan 2019
 -------------------------------------*/

ArrayList<Tile> snakeList;

Tile food;

final int wTile = 10;
final int hTile = 10;

int snakeHeadX;
int snakeHeadY;

final color colorFood = #ED1818;

char snakeDirection = 'R';

int backgroundColor = color(0, 255,255);

int bestScore = 2;

boolean gameOverKey = false;

void setup() {

  size(500, 500);

  frameRate(15);

  food = new Tile(int( random(0, width)/wTile  ) * wTile, int( random(0, height)/hTile  ) * hTile, wTile, hTile, colorFood);

  snakeList = new ArrayList<Tile>();

  snakeList.add(new Tile(snakeHeadX, snakeHeadY, wTile, hTile, colorSnake));
  snakeList.add(new Tile(0, 0, wTile, hTile, colorSnake));

  noStroke();
} // end setup


void draw() {

  listenGameOver();

  if ( isSnakeDie() ) {
    return;
  }

  background(backgroundColor);

  if (leftKey && snakeDirection != 'R') snakeDirection = 'L';
  if (rightKey && snakeDirection != 'L' ) snakeDirection = 'R';
  if (downKey && snakeDirection != 'U') snakeDirection = 'D';
  if (upKey && snakeDirection != 'D') snakeDirection = 'U';
  
  switch(snakeDirection) {
  case 'L':
    snakeHeadX -= wTile;
    break;
  case 'R':
    snakeHeadX += wTile;
    break;
  case 'D':
    snakeHeadY += wTile;
    break;
  case 'U':
    snakeHeadY -= wTile;
    break;
  }

   food.display();

  drawSnake();
  
  checkCollision();


}//end draw



void listenGameOver() {
  if ( gameOverKey && keyPressed && (key == 'r' || key == 'R') ) {
    snakeInit();
  }
}

void showGameOver() {
  pushMatrix();

  gameOverKey = true;
  bestScore = bestScore > snakeList.size() ? bestScore : snakeList.size();

  background(0);

  translate(width/2, height/2 - 50);

  fill(255);

  textAlign(CENTER);

  textSize(84);

  text(snakeList.size() + " / " + bestScore, 0, 0);

  fill(120);
  textSize(18);
  text("score / best", 0, 230);
  text("Game over, press 'R' to restart.", 0, 260);

  popMatrix();
}
