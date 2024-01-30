long seed = 1145141919810l;
String WorldName = "test";


int calculate_terrain(int i) {
  float cur = 100*noise(i/20.0);
  if (cur < 15)
    return 4;
  if (cur < 60)
    return 1;
  if (cur < 75)
    return 2;
  return 3;
}



int get_chunk(int i) {
  if (i >= 0 || i % 32 == 0)
    return i / 32;
  return (i / 32) - 1;
}

void soft_generate(int chunk) {
  String[] map = {"dirt", "sand", "water", "rock"};
  int terrain_type = calculate_terrain(chunk);
  String[] ck = new String[32];
  for (int i = 0; i < 32; i++) {
    String cur = "";
    int off = chunk * 32;
    int tt = calculate_terrain(chunk);
    float middle = 50 + 7 * noise((- i - off + 15)/25.0);
    for (int j = 0; j < middle; j++) {
      cur += str(id1.get("rock")) + " ";
    }

    float top;
    if (tt != 3)
      top = 60 + 20 * noise((i + off) / 15.0);
    else {
      int l = chunk, r = chunk;
      while (calculate_terrain(--l) == 3);
      while (calculate_terrain(++r) == 3);
      top = min(60 + 20*noise((l*16 + 16)/15.0), 60 + 20*noise((r*16)/15.0));
    }

    for (int j = ceil(middle); j < top; j++) {
      if (tt == 3) {
        cur += "2009 ";
      } else if (tt == 1 && !((j + 1) < top)) {
        cur += str(id1.get("grass")) + " ";
      } else {
        cur += str(id1.get(map[tt - 1])) + " ";
      }
    }

    for (int j = ceil(top); j < 200; j++) {
      cur += "-1 ";
    }
    ck[i] = cur;
  }
  saveStrings("data\\"+WorldName+"\\chunk" + str(chunk) + ".txt", ck);
}

void hard_generate(int chunk) {
  String sv = "data\\"+WorldName+"\\chunk" + str(chunk) + ".txt";
  if (loadStrings(sv) == null) {
    soft_generate(chunk);
  }
  String modify[] = loadStrings(sv);
  int tt = calculate_terrain(chunk);
  if (tt == 1) {
    println("...");
    int f1 = round(random(2, 13));
    int f2 = round(random(19, 28));
    {
      String[][] cur = new String[5][];
      for (int i = 0; i < 5; i++) {
        cur[i] = split(modify[f1 - 2 + i], " ");
      }
      int l = 101;
      while (cur[2][--l].equals("-1"));
      l++;
      int hh = (int)random(3, 6);
      for (int i = 0; i < hh; i++) {
        cur[2][l + i] = str(id1.get("oak_log"));
      }
      l += hh;
      cur[2][l] = str(id1.get("oak_log"));
      cur[1][l] = str(id1.get("leaf"));
      cur[3][l] = str(id1.get("leaf"));

      cur[2][l + 1] = str(id1.get("oak_log"));
      cur[0][l + 1] = str(id1.get("leaf"));
      cur[1][l + 1] = str(id1.get("leaf"));
      cur[3][l + 1] = str(id1.get("leaf"));
      cur[4][l + 1] = str(id1.get("leaf"));

      cur[0][l + 2] = str(id1.get("leaf"));
      cur[1][l + 2] = str(id1.get("leaf"));
      cur[2][l + 2] = str(id1.get("leaf"));
      cur[3][l + 2] = str(id1.get("leaf"));
      cur[4][l + 2] = str(id1.get("leaf"));

      cur[0][l + 3] = str(id1.get("leaf"));
      cur[1][l + 3] = str(id1.get("leaf"));
      cur[2][l + 3] = str(id1.get("leaf"));
      cur[3][l + 3] = str(id1.get("leaf"));
      cur[4][l + 3] = str(id1.get("leaf"));

      cur[1][l + 4] = str(id1.get("leaf"));
      cur[2][l + 4] = str(id1.get("leaf"));
      cur[3][l + 4] = str(id1.get("leaf"));
      for (int i = 0; i < 5; i++) {
        modify[f1 - 2 + i] = join(cur[i], " ");
      }
      println("done");
    }

    {
      String[][] cur = new String[5][];
      for (int i = 0; i < 5; i++) {
        cur[i] = split(modify[f2 - 2 + i], " ");
      }
      int l = 101;
      while (cur[2][--l].equals("-1"));
      println(cur[2][l]);
      l++;
      println(l);
      int hh = (int)random(3, 6);
      for (int i = 0; i < hh; i++) {
        cur[2][l + i] = str(id1.get("oak_log"));
      }
      l += hh;
      cur[2][l] = str(id1.get("oak_log"));
      cur[1][l] = str(id1.get("leaf"));
      cur[3][l] = str(id1.get("leaf"));

      cur[2][l + 1] = str(id1.get("oak_log"));
      cur[0][l + 1] = str(id1.get("leaf"));
      cur[1][l + 1] = str(id1.get("leaf"));
      cur[3][l + 1] = str(id1.get("leaf"));
      cur[4][l + 1] = str(id1.get("leaf"));

      cur[0][l + 2] = str(id1.get("leaf"));
      cur[1][l + 2] = str(id1.get("leaf"));
      cur[2][l + 2] = str(id1.get("leaf"));
      cur[3][l + 2] = str(id1.get("leaf"));
      cur[4][l + 2] = str(id1.get("leaf"));

      cur[0][l + 3] = str(id1.get("leaf"));
      cur[1][l + 3] = str(id1.get("leaf"));
      cur[2][l + 3] = str(id1.get("leaf"));
      cur[3][l + 3] = str(id1.get("leaf"));
      cur[4][l + 3] = str(id1.get("leaf"));

      cur[1][l + 4] = str(id1.get("leaf"));
      cur[2][l + 4] = str(id1.get("leaf"));
      cur[3][l + 4] = str(id1.get("leaf"));
      for (int i = 0; i < 5; i++) {
        modify[f2 - 2 + i] = join(cur[i], " ");
      }
    }
  } else if (tt == 2) {
    for (int i = (int)random(0, 5); i < 31; i+=(int)random(5, 15)) {
      String[] cur = split(modify[i], " ");
      int l = 101;
      while (cur[--l].equals("-1"));
      l++;
      int hh = (int)random(2, 6);
      for (int j = 0; j < hh; j++) {
        cur[l + j] = str(id1.get("cactus"));
      }
      modify[i] = join(cur, " ");
    }
  } else if(tt == 4){
    int rand = (int) random(10, 25);
    String[][] cur = new String[9][];
      for (int i = 0; i < 9; i++) {
        cur[i] = split(modify[rand - 4 + i], " ");
      }
      int l = 101;
      while (cur[4][--l].equals("-1"));
      println(cur[4][l]);
      l-=3;
      for(int i = 0; i < 9; i++){
        for(int j = 0; j < 100; j++){
          if(dist(i, j, 4, l) <= 4.25){
            if(j > l){
              cur[i][j] = "-1";
            } else {
              cur[i][j] = "1009";
            }
          }
        }
      }
      for (int i = 0; i < 9; i++) {
        modify[rand - 4 + i] = join(cur[i], " ");
      }
  }
  saveStrings(sv, modify);
}
