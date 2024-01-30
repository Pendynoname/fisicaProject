class Pair{
  int first;
  int second;
  Pair(int f, int s){
    first = f;
    second = s;
  }
}

Pair getCord(FBody body){
  int first = round(body.getX() - 8);
  int second = round(body.getY() - 8);
  if(first >= 0  ){
    first /= 16;
  } else {
    first /= 16;
    first -= 1;
  }
  if(second >= 0){
    second /= 16;
  } else {
    second /= 16;
    second -= 1;
  }
  return new Pair(first, second);
}

Pair getCordMouse(){
  int first = round(mouseX);
  int second = round(mouseY);
  if(first >= 0){
    first /= 16;
  } else {
    first /= 16;
    first -= 1;
  }
  if(second >= 0){
    second /= 16;
  } else {
    second /= 16;
    second -= 1;
  }
  //rect(first * 16, second * 16, 16, 16);
  return new Pair(first, second);
}
