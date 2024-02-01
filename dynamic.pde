ArrayList<GameObject> st;
ArrayList<Enermies> life;

void calculate() {
  Pair p = getCord(Player);

  {
    boolean[] notToRemoved = new boolean[st.size()];
    for(int i = 0; i < notToRemoved.length; i++){
      notToRemoved[i] = false;
    }
    for (int i = 0; i < st.size(); i++) {
      if (dist(st.get(i).x, st.get(i).y, p.first, p.second) < 4) {
        notToRemoved[i] = true;
      }
    }
    for (Enermies ini : life) {
      p = getCord(ini);
      for (int i = 0; i < st.size(); i++) {
        if (dist(st.get(i).x, st.get(i).y, p.first, p.second) > 4) {
          notToRemoved[i] = true;
        }
      }
    }
    for(int i = st.size() - 1; i >= 0; i--){
      if(!notToRemoved[i]){
        world.remove(st.get(i));
        st.remove(i);
      }
    }
    
  }
  p = getCord(Player);
  for (int i = p.first - 5; i < p.first + 5; i++) {
    for (int j = p.second - 5; j < p.second + 5; j++) {
      if (get_Block(i, j) instanceof GameObject) {
        //println(i, j, p.first, p.second, dist( ((GameObject)get_Block(i, j)).x, ((GameObject)get_Block(i, j)).y, p.first, p.second));
        if (!st.contains( ((GameObject)get_Block(i, j))) && dist(((GameObject)get_Block(i, j)).x, ((GameObject)get_Block(i, j)).y, p.first, p.second) < 4) {

          //if(cnt==4) continue;
          st.add( ((GameObject)get_Block(i, j)));
          get_Block(i, j).setPosition( ((GameObject)get_Block(i, j)).x*16 + 8, ((GameObject)get_Block(i, j)).y*16 + 8);
          world.add(get_Block(i, j));
        }
      }
    }
  }

  for (Enermies ini : life) {
    p = getCord(ini);
    for (int i = p.first - 5; i < p.first + 5; i++) {
      for (int j = p.second - 5; j < p.second + 5; j++) {
        if (get_Block(i, j) instanceof GameObject) {
          //println(i, j, p.first, p.second, dist( ((GameObject)get_Block(i, j)).x, ((GameObject)get_Block(i, j)).y, p.first, p.second));
          if (!st.contains( ((GameObject)get_Block(i, j))) && dist(((GameObject)get_Block(i, j)).x, ((GameObject)get_Block(i, j)).y, p.first, p.second) < 4) {

            //if(cnt==4) continue;
            st.add( ((GameObject)get_Block(i, j)));
            get_Block(i, j).setPosition( ((GameObject)get_Block(i, j)).x*16 + 8, ((GameObject)get_Block(i, j)).y*16 + 8);
            world.add(get_Block(i, j));
          }
        }
      }
    }
  }
}
