class Ball {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12;

  Ball() {
    reset();
  }

  void checkPaddleLeft(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 15 * cos(angle);
        yspeed = 15 * sin(angle);
        x = p.x + p.w/2 + r;
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = 15 * cos(angle);
        yspeed = 15 * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }




  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xspeed = 15 * cos(angle);
    yspeed = 15 * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void edges() {
    if (y < 0 || y > height) {
      yspeed *= -1;
    }

    if (x - r > width) {
      leftscore++;
      reset();
    }

    if (x + r < 0) {
      rightscore++;
      reset();
    }
  }


  void show() {
    fill(255/2);
    ellipse(x, y, r*2, r*2);
  }
}
