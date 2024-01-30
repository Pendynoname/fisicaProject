
ArrayList<GameObject> st;
ArrayList<FBody> life;

void calculate() {
  Pair p = getCord(Player);

  {
    int i = 0;

    while (i < st.size()) {
      if (dist(st.get(i).x, st.get(i).y, p.first, p.second) > 5) {
        world.remove(st.get(i));
        st.remove(i);
      } else {
        i++;
      }
    }
  }

  for (int i = p.first - 5; i < p.first + 5; i++) {
    for (int j = p.second - 5; j < p.second + 5; j++) {
      if (get_Block(i, j) instanceof GameObject) {
        //println(i, j, p.first, p.second, dist( ((GameObject)get_Block(i, j)).x, ((GameObject)get_Block(i, j)).y, p.first, p.second));
        if (!st.contains( ((GameObject)get_Block(i, j)))) {

          //if(cnt==4) continue;
          st.add( ((GameObject)get_Block(i, j)));
          get_Block(i, j).setPosition( ((GameObject)get_Block(i, j)).x*16 + 8, ((GameObject)get_Block(i, j)).y*16 + 8);
          world.add(get_Block(i, j));
        }
      }
    }
  }
}
