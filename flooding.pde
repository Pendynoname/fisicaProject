class Liquid extends FBox {
  boolean still;
  int level, direction, x, y;
  Set<Liquid> parent;
  Set<Liquid> child;
  int tick;
  Liquid(boolean s, int l, int d, int xx, int yy) {
    super(16, 16);
    setName("liquid");
    setStatic(true);
    setGrabbable(false);
    setNoFill();
    setNoStroke();
    still = s;
    level = l;
    direction = d;
    tick = 0;
    x=xx;
    y=yy;
    parent = new HashSet<Liquid>();
    child = new HashSet<Liquid>();
  }

  public void paint() {
    pushMatrix();
    translate(16 * x, 16 * y);
    if (still) {
      level = 8;
      direction = 0;
    }
    noStroke();
    fill(0, 0, 255);
    if (direction == 0) {
      rect(0, 16 - 2 * level, 16, 2 * level);
    } else if (direction == 1) {
      quad(0, 16 - 2 * level, 0, 16, 16, 16, 16, 16 - 2 * level - 2);
    } else {
      quad(0, 16 - 2 * level - 2, 0, 16, 16, 16, 16, 16 - 2 * level);
    }
    popMatrix();
  }

  public void get_info(Liquid p) {
    if (p.level < level)
      return;
    if (p.y < y) {
      level = 8;
      direction = 0;
      return ;
    }
    if (p.x > x) {
      level = p.level - 1;
      direction = 1;
    }
    if (p.x < x) {
      level = p.level - 1;
      direction = 2;
    }
  }

  boolean above() {
    boolean above = false;
    for (Liquid current : parent) {
      above |= current.y < y;
    }
    return above;
  }

  public void recalculate() {
    if (level <= 0) {
      remove();
    }


    if (dead()) {
      //println(level, parent.size(), x, y);
      level--;
      if (level <= 0) {
        remove();
      }
      return ;
    }

    if (still || above()) {
      level = 8;
      direction = 0;
      return ;
    }
    assert(parent.size() < 10);
    int sz = parent.size();
    if (sz <= 0)
      return;
    Liquid current[] = new Liquid[sz];
    int _i = 0;
    for (Liquid w : parent) {
      current[_i++] = w;
    }
    Arrays.sort(current, (Liquid a, Liquid b) -> b.level - a.level);
    if (x == 32 && y == 22) {
      for (int i = 0; i < sz; i++) {
        //println(current[i], current[i].level);
      }
    }

    if (level > current[0].level)
      return;
    if (sz == 1 || current[0].level > current[1].level) {
      get_info(current[0]);
    } else {
      level = current[0].level;
      direction = 0;
    }
    if (sz > 1)
      assert(current[0].level >= current[1].level);
  }

  boolean dead() {
    if (still)
      return false;
    boolean alive = false;
    for (Liquid current : parent) {
      if (get_Block(current.x, current.y) == null || get_Block(current.x, current.y) != current)
        continue;
      alive |= level < current.level || (level == current.level && direction == 0 && current.direction != 0) || current.y < y;
    }
    return !alive;
  }

  void remove() {
    for (Liquid current : child) {
      current.parent.remove(this);
    }
    for (Liquid current : parent) {
      current.child.remove(this);
    }
    set_Block(x, y, null);
  }

  public void update(int i, int j) {
    if (still) {
      level = 8;
      direction = 0;
    }
    if (level <= 0) {
      remove();
    }
    if (get_Block(i, j + 1) == null || get_Block(i, j + 1) instanceof Liquid) {
      if (get_Block(i, j + 1) != null) {
        child.add((Liquid)get_Block(i, j + 1));
        ((Liquid)get_Block(i, j + 1)).parent.add(this);
        ((Liquid)get_Block(i, j + 1)).level = 8;
        ((Liquid)get_Block(i, j + 1)).direction = 0;
      } else {
        set_Block(i, j + 1, new Liquid(false, 8, 0, i, j + 1));
        child.add((Liquid)get_Block(i, j + 1));
        ((Liquid)get_Block(i, j + 1)).parent.add(this);
      }
    }

    if (level == 1) {
      return;
    }

    if (get_Block(i, j + 1) instanceof GameObject || still) {
      if (get_Block(i - 1, j) == null) {
        set_Block(i - 1, j, new Liquid(false, level - 1, 1, i - 1, j));
        child.add((Liquid)get_Block(i - 1, j));
        ((Liquid)get_Block(i - 1, j)).parent.add(this);
      }

      if (get_Block(i + 1, j) == null) {
        set_Block(i + 1, j, new Liquid(false, level - 1, 1, i + 1, j));
        child.add((Liquid)get_Block(i - 1, j));
        ((Liquid)get_Block(i - 1, j)).parent.add(this);
      }

      if (get_Block(i - 1, j) instanceof Liquid) {
        ((Liquid)get_Block(i - 1, j)).parent.add(this);
        child.add((Liquid)get_Block(i - 1, j));
        ((Liquid)get_Block(i - 1, j)).recalculate();
      }

      if (get_Block(i + 1, j) instanceof Liquid) {
        ((Liquid)get_Block(i + 1, j)).parent.add(this);
        child.add((Liquid)get_Block(i + 1, j));
        ((Liquid)get_Block(i + 1, j)).recalculate();
      }
    }
  }
};


class Lava extends Liquid{
  int __ff__;
  Lava(boolean s, int l, int d, int xx, int yy){
    super(s, l, d, xx, yy);
    __ff__ = 0;
  }
  
  public void paint() {
    if (still) {
      level = 8;
      direction = 0;
    }
   
    image(lava[__ff__++ / 10 % 20 ][8 - level][direction], x*16, y * 16);
  }
  
}
