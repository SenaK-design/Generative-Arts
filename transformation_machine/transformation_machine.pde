float angle1=PI/4;
float angle2=PI/3;

int val=0;
void setup(){
 size(1000,1000);
 noStroke();
}

void draw(){
background(0,0,0);
//키보드입력
keyP();
//1
translate(200,650);
fill(120,110,180);
rect(0,0,600,100);
//2
translate(300,0);
rotate(-angle1);
fill(255,130,140);
rect(0,-15,400,30);
drawBolt();
//3
translate(400,0);
rotate(-PI/2-angle2);
fill(100,200,150);
rect(0,-15,380,30);
drawBolt();
//4
translate(380,0);
rotate(angle1+angle2-PI/2);
fill(100,150,250);
rect(-15,-15,80,80);
drawBolt();


}

void drawBolt(){
  pushMatrix();
  fill(100);
  for(int i=0;i<6;i++){
      rect(-15,0,30,15*sqrt(3));
      rotate(PI/3);
}
  
fill(0);
ellipse(0,0,15,15);
popMatrix();

}


void keyP(){
 if(val==1){
  switch(key){
   case 'a':
     angle1=angle1+PI/360;
     break;
   case 'd':
     angle1=angle1-PI/360;
     break;
   case 'w':
     angle2=angle2-PI/360;
     break;
   case 's':
     angle2=angle2+PI/360;
     break;
  }
 }
}
  
void keyPressed(){
    key=10;
    val=1;
}
  
void keyReleased(){
    key=10;
    val=0;
}
  
  
  