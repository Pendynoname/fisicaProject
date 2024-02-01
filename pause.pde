void pause(){
  textSize(128);
  textAlign(CENTER, CENTER);
  fill(0);
  text("PAUSED", 1280, 800);
  
  fill(255);
  strokeWeight(5);
  tacRect(1000, 1000, 560, 300);
  fill(0);
  textSize(48);
  text("continue", 1280, 1150);
  textAlign(CORNER, CORNER);
  
}
