import java.util.UUID;
String uuid = UUID.randomUUID().toString().substring(0, 16);


float inc = .01;
void setup () {
size(500,500);
}

void draw () {
  smooth();
  strokeJoin(ROUND);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  
  float start = 0;
  translate(0, -50);
  for(int i = 0; i < 6; i++) {
    float xoff = start*i;
    beginShape();
    float wt = 15;
    strokeWeight(wt);
    float factor = i;
    float h = map(factor, 0, 6, 240, 260);
    float s = map(factor, 0, 6, 0, 80);
    float b = map(factor, 0, 6, 100, 90);
    noStroke();
    fill(h,s,90, 40);
    for (int x=0; x<width; x++) {
      float y = noise(xoff)*height;
      vertex(x, y);
      xoff+=inc;
    }
    float dist = random(10,30);
    for (int x=width; x>0; x--) {
      float y = noise(xoff)*height;
      vertex(x, y+100);
      xoff-=inc;
    }
    translate(0, dist);
    endShape(); 
    start+=0.001;
  }
 
  noLoop();
}

void mousePressed() {
  String name = "rects-" + uuid + ".png";
  println(name);
  saveFrame(name);
}
