/*
recursive Blossom
in this version, Images are in grid dvided by 16
Flik Jeong
*/
boolean update = true;
int fc = 0;

void setup() {
  size(800, 800);
  background(230);
  strokeJoin(ROUND);
  //rectMode(CENTER);
}



void draw() {
  //fc++;
  if (fc>100) {
    fc = 0;
    update = true;
  }
  //translate(width/2, height/2);
  if (update) {
    background(235);
    int size = width/4;
    for (int x=0; x<width; x+=size ) {
      for (int y=0; y<height; y+=size) {
        pushMatrix();
        translate(size/2 + x, size/2 + y);
        pattern(size, 0);
        popMatrix();
      }
    }
    update= false;
  }
}

void keyPressed() {
  update = true;
}

void pattern(float d, int level) {
  if (level<5) {
    d = d*random(0.1, 0.35);
    pushMatrix();

    float angle = 0;
    float dAngle = 0;
    stroke(180); 
    strokeWeight(1);
    //ellipse(0, 0, 2*d, 2*d);

    while (angle < PI*2) {
      noStroke();
      fill(80, 20, 20, 50);
      ellipse(0, d/2, 4, d);
      //rect(-2, 0, 4, d);

      if (level==4) fill(220, 100, 100, 80);
      else fill(180, 50);

      ellipse(0, 0, 4, 4);

      fill(235, 5);
      noStroke();
      strokeWeight(4);

      ellipse(0, 0, 2*d, 2*d);

      translate(0, d);
      pattern(d, level+1);
      translate(0, -d);

      dAngle = random(PI/12, PI);
      angle = dAngle + angle;
      rotate(PI/2 + dAngle);
    }
    popMatrix();
  }
}