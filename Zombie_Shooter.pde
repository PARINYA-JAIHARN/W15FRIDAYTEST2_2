class Shooter{
  float shtX = 500;
  float shtY = 700;
  
  public Shooter(){
  }
  void drawSht(){
    fill(255);
    ellipse(shtX, shtY, 100, 100);
  }
  void move(){
    if(keyPressed){
      if(key == 'w'){
        this.shtY-=5;
      }
      if(key == 's'){
        this.shtY+=5;
      }
      if(key == 'd'){
        this.shtX+=5;
      }
      if(key == 'a'){
        this.shtX-=5;
      }
    }
    drawSht();
  }
  float getShooterX() {
    return shtX ;  
  }
  float getShooterY() {
    return shtY ;  
  }
}

class Bullet{
  float cenX, cenY;
  /*Bullet(){
    
  }*/
  void fire(Shooter p){
    if (mousePressed == true){
      rectMode(CENTER);
      rect(p.getShooterX(), p.getShooterY(), 5, 20);
    }
  }
}

class Zombie{
  boolean show = true;
  float posX, posY;
  int speed ;
  int HP = 3;
  float size = 50;
  public Zombie(){
    posX = random(-500,500) ;
    posY = random(-800,0) ;
    speed = 2 ;
  }

  void spawn() {
    fill(0,100,0) ;
    ellipse(posX, posY, size, size) ;
  }

  void walk(Shooter p){
    if(posX > p.getShooterX()){
      posX -= speed ;
    }
    if(posX < p.getShooterX()){
      posX += speed ;
    }
    if(posY < p.getShooterY()){
      posY += speed ;
    }
    if(posY > p.getShooterY()){
      posY -= speed ;
    }
  }
  

}

Shooter player1;
Zombie[] zombies ;

void setup(){
 size(1000,800);
 player1 = new Shooter();
 zombies = new Zombie[10] ;
  for(int i = 0 ; i < 10   ; i++ )
  {
    zombies[i] = new Zombie();
   }
 
 
}
void draw()
{
  background(200);
  player1.move();
  for(int i = 0 ; i < 10   ; i++ )
  {
    zombies[i].spawn();
    zombies[i].walk(player1) ;
   }
}
