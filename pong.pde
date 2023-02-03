import processing.sound.*;

Ball ball;

SoundFile ding;

Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;

void setup() {
  size(1920, 1080);
  /* ding = new SoundFile(this,"ding.mp3"); */
  ball = new Ball();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  background(255);

  ball.checkPaddleRight(right);
  ball.checkPaddleLeft(left);

  left.show();
  right.show();
  left.update();
  right.update();

  ball.update();
  ball.edges();
  ball.show();

  textSize(42);
  text(leftscore, 64, 70);
  text(rightscore, width-64, 70);

}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'a') {
    left.move(-10);
  } else if (key == 'z') {
    left.move(10);
  }

  if (key == 'k') {
    right.move(-10);
  } else if (key == 'm') {
    right.move(10);
  }
}
