PShape plan;
PImage txtr;
float rotx, roty;
float initialX, initialY;
float scaleFactor = 2.8;
float scaleChange = 0.1; // Scale change per mouse wheel tick

void setup() {
  size(700, 700, P3D);
  txtr = loadImage("StAuban_texture.jpg");
  plan = loadShape("hypersimple.obj");
  plan.texture(txtr);
  rotx = PI/4;
  roty = PI/4;
}

void draw() {
  background(255);
  
  // Set up camera
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  // Draw coordinate axes
  drawAxes(width/2, height/2, 200.1);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateY(rotx);
  rotateX(roty);
  scale(scaleFactor);
  translate(-50, 60, 185);
  texture(txtr);
  shape(plan);
  popMatrix();
}

void mousePressed() {
  initialX = mouseX;
  initialY = mouseY;
}

void mouseDragged() {
  float dx = (mouseX - initialX) * 0.01;
  float dy = (mouseY - initialY) * 0.01;
  rotx += dx;
  roty -= dy;
  initialX = mouseX;
  initialY = mouseY;
}

void mouseWheel(MouseEvent event) {
  float delta = event.getCount(); // Get mouse wheel movement
  scaleFactor += delta * scaleChange;
}

void drawAxes(float x, float y, float size) {
  strokeWeight(2);
  stroke(255, 0, 0); // X-axis (red)
  line(x, y, x + size, y);
  stroke(0, 255, 0); // Y-axis (green)
  line(x, y, x, y - size);
  stroke(0, 0, 255); // Z-axis (blue)
  line(x, y, x, size);
}
