void game() {
  background(background);
  for (int i = life.size() - 1; i >= 0; i--) {
    life.get(i).act();
  }
  pushMatrix();
  scale(scaler);

  mousePosition.setPosition(-(width/(2*scaler) - Player.getX()) + map(mouseX, 0, width, 0, width/scaler) + 8, map(mouseY, 0, height, 0, height/scaler)-(height/(2*scaler) - Player.getY()) + 8);
  translate((width/(2*scaler) - Player.getX()), (height/(2*scaler) - Player.getY()));
  Pair mouseP = getCord(mousePosition);
  mouseInteraction();
  //loadLava();
  calculate();
  CalPlayer();
  handlePlayerInput();
  //println(st.size());

  Pair p = getCord(Player);
  if (get_Block(p.first, p.second) instanceof Liquid) {
    //world.setGravity(0, 120);
    Player.setVelocity(Player.getVelocityX(), Player.getVelocityY() * 0.8);
  } else {
    //world.setGravity(0, 980);
  }
  for (int i = 0; i < 120; i++) {
    for (int j = 0; j < 100; j++) {
      FBody ini = get_Block(p.first - 60 + i, j);
      if (ini == null) {
        continue;
      }
      if (ini instanceof GameObject) {
        ((GameObject)(ini)).paint();
        ((GameObject)(ini)).act();
      }
      if (ini instanceof Liquid) {
        ((Liquid)(ini)).paint();
      }
    }
  }
  if (currentitem > 15) {
    pushMatrix();
    load_direction();
    image(id3.get(currentitem), Player.getX() + (PlayerDirection ? 2 : -18), Player.getY() - 12);
    popMatrix();
  }
  world.draw();
  world.step();
  if (currentitem < 16)
    image(id3.get(currentitem), 16*mouseP.first, 16*mouseP.second, 16, 16);
  popMatrix();
  drawInventory();
  text(frameRate, 50, 50);
  if(playerLife <= 0){
    mode = over;
  }
}
