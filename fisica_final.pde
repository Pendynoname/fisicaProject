import fisica.*;
import java.util.*;

PImage lava[][][];

color background = #00F6FC;
FWorld world;
void setup() {
  st = new ArrayList<GameObject>();
  Fisica.init(this);
  size(2560, 1600, P2D);
  loaded = new HashMap<Integer, ArrayList<ArrayList<FBody>>>();
  loadLava();
  loadBlock();
  soft_generate(0);
  hard_generate(0);
  soft_generate(-1);
  soft_generate(1);
  LoadPlayer();
  loadChunk(0);
  mouseSetup();
  world = new FWorld(-120000000, -1200, 120000000, 1200);
  world.add(Player);
  world.add(mousePosition);
  world.setGravity(0, 980);
}


float scaler = 1.5;
int cnt = 0;
void draw() {
  background(background);
  pushMatrix();
  scale(scaler);
  mousePosition.setPosition(-(width/(2*scaler) - Player.getX()) + map(mouseX, 0, width, 0, width/scaler) + 8, map(mouseY, 0, height, 0, height/scaler)-(height/(2*scaler) - Player.getY()) + 8);
  translate((width/(2*scaler) - Player.getX()), (height/(2*scaler) - Player.getY()));
  Pair mouseP = getCord(mousePosition);
  //loadLava();
  calculate();
  handlePlayerInput();
  //println(st.size());

  Pair p = getCord(Player);
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
  if(currentitem > 15){
    pushMatrix();
    image(id3.get(currentitem), Player.getX() + (PlayerDirection ? 2 : -16), Player.getY() - 12);
    popMatrix();
  }
  world.draw();
  world.step();
  if(currentitem < 16)
    image(id3.get(currentitem), 16*mouseP.first, 16*mouseP.second, 16, 16);
  popMatrix();
  drawInventory();
  text(frameRate, 50, 50);
}
