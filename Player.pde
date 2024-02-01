FBox Player;
boolean PlayerDirection;
int playerLife = 20, invincible = 0, notDamageTime = 0;
void LoadPlayer(){
  Player = new FBox(16, 16);
  Player.setRotatable(false);
  PlayerDirection = true;
 
}
