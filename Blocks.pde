HashMap<Integer, ArrayList<ArrayList<FBody>>> loaded;

class GameObject extends FBox {
  int x;
  int y;
  int density;
  PImage img;
  GameObject() {
    super(16, 16);
    setName("obj");
    density = 180;
    setStatic(true);
    setGrabbable(false);
    setNoFill();
    setNoStroke();
  }
  void paint() {
    image(img, x * 16, y * 16);
  }

  void act() {
  }
}


class Dirt extends GameObject {



  Dirt(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = dirt;
  }

  // Additional methods or functionality can be added here
}

class Sand extends GameObject {


  Sand(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = sand;
  }

  // Additional methods or functionality can be added here
}

class Rock extends GameObject {


  Rock(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = rock;
  }

  // Additional methods or functionality can be added here
}

class Grass extends GameObject {


  Grass(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = grass;
  }

  void act() {
    if (get_Block(x, y - 1) != null) {
      img = dirt;
    }
  }

  // Additional methods or functionality can be added here
}

class Cobble extends GameObject {


  Cobble(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = cobble;
  }

  // Additional methods or functionality can be added here
}

class CoalOre extends GameObject {


  CoalOre(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = coal_ore;
  }

  // Additional methods or functionality can be added here
}

class IronOre extends GameObject {

  IronOre(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = iron_ore;
  }

  // Additional methods or functionality can be added here
}

class DiamondOre extends GameObject {


  DiamondOre(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = diamond_ore;
  }

  // Additional methods or functionality can be added here
}

class OakLog extends GameObject {


  OakLog(int x, int y) {
    super();
    this.x = x;
    this.y = y;

    img = oak_log;
    assert(oak_log != null);
  }

  // Additional methods or functionality can be added here
}

class OakPlank extends GameObject {


  OakPlank(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = oak_plank;
  }

  // Additional methods or functionality can be added here
}

class CraftingTable extends GameObject {


  CraftingTable(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = crafting_table;
  }

  // Additional methods or functionality can be added here
}

class Furnace extends GameObject {

  PImage[] imga; // Assuming furnace is an array of PImage

  Furnace(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    imga = furnace;
    img = furnace[0];
  }

  // Additional methods or functionality can be added here
}

class Chest extends GameObject {


  Chest(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = chest;
  }

  // Additional methods or functionality can be added here
}

class Leaf extends GameObject {


  Leaf(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    img = leaf;
    assert(img != null);
  }

  // Additional methods or functionality can be added here
}

class Cactus extends GameObject {


  Cactus(int x, int y) {
    super();
    setName("cactus");
    this.x = x;
    this.y = y;
    img = cactus;
  }

  // Additional methods or functionality can be added here
}

class Dripleaf extends GameObject {

  PImage[] imgs;
  PImage img2;
  boolean flip;
  int wait;

  Dripleaf(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    imgs = dripleaf;
    setSensor(true);
    img = dripleaf[0];
    img2 = dripleaf[1];
    wait = 0;
  }

  void paint() {
    image(img, x * 16, y * 16);
    if (!(get_Block(x, y - 1) instanceof Dripleaf)) {
      image(img2, x * 16, y * 16);
    }
  }

  void act() {
    if ((get_Block(x, y - 1) instanceof Dripleaf)) {
      return;
    }
    if (!flip) {
      setSensor(false);
    } else {
      setSensor(true);
    }
    if (wait != 0) {
      wait--;
      if (wait == 0) {
        if (!flip) {
          flip = true;
          img2 = imgs[2];
          wait = 120;
          setSensor(true);
          Player.setVelocity(Player.getVelocityX(), -1);
        } else {
          flip = false;
          img2 = imgs[1];
          setSensor(false);
        }
      }
      return;
    }
    if (isTouching(Player, this)) {
      wait = 60;
    }
  }

  // Additional methods or functionality can be added here
}
