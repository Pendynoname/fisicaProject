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
  if(mode == pause){
    if(inRect(1000, 1000, 560, 300, mouseX, mouseY)){
      mode = game;
    }
  }
  if(mode == home || mode == over){
    if(inRect(1000, 1000, 560, 300, mouseX, mouseY)){
      mode = load;
      world.clear();
      st.clear();
      life.clear();
      loaded.clear();
      playerLife = 20;
      world.add(Player);
      Player.setPosition(0, 0);
      StrSeed = "";
    }
    return ;
  
  }
  if(mode == load){
    if(inRect(1000, 1000, 560, 300, mouseX, mouseY)){
      if(StrSeed.length() == 0){
        StrSeed = "" + rd.nextLong();
      }
      noiseSeed(Long.parseLong(StrSeed));     
      WorldName = "World" + StrSeed;
      mode = game;
    }
  }
  if (mouseButton == RIGHT)rightMouse = true;
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
    } else if (currentitem == 17) {
      Pair pp = getCord(Player);
      for(int i = life.size() - 1; i >= 0; i--){
        Enermies cur = life.get(i);
        if(cur instanceof Arrow){
          continue;
        }
        if(isTouching(cur, mousePosition)){
          cur.health -= 5;
        }
        if(cur.health <= 0){
          if((cur instanceof Slime) && ((Slime)cur).size > 1){
            Slime s1 = new Slime(((Slime)cur).size - 1, round(cur.getX()), round(cur.getY())), s2 = new Slime(((Slime)cur).size - 1, round(cur.getX()), round(cur.getY()));
            world.add(s1);
            world.add(s2);
            life.add(s1);
            life.add(s2);
          }
          world.remove(cur);
          life.remove(cur);
        }
        rightMouse = false;
      }
    }
  } if (leftMouse){
     if(get_Block(p.first, p.second) instanceof GameObject){
       GameObject ini = (GameObject)get_Block(p.first, p.second);
       if(st.contains(ini)){
         st.remove(ini);
         world.remove(ini);
       }
     }
     if(get_Block(p.first, p.second) instanceof Liquid){
        ((Liquid)get_Block(p.first, p.second)).remove();  
     }
     set_Block(p.first, p.second, null);
  }
}
