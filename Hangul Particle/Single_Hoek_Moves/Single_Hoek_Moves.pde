/*
Single Heok Moves
 2016.09.04
 Created by Flik Jeong
 jsh852@gmail.com
 */

float x=width/2;
float y=width/2;
float r=0;
int mouseMode=0;


int[][] Data = new int[3][10];

randStep[] randX = new randStep[10];
randStep[] randY = new randStep[10];
randStep[] randR = new randStep[10];


void setup() {
  size(640, 360); 
  background(200);
  noStroke();  

  randX[0] = new randStep(320, 15, 0, 640);
  randY[0] = new randStep(180, 15, 0, 360);
  randR[0] = new randStep(720, 15, 0, 1440);

  randX[1] = new randStep(320, 15, 0, 640);
  randY[1] = new randStep(180, 15, 0, 360);
  randR[1] = new randStep(720, 15, 0, 1440);

  randX[2] = new randStep(320, 15, 0, 640);
  randY[2] = new randStep(180, 15, 0, 360);
  randR[2] = new randStep(720, 15, 0, 1440);

  Data[0][0]=0;
}

void draw() { 
  background(200);
  fill(255);

  switch (mouseMode) {
  case 0: //when mouse is not pressed
    for (int i=0; i<3; i++) {
      x = randX[0].walkSmooth();
      y = randY[0].walkSmooth();
      r = randR[0].walkSmooth();
    }
    break;
  case 1: //when mouse is pressed
    x = lerp(x, mouseX, 0.1);
    y = lerp(y, mouseY, 0.1);
    r = lerp(r, 360, 0.05);
    fill(200, 100, 100);
    break;
  default:
    break;
  }
  pushMatrix();
  translate(x, y);  
  rotate(r*PI/180);
  translate(-x, -y);  

  //ellipse(x, y, 10, 30);
  rect(x-5, y-20, 10, 40);

  popMatrix();

  text("press SPACE key\nx=" + x + "\ny=" + y + "\nr=" + r + "\nmm=" + mouseMode, 10, 20);
}



void keyPressed() {
  if (key==' ') {
    mouseMode=1;
    x=randX[0].value;
    y=randY[0].value;
    r=randR[0].value;
  }
}

void keyReleased() {
  mouseMode=0;
}

class randStep {
  int start = 0;
  int end = 0;
  float step = 2;
  int value = 0;
  int destValue = value;

  randStep(int initial, float st, int s, int e) {
    value = initial;
    destValue=value; //Destination of the value

    step = st;
    start = s;
    end=e;
    if (start>end) {
      int temp = start;
      start = end;
      end = temp;
    }
  }

  int walk() {
    value = value + (int)random(-step, step);

    if (value < start) {
      value = start;
    } else if (value > end) {
      value=end;
    }

    return value;
  }

  int walkSmooth() {
    destValue = destValue + (int)random(-step, step);
    value = int(lerp(value, destValue, 0.05));

    if (destValue < start) {
      destValue = start;
    } else if (destValue > end) {
      destValue = end;
    }
    return value;
  }
}



//class Single {

//  Single(String letter) {
//  }
//}