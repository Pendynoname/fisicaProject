class Enermies extends FBox {
  float health;
  int idle;
  int x;
  int y;
  Enermies(int x, int y, int px, int py) {
    super(x, y);
    setRotatable(false);
    setName("enemies");
    setPosition(px, py);
    this.x = px;
    this.y = py;
  }

  void act() {
  }
}


class Slime extends Enermies {

  Slime(int sz, int xx, int yy) {
    super(16 * sz, 16 * sz, xx, yy  );
    health = 8 * sz;
    attachImage(slime[sz - 1]);
  }

  void act() {
    if (idle-->0) return;
    Pair pp = getCord(Player);
    Pair pt = getCord(this);
    if (dist(pp.first, pp.second, pt.first, pt.second) > 15) {
      return;
    }
    if (pp.first < pt.first) {
      setVelocity(-400, -400);
    } else {
      setVelocity(400, -400);
    }
    idle = 180;
  }
}

class Zombie extends Enermies {
  Zombie(int xx, int yy) {
    super(16, 32, xx, yy);
    health = 20;
    attachImage(zombie[0][1]);
  }

  void act() {
    Pair pp = getCord(Player);
    Pair pt = getCord(this);
    if (dist(pp.first, pp.second, pt.first, pt.second) > 15) {
      setVelocity(getVelocityX(), getVelocityY());
      attachImage(zombie[0][1]);
      return ;
    }

    if (pp.first < pt.first) {
      attachImage(zombie[1][1]);
      setVelocity(-150, getVelocityY());
      if (get_Block(pt.first - 1, pt.second + 1) instanceof GameObject && idle --< 0) {

        setVelocity(0, -400);
        idle = 180;
      }
    } else {
      attachImage(zombie[1][0]);
      setVelocity(150, getVelocityY());
      if (get_Block(pt.first + 2, pt.second + 1) instanceof GameObject && idle --< 0) {
        println("jump");
        setVelocity(0, -400);
        idle = 180;
      }
    }
  }
}

class Skeleton extends Enermies {
  boolean aiming;
  int aimcnt;
  Skeleton(int xx, int yy) {
    super(16, 32, xx, yy);
    health = 20;
    attachImage(skeleton[0][1]);
  }

  void act() {
    Pair pp = getCord(Player);
    Pair pt = getCord(this);
    if (dist(pp.first, pp.second, pt.first, pt.second) > 30) {
      setVelocity(getVelocityX(), getVelocityY());
      attachImage(skeleton[0][1]);
      aiming = false;
      return ;
      
    } else if ( dist(pp.first, pp.second, pt.first, pt.second) > 15) {
       aiming = false;
      if (pp.first < pt.first) {
        attachImage(skeleton[0][1]);
        setVelocity(-150, getVelocityY());
        if (get_Block(pt.first - 1, pt.second + 1) instanceof GameObject && idle --< 0) {

          setVelocity(0, -400);
          idle = 180;
        }
      } else {
        attachImage(skeleton[0][0]);
        setVelocity(150, getVelocityY());
        if (get_Block(pt.first + 2, pt.second + 1) instanceof GameObject && idle --< 0) {
          println("jump");
          setVelocity(0, -400);
          idle = 180;
        }
      }
    } else {
      if(!aiming){
        aimcnt = 120;
      }
      aiming = true;
      aimcnt--;
      if (pp.first < pt.first) {
        attachImage(skeleton[1][1]);
      } else {
        attachImage(skeleton[1][0]);
      }
      
      if(aimcnt == 0){
        Arrow ini = new Arrow(getX(), getY());
        life.add(ini);
        world.add(ini);
        aimcnt = 120;
      }
      
    }
  }
}


class Arrow extends Enermies{
  boolean acted;
  int cnt;
  Arrow(float x, float y){
    super(12, 4, (int)x, (int)y);
    setSensor(true);
    acted = false;
    cnt = 0;
  }
  
  void act(){
    cnt++;
    if(cnt == 300){
       world.remove(this);
       life.remove(this);
    }
    if(acted){
      return;
    }
    acted = true;
    Pair pp = getCord(Player);
    Pair pt = getCord(this);
    if(pp.first < pt.first){
      attachImage(arrow[0]);
      setVelocity(-300, -300);
    } else {
      attachImage(arrow[1]);
      setVelocity(300, -300);
    }
    
  }
  

}
