FBody get_Block(int x, int y) {
  if (y < 0 || y >= 100) {
    return null;
  }
  int chunk = get_chunk(x);
  //println(chunk, x - chunk*32, x);
  if (!loaded.containsKey(chunk)) {
    loadChunk(chunk);
  }

  return loaded.get(chunk).get(x - chunk*32).get(y);
}

void set_Block(int x, int y, FBody n) {
  if (y < 0 || y >= 100) {
    return ;
  }
  int chunk = get_chunk(x);
  if (!loaded.containsKey(chunk)) {
    loadChunk(chunk);
  }
  loaded.get(chunk).get(x - chunk*32).set(y, n);
}

void saveChunk(int chunk) {
  String loc = "data\\"+WorldName+"\\chunk" + str(chunk) + ".txt";
  if (!loaded.containsKey(chunk)) {
    return;
  }
  ArrayList<ArrayList<FBody>> toSave = loaded.get(chunk);
  String[] data = new String[32];
  for (int i = 0; i < 32; i++) {
    String ini = "";
    for (int j = 100; j >= 0; j--) {
      if (toSave.get(i).get(j) instanceof GameObject) {
        GameObject cur = (GameObject)toSave.get(i).get(j);
        if (cur instanceof Dirt) {
          ini += "0 ";
        } else if (cur instanceof Sand) {
          ini += "1 ";
        } else if (cur instanceof Rock) {
          ini += "2 ";
        } else if (cur instanceof Grass) {
          ini += "3 ";
        } else if (cur instanceof Cobble) {
          ini += "4 ";
        } else if (cur instanceof CoalOre) {
          ini += "5 ";
        } else if (cur instanceof IronOre) {
          ini += "6 ";
        } else if (cur instanceof DiamondOre) {
          ini += "7 ";
        } else if (cur instanceof OakLog) {
          ini += "8 ";
        } else if (cur instanceof OakPlank) {
          ini += "9 ";
        } else if (cur instanceof CraftingTable) {
          ini += "10 ";
        } else if (cur instanceof Furnace) {
          ini += "11 ";
        } else if (cur instanceof Chest) {
          ini += "12 ";
        } else if (cur instanceof Leaf) {
          ini += "13 ";
        } else if (cur instanceof Cactus) {
          ini += "14 ";
        } else if (cur instanceof Dripleaf) {
          ini += "15 ";
        }
      }
      else if (toSave.get(i).get(j) instanceof Liquid) {
        Liquid cur = (Liquid)toSave.get(i).get(j);
        if(cur instanceof Lava){
          ini += "100";
        } else {
          ini += "200";
        }
        if(cur.still){
          ini += "9 ";
        }else {
          ini += str(cur.level);
          ini += " ";
        }
      } else {
        ini += "-1 ";
      }
    }
    data[i] = ini;
  }
  saveStrings(loc, data);
}

void loadChunk(int chunk) {
  String loc = "data\\"+WorldName+"\\chunk" + str(chunk) + ".txt";
  if (loadStrings(loc) == null) {
    hard_generate(chunk);
  }
  String[] info = loadStrings(loc);
  loaded.put(chunk, new  ArrayList<ArrayList<FBody>>());
  for (int i = 0; i < 32; i++) {
    int[] current = int(split(info[i].trim(), " "));
    ArrayList<FBody> cur = new ArrayList<FBody>();
    for (int j = 100; j >= 0; j--) {
      switch (current[j]) {
      case 0:
        cur.add(new Dirt(chunk * 32 + i, 100 - j));
        break;
      case 1:
        cur.add(new Sand(chunk * 32 + i, 100 - j));
        break;
      case 2:
        cur.add(new Rock(chunk * 32 + i, 100 - j));
        break;
      case 3:
        cur.add(new Grass(chunk * 32 + i, 100 - j));
        break;
      case 4:
        cur.add(new Cobble(chunk * 32 + i, 100 - j));
        break;
      case 5:
        cur.add(new CoalOre(chunk * 32 + i, 100 - j));
        break;
      case 6:
        cur.add(new IronOre(chunk * 32 + i, 100 - j));
        break;
      case 7:
        cur.add(new DiamondOre(chunk * 32 + i, 100 - j));
        break;
      case 8:
        cur.add(new OakLog(chunk * 32 + i, 100 - j));
        break;
      case 9:
        cur.add(new OakPlank(chunk * 32 + i, 100 - j));
        break;
      case 10:
        cur.add(new CraftingTable(chunk * 32 + i, 100 - j));
        break;
      case 11:
        cur.add(new Furnace(chunk * 32 + i, 100 - j));
        break;
      case 12:
        cur.add(new Chest(chunk * 32 + i, 100 - j));
        break;
      case 13:
        cur.add(new Leaf(chunk * 32 + i, 100 - j));
        break;
      case 14:
        cur.add(new Cactus(chunk * 32 + i, 100 - j));
        break;
      case 15:
        cur.add(new Dripleaf(chunk * 32 + i, 100 - j));
        break;
      default:
        cur.add(loadLiquid(chunk * 32 + i, 100 - j, current[j]));
        break;
      }
    }
    loaded.get(chunk).add(cur);
  }
}


FBody loadLiquid(int x, int y, int id) {
  if (id > 2000) {
    id %= 2000;
    if (id == 9)
      return new Liquid(true, 8, 0, x, y);
    return new Liquid(false, id, 0, x, y);
  } else if (id > 100) {
    id %= 1000;
    if (id == 9)
      return new Lava(true, 8, 0, x, y);
    return new Lava(false, id, 0, x, y);
  }


  return null;
}
