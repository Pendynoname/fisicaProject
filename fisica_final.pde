import fisica.*;
import java.util.*;

PImage lava[][][];

final int home = 0;
final int load = 1;
final int game = 2;
final int over = 3;
int mode = 0;


color background = #00F6FC;
FWorld world;
void setup() {
  st = new ArrayList<GameObject>();
  Fisica.init(this);
  size(2560, 1600, P2D);
  loaded = new HashMap<Integer, ArrayList<ArrayList<FBody>>>();
  life = new ArrayList<Enermies>();
  loadLava();
  loadBlock();
  loadEnermie();
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
  if(mode == 0){
    home();
  }
  if(mode == 1){
    load();
  }
  if(mode == 2){
    game();
  }
  if(mode == 3){
    over();
  }
}
