/*
recursiveBlossom3_171022c
Flik Jeong
*/

void setup() {
  size(1000,1000);
  background(235);
  noStroke();
  translate(width/2, height/2);
  pattern(width/3, 0);
}

void draw() {
  if (keyPressed) {
    background(235); 
    translate(width/2, height/2);
    pattern(width/3, 0);
  }
}



void pattern(float d, int level) {
  if (level<4) {
    d = d*random(0.2, 0.7);
    float angle = 0;    
    float dAngle = 0;

    pushMatrix();
    while (angle < 2*PI) { 
      fill(235, 4); 
      ellipse(0, 0, 2*d, 2*d);

      fill(100, 40, 40, 80);
      ellipse(0, d/2, 4+(d*0.04), d);

      if (level==3) { 
        fill(220, 100, 100, 120);
        ellipse(0, d, 12, 12);
      }

      translate(0, d);
      pattern(d, level+1);
      translate(0, -d);

      dAngle = random(PI/48, 3*PI/4);
      angle = dAngle + angle;
      rotate(dAngle);
    }
    popMatrix();
  }
}