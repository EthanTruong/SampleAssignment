int squareAmount = 10,
    squareSpeedMin = 6,
    squareSpeedMax = 10;

square[] squares = new square[squareAmount];

void setup() {
  size(500, 300);
  background(50, 50, 50);
  for(int i = 0; i < squareAmount; i++) {
    squares[i] = new square((int)random(0, width/5)*5, (int)random(0, height/5)*5, random(squareSpeedMin, squareSpeedMax));
  }
}

void draw() {
  noStroke();
  fill(10, 10, 10, 20);
  rect(0, 0, width, height);
  for(int i = 0; i < squareAmount; i++) {
    squares[i].move();
    squares[i].display();
  }
}

class square { 
  float xPos;
  int yPos;
  float xSpeed;

  square(int x, int y, float speed) { 
    xPos = x;
    yPos = y;
    xSpeed = speed;
  }

  void display() {
    // #c4fdff
    fill(#ffffff, 180);
    rect(xPos, yPos, 5, 5);
  }

  void move() {
    xPos = xPos + xSpeed;
    if (xPos > width) {
      xPos = 0;
      yPos = (int)random(0, height/5)*5;
      xSpeed = random(squareSpeedMin, squareSpeedMax);
    }
  }
}