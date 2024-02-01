void home() {
  background(#00F9FF);
  textSize(128);
  textAlign(CENTER, CENTER);
  fill(0);
  text("The Fisica Game", 1280, 800);
  
  fill(255);
  strokeWeight(5);
  tacRect(1000, 1000, 560, 300);
  fill(0);
  textSize(48);
  text("Start", 1280, 1150);
  textAlign(CORNER, CORNER);
}

void tacRect(float x, float y, float w, float h) {
  stroke(inRect(x, y, w, h, mouseX, mouseY) ? 100 : 0);
  rect(x, y, w, h);
}

boolean inRect(float x, float y, float w, float h, float cx, float cy) {
  return cx > x && cx < x + w && cy > y && cy < y + h;
}
