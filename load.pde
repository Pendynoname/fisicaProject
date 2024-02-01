String StrSeed = "";

void load(){
  background(#00F9FF);
  textSize(128);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Enter a Seed", 1280, 500);
  textSize(64);
  text(StrSeed, 1280, 800);
  fill(255);
  strokeWeight(5);
  tacRect(1000, 1000, 560, 300);
  fill(0);
  textSize(48);
  text("Start", 1280, 1150);
  textAlign(CORNER, CORNER);
}

void loadPressed(){
  char cur = key;
  if(Character.isDigit(cur)){
    StrSeed += cur;
  }
  if(StrSeed.length() > 18){
    StrSeed = StrSeed.substring(1);
  }
}
