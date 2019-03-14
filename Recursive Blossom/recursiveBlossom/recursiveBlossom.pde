/*
recursiveBlossom_171022c
Flik Jeong
*/

boolean update = true;
int fc = 0;

void setup() {
  size(1440, 840);
  background(230);
  //rectMode(CENTER);
}



void draw() {
  //fc++;
  if (fc>100) {
    fc = 0;
    update = true;
  }
  translate(width/2, height/2);
  if (update) {
    fill(230, 255);
    rect(-width/2, -height/2, width, height);
    pattern(width/2, 0);
    update= false;
  }
}

void keyPressed() {
  update = true;
}

void pattern(float d, int level) {
  if (level<5) {
    d = d*random(0.3, 0.35);
    pushMatrix();
    
    int angle = 0;
    int dAngle = 0;
    while (angle < 2*PI) {
      noStroke();
      fill(80, 20, 20, 50);
      
      rect(-2, 0, 4, d);

      if (level==4) fill(220, 100, 100,180);
      else fill(180,50);

      ellipse(0, 0, 10, 10);

      fill(235, 5);
      noStroke();
      strokeWeight(4);

      ellipse(0, 0, 2*d, 2*d);

      translate(0, d);
      pattern(d, level+1);
      translate(0, -d);

      dAngle = (int)random(PI/6, PI);
      angle = dAngle + angle;
      rotate(dAngle);
    }
    popMatrix();
  }
}