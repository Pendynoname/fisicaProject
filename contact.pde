boolean isTouching(String n, FBox obj) {
  ArrayList<FContact> contactList = obj.getContacts();
  //println(contactList.size(), "???");
  for (FContact contact : contactList) {
    //println(contact.contains(n));
    if (contact.contains(n)) {
      return true;
    }
  }
  return false;
}

boolean isTouching(FBox n, FBox obj) {
  ArrayList<FContact> contactList = obj.getContacts();
  //println(contactList.size(), "???");
  for (FContact contact : contactList) {
    //println(contact.contains(n));
    if (contact.contains(n)) {
      return true;
    }
  }
  return false;
}


void CalPlayer() {
  Pair p = getCord(Player);
  if(invincible-->0){
    notDamageTime++;
    return ;
  }
  if(isTouching("enemies", Player)){
    playerLife -= 2;
    notDamageTime = 0;
    invincible = 30;
  } else if(isTouching("cactus", Player)){
    playerLife -= 1;
    notDamageTime = 0;
    invincible = 30;
  } else if(get_Block(p.first, p.second) instanceof Lava){
    playerLife -= 3;
    notDamageTime = 0;
    invincible = 60;
  } else {
    notDamageTime++;
    if(notDamageTime > 120 && notDamageTime % 30 == 0){
      playerLife++;
    }
    if(playerLife > 20){
     playerLife = 20;
    }
  }
}
