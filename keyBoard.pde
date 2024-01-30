boolean wkey, skey, akey, dkey, upkey, leftkey, rightkey, downkey;

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A'){ akey = true;
    PlayerDirection = false;
  }
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D'){
    dkey = true;
    PlayerDirection = true;
  }
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT)  leftkey = true;
  if (keyCode == RIGHT)  rightkey = true;
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
 
  
  if (wkey){// &&) ((isTouchingGround(FPlayyerBottom1) || isTouchingGround(FPlayyerBottom2)) || true)) {
    float vx = Player.getVelocityX(), vy = Player.getVelocityY();
    Player.setVelocity(vx, -400);
  }
  if (akey){// && (!(isTouchingGround(FPlayyerLeft1) || isTouchingGround(FPlayyerLeft2)))) {
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
