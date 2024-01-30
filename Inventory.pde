int currentitem = 16;

void drawInventory(){
  strokeWeight(10);
  pushMatrix();
  translate(150, 0);
  String[] Mapping = {"T", "Y", "U", "I", "O", "P", "H", "J", "K", "L"}; 
  for(int i = 0; i < 20; i++){
    stroke(180);
    if(currentitem == i){
      stroke(100);
    }
    fill(60,100);
    rect(50 + 80 * i, 5, 75, 75); 
    image(id3.get(i), 55 + 80 * i, 10, 65, 65);
    fill(255);
    textSize(28);
    if(i < 10){
      text(i, 100 + 80 * i, 72);
    }
    else{
      text(Mapping[i - 10], 100 + 80 * i, 72);
    }
  }
  
  strokeWeight(4);
  fill(60,100);
  rect(1700, 5, 560, 75); 
  fill(255, 0, 0);
  rect(1705, 7, map(playerLife, 0, 20, 0, 550), 73);
  
  popMatrix();
}
