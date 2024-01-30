HashMap<Integer, ArrayList<ArrayList<FBody>>> loaded;

class GameObject extends FBox {
  int x; int y;
  PImage img;
  GameObject() {
    super(16, 16);
    setStatic(true);
    setGrabbable(false);
    setNoFill();
    setNoStroke();
  }
  void paint(){
    image(img, x * 16, y * 16);
  }
  
  void act(){
  
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
  
  void act(){
    if(get_Block(x, y - 1) != null){
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
    this.x = x;
    this.y = y;
    img = cactus;
  }

  // Additional methods or functionality can be added here
}

class Dripleaf extends GameObject {
   
  PImage[] imgs;

  Dripleaf(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    imgs = dripleaf;
    img = dripleaf[0];
  }

  // Additional methods or functionality can be added here
}
