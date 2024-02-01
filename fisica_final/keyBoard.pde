boolean wkey, skey, akey, dkey, upkey, leftkey, rightkey, downkey;

void keyPressed() {
  if (mode == game) {
    if (key == 'w' || key == 'W') wkey = true;
    if (key == 'a' || key == 'A') {
      akey = true;
      PlayerDirection = false;
    }
    if (key == 's' || key == 'S') skey = true;
    if (key == 'd' || key == 'D') {
      dkey = true;
      PlayerDirection = true;
    }
    if (key == '0') {
      currentitem = 0;
    } else if (key == '1') {
      currentitem = 1;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '2') {
      currentitem = 2;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '3') {
      currentitem = 3;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '4') {
      currentitem = 4;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '5') {
      currentitem = 5;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '6') {
      currentitem = 6;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '7') {
      currentitem = 7;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '8') {
      currentitem = 8;
      rightMouse = false;
      leftMouse = false;
    } else if (key == '9') {
      currentitem = 9;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'T' || key == 't') {
      currentitem = 10;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'Y' || key == 'y') {
      currentitem = 11;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'U' || key == 'u') {
      currentitem = 12;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'I' || key == 'i') {
      currentitem = 13;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'O' || key == 'o') {
      currentitem = 14;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'P' || key == 'p') {
      currentitem = 15;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'H' || key == 'h') {
      currentitem = 16;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'J' || key == 'j') {
      currentitem = 17;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'K' || key == 'k') {
      currentitem = 18;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'L' || key == 'l') {
      currentitem = 19;
      rightMouse = false;
      leftMouse = false;
    } else if (key == 'b' || key == 'B') {
      Enermies ini = new Slime(4, (int)Player.getX(), 0);
      life.add(ini);
      world.add(ini);
    } else if (key == 'n' || key == 'N') {
      Enermies ini = new Zombie((int)Player.getX(), 0);
      life.add(ini);
      world.add(ini);
    } else if (key == 'm' || key == 'M') {
      Enermies ini = new Skeleton((int)Player.getX(), 0);
      life.add(ini);
      world.add(ini);
    }


    if (keyCode == UP) upkey = true;
    if (keyCode == DOWN) downkey = true;
    if (keyCode == LEFT)  leftkey = true;
    if (keyCode == RIGHT)  rightkey = true;
    if(key == ' ') mode = pause;
  }
  if(mode == pause){
    if(key == ' '){
      mode = game;
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT)  leftkey = false;
  if (keyCode == RIGHT)  rightkey = false;
}

void handlePlayerInput() {
  //println(wkey, akey, skey, dkey, Player.getVelocityY(), Player.getVelocityX());


  if (wkey) {// &&) ((isTouchingGround(FPlayyerBottom1) || isTouchingGround(FPlayyerBottom2)) || true)) {
    float vx = Player.getVelocityX(), vy = Player.getVelocityY();
    Player.setVelocity(vx, -400);
  }
  if (akey) {// && (!(isTouchingGround(FPlayyerLeft1) || isTouchingGround(FPlayyerLeft2)))) {
    float vx = Player.getVelocityX(), vy = Player.getVelocityY();
    Player.setVelocity(-200, vy);
  }
  if (skey) {
    float vx = Player.getVelocityX(), vy = Player.getVelocityY();
    Player.setVelocity(vx, vy+200);
  }
  if (dkey) {
    float vx = Player.getVelocityX(), vy = Player.getVelocityY();
    Player.setVelocity(200, vy);
  }
  //world.remove(cont);
}
