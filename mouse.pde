FBox mousePosition;

void mouseSetup() {
  mousePosition = new FBox(16, 16);
  mousePosition.setSensor(true);
  mousePosition.setStatic(true);
  mousePosition.setNoFill();
  mousePosition.setNoStroke();
  
}

/*
void mousePressed(){
 Pair cord = getCord();
 if(mouseButton == RIGHT && block[cord.first][cord.second] == null){
 block[cord.first][cord.second] = new Block(cord.first, cord.second, green);
 }
 if(mouseButton == LEFT && block[cord.first][cord.second] != null){
 if(st.contains(block[cord.first][cord.second])){
 world.remove(block[cord.first][cord.second]);
 st.remove(block[cord.first][cord.second]);
 }
 block[cord.first][cord.second] = null;
 }
 }
 */
