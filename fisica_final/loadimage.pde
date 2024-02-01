void loadLava() {
  lava = new PImage[20][8][3];
  PImage ini;
  ini = loadImage("https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/42/Lava_%28texture%29_JE5.png/revision/latest?cb=20220310125118", "png");
  ini.resize(16, 320);
  image(ini, 0, 0);
  for (int j = 0; j < 8; j++) {
    for (int i = 0; i < 20; i++) {
      lava[i][j][0] = get(0, i * 16, 16, 16);
      lava[i][j][1] = get(0, i * 16, 16, 16);
      lava[i][j][2] = get(0, i * 16, 16, 16);
    }
    for (int i = 0; i < 2 * j; i++) {
      for (int k = 0; k < 20; k++) {
        for (int l = 0; l < 16; l++) {
          lava[k][j][0].set(l, i, background);
        }
      }
    }
    for (int i = 0; i < 2 * (j - 1); i++) {
      for (int k = 0; k < 20; k++) {
        for (int l = 0; l < 16; l++) {
          lava[k][j][1].set(l, i, background);
          lava[k][j][2].set(l, i, background);
        }
      }
    }
    for (int i = 0; i < 20; i++) {
      for (int k = 0; k < 8; k++) {
        lava[i][j][1].set(k, 2*(j - 1), background);
        //lava[i][j][1].set(8 + k, 2*(j - 1), );
        lava[i][j][2].set(15 - k, 2*(j - 1), background);
      }
    }
  }
}


PImage slime[], zombie[][], skeleton[][], arrow[];
void loadEnermie() {
  slime = new PImage[4];
  for (int i = 0; i < 4; i++) {
    slime[i] = Load("https://minecraftfaces.com/wp-content/bigfaces/big-slime-face.png");
    slime[i].resize(16*(i+1), 16*(i+1));
  }
  zombie = new PImage[2][2];
  zombie[1][1] = Load("https://minecraft.wiki/images/Zombie_Targeting.png?a66fd");
  zombie[1][0] = reverseImage(zombie[1][1]);
  zombie[0][1] = Load("https://minecraft.wiki/images/Zombie_JE3_BE2.png?20ae3");
  zombie[0][0] = reverseImage(zombie[0][1]);
  skeleton = new  PImage[2][2];
  skeleton[1][1] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b6/Skeleton_Aiming_JE2_BE3.png/revision/latest?cb=20191103010055");
  skeleton[1][0] = reverseImage(skeleton[1][1]);
  skeleton[0][1] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/47/Skeleton_JE6_BE4.png/revision/latest?cb=20210227130136");
  skeleton[0][0] = reverseImage(skeleton[0][1]);
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      zombie[i][j].resize(24, 48);
      skeleton[i][j].resize(24, 48);
    }
  }
  arrow = new PImage[2];
  arrow[0] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/58/Arrow_JE2_BE1.png/revision/latest?cb=20200105214407");
  arrow[0].resize(12,4);
  arrow[1] = reverseImage(arrow[0]);
}

PImage Load(String url) {
  PImage img = loadImage(url, "png");
  if (img != null) {
    img.resize(16, 16);
  }
  return img;
}


PImage Loadgif(String url) {
  PImage img = loadImage(url, "gif");
  if (img != null) {
    img.resize(16, 16);
  }
  return img;
}
PImage dirt, sand, rock, grass, cobble, coal_ore, iron_ore, diamond_ore, oak_log, oak_plank, crafting_table, furnace[], chest, leaf, cactus, dripleaf[];
PImage[] pickAxe, sword, shovel, axe;

HashMap<String, Integer> id1;
HashMap<Integer, String> id2;
HashMap<Integer, PImage> id3;
void loadBlock() {
  id1 = new HashMap<String, Integer>();
  id1.put("dirt", 0);
  id1.put("sand", 1);
  id1.put("rock", 2);
  id1.put("grass", 3);
  id1.put("cobble", 4);
  id1.put("coal_ore", 5);
  id1.put("iron_ore", 6);
  id1.put("diamond_ore", 7);
  id1.put("oak_log", 8);
  id1.put("oak_plank", 9);
  id1.put("crafting_table", 10);
  id1.put("furnace", 11);
  id1.put("chest", 12);
  id1.put("leaf", 13);
  id1.put("cactus", 14);
  id1.put("dripleaf", 15);
  id1.put("lava", 1000);
  id1.put("water", 2000);
  id2 = new HashMap<Integer, String>();
  id2.put(0, "dirt");
  id2.put(1, "sand");
  id2.put(2, "rock");
  id2.put(3, "grass");
  id2.put(4, "cobble");
  id2.put(5, "coal_ore");
  id2.put(6, "iron_ore");
  id2.put(7, "diamond_ore");
  id2.put(8, "oak_log");
  id2.put(9, "oak_plank");
  id2.put(10, "crafting_table");
  id2.put(11, "furnace");
  id2.put(12, "chest");
  id2.put(13, "leaf");
  id2.put(14, "cactus");
  id2.put(15, "dripleaf");
  id2.put(1000, "lava");
  id2.put(2000, "water");

  dirt = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3d/Dirt_%28texture%29_JE2_BE2.png/revision/latest?cb=20200919012354");
  sand = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c8/Sand_%28texture%29_JE5_BE3.png/revision/latest?cb=20201001140257");
  grass = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3b/Grass_Block_%28side_texture%29_JE2_BE2.png/revision/latest?cb=20200921204925");
  rock = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/d/dc/Stone_%28texture%29_JE5_BE3.png/revision/latest?cb=20201001141805");
  cobble = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/a7/Cobblestone_%28texture%29_JE5_BE3.png/revision/latest?cb=20201001121005");
  coal_ore = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/a2/Coal_Ore_%28texture%29_JE5_BE4.png/revision/latest?cb=20210312150038");
  iron_ore = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/5a/Iron_Ore_%28texture%29_JE6_BE4.png/revision/latest?cb=20210312150124");
  diamond_ore = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c0/Diamond_Ore_%28texture%29_JE5_BE5.png/revision/latest?cb=20210312150111");
  oak_log = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/5f/Oak_Log_%28texture%29_JE4_BE2.png/revision/latest?cb=20201001140144");
  oak_plank = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/e/e6/Oak_Planks_%28texture%29_JE6_BE3.png/revision/latest?cb=20201001140156");
  crafting_table = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3c/Crafting_Table_%28front_texture%29_JE4.png/revision/latest?cb=20201001121026");
  furnace = new PImage[2];
  furnace[0] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/9/9a/Off_Furnace_%28front_texture%29_JE2_BE2.png/revision/latest?cb=20210206133200");
  furnace[1] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/2/28/On_Furnace_%28front_texture%29_JE2_BE2.png/revision/latest?cb=20210206133246");
  chest = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/0/08/Chest_%28front_texture%29_JE1_BE1.png/revision/latest?cb=20200918195049");
  leaf = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/c/c9/Azalea_Leaves_%28texture%29_JE1.png/revision/latest?cb=20210203194232");
  cactus = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/f/fb/Cactus_%28side_texture%29_JE4_BE2.png/revision/latest?cb=20200922000526");
  dripleaf = new PImage[3];
  dripleaf[0] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/bd/Big_Dripleaf_%28stem_texture%29_JE1.png/revision/latest?cb=20210203192737");
  dripleaf[1] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/5/55/Big_Dripleaf_%28tip_texture%29_JE1.png/revision/latest?cb=20210203193258");
  dripleaf[2] = Load("https://static.wikia.nocookie.net/minecraft_gamepedia/images/3/3c/Big_Dripleaf_%28top_texture%29_JE1.png/revision/latest?cb=20210203193139");
  pickAxe = new PImage[2];
  sword = new PImage[2];
  axe = new PImage[2];
  shovel = new PImage[2];
  pickAxe[0] = Loadgif("https://static.wikia.nocookie.net/minecraft_gamepedia/images/f/fd/Enchanted_Iron_Pickaxe.gif/revision/latest?cb=20201118221334");
  sword[0] = Loadgif("https://static.wikia.nocookie.net/minecraft_gamepedia/images/d/de/Enchanted_Iron_Sword.gif/revision/latest?cb=20201118221344");
  axe[0] = Loadgif("https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/bf/Enchanted_Iron_Axe.gif/revision/latest?cb=20201118111848");
  shovel[0] = Loadgif("https://static.wikia.nocookie.net/minecraft_gamepedia/images/a/af/Enchanted_Iron_Shovel.gif/revision/latest?cb=20201118221338");
  pickAxe[1] = reverseImage(pickAxe[0]);
  sword[1] = reverseImage(sword[0]);
  axe[1] = reverseImage(axe[0]);
  shovel[1] = reverseImage(shovel[0]);
  id3 = new HashMap<Integer, PImage>();
  id3.put(0, dirt);
  id3.put(1, sand);
  id3.put(2, rock);
  id3.put(3, grass);
  id3.put(4, cobble);
  id3.put(5, coal_ore);
  id3.put(6, iron_ore);
  id3.put(7, diamond_ore);
  id3.put(8, oak_log);
  id3.put(9, oak_plank);
  id3.put(10, crafting_table);
  id3.put(11, furnace[0]); // Assuming furnace is an array of PImage
  id3.put(12, chest);
  id3.put(13, leaf);
  id3.put(14, cactus);
  id3.put(15, dripleaf[0]);
  id3.put(16, pickAxe[0]);
  id3.put(17, sword[0]);
  id3.put(18, axe[0]);
  id3.put(19, shovel[0]);
}

void load_direction() {
  id3.put(16, pickAxe[PlayerDirection ? 0 : 1]);
  id3.put(17, sword[PlayerDirection ? 0 : 1]);
  id3.put(18, axe[PlayerDirection ? 0 : 1]);
  id3.put(19, shovel[PlayerDirection ? 0 : 1]);
}
