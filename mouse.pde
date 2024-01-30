FBox mousePosition;

void mouseSetup() {
  mousePosition = new FBox(16, 16);
  mousePosition.setSensor(true);
  mousePosition.setStatic(true);
  mousePosition.setNoFill();
  mousePosition.setNoStroke();
}

boolean leftMouse, rightMouse;

void mousePressed() {
  if(mode == home || mode == over){
    if(inRect(1000, 1000, 560, 300, mouseX, mouseY)){
      mode = game;
      int seed = 15;
      noiseSeed(seed);
      world.clear();
      st.clear();
      life.clear();
      loaded.clear();
      playerLife = 20;
      world.add(Player);
      Player.setPosition(0, 0);
      WorldName = "map" + seed;
    }
  
  }
  if (mouseButton == RIGHT) rightMouse = true;
  if (mouseButton == LEFT) leftMouse = true;
  
}

void mouseReleased() {
  if (mouseButton == RIGHT)rightMouse = false;
  if (mouseButton == LEFT) leftMouse = false;
}

void mouseInteraction() {
  Pair p = getCord(mousePosition);
  if (rightMouse && ! (get_Block(p.first, p.second) instanceof GameObject)) {
    if (currentitem == 0) {
      set_Block(p.first, p.second, new Dirt(p.first, p.second));
    } else if (currentitem == 1) {
      set_Block(p.first, p.second, new Sand(p.first, p.second));
    } else if (currentitem == 2) {
      set_Block(p.first, p.second, new Rock(p.first, p.second));
    } else if (currentitem == 3) {
      set_Block(p.first, p.second, new Grass(p.first, p.second));
    } else if (currentitem == 4) {
      set_Block(p.first, p.second, new Cobble(p.first, p.second));
    } else if (currentitem == 5) {
      set_Block(p.first, p.second, new CoalOre(p.first, p.second));
    } else if (currentitem == 6) {
      set_Block(p.first, p.second, new IronOre(p.first, p.second));
    } else if (currentitem == 7) {
      set_Block(p.first, p.second, new DiamondOre(p.first, p.second));
    } else if (currentitem == 8) {
      set_Block(p.first, p.second, new OakLog(p.first, p.second));
    } else if (currentitem == 9) {
      set_Block(p.first, p.second, new OakPlank(p.first, p.second));
    } else if (currentitem == 10) {
      set_Block(p.first, p.second, new CraftingTable(p.first, p.second));
    } else if (currentitem == 11) {
      set_Block(p.first, p.second, new Furnace(p.first, p.second));
    } else if (currentitem == 12) {
      set_Block(p.first, p.second, new Chest(p.first, p.second));
    } else if (currentitem == 13) {
      set_Block(p.first, p.second, new Leaf(p.first, p.second));
    } else if (currentitem == 14) {
      set_Block(p.first, p.second, new Cactus(p.first, p.second));
    } else if (currentitem == 15) {
      set_Block(p.first, p.second, new Dripleaf(p.first, p.second));
    }
  } if (leftMouse){
     set_Block(p.first, p.second, null);
  }
}
