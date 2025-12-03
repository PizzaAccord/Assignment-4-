void drop(){
  //球在100生成，向380掉落
  for (int i =100; i<380; i++){
  y = y + speed;
  }
}
void deadspace(){
  if(ball.y >= 100){
    Gamelose();
  }
  else{
  
  }
}
