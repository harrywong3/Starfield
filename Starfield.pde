//Starfield complete
double X,Y,Speed, Angle,odd;
int kachow;
Particle[] K;
void setup()
{
  size(700,700);
  background(0);
  odd=0;
  K= new Particle[1000];
  for(int i=0; i<K.length; i++)
  if(i<8){
  K[i]= new OddballParticle(PI*odd);
  odd=odd+0.25;
  }else if(8<=i&&i<17){
  K[i]= new OddballParticle(PI*odd,0);
  odd=odd-0.25;
  }else{
  K[i]= new Particle();
  }
}
void draw()
{
  background(0);
  for(int i=0;i<K.length;i++){
  K[i].move();
  K[i].show();
  }
  fill(255);
  text("Pretty cool, right?",300,600);
}
class Particle
{
  double X,Y,Speed, Angle;
  int kachow;
  Particle(){
    kachow= color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    Angle= Math.random()*(2*TWO_PI);
    Y=X=350;
    Speed= Math.random()*8.77;
  }
  void move(){
    X=X+Math.cos(Angle)*Speed;
    Y=Y+Math.sin(Angle)*Speed;
    Angle= Angle + PI*0.01;
  }
  void show(){
    fill(kachow);
    ellipse((float)X, (float)Y, 5.75, 5.75);
  }
}
class OddballParticle extends Particle
{
  OddballParticle(double angle){
    Speed=2;
    Angle=angle;
    X=Y=350;
  }
  OddballParticle(double angle, int lol){
    Speed=7.5 + lol;
    Angle=-angle;
    X=350-Math.sin(angle)*200;
    Y=350-Math.cos(angle)*200;
  }
  void show(){
    noStroke();
    fill(color(255,153,204));
    triangle((int)(X-15),(int)(Y+2), (int)X, (int)(Y-13), (int)X, (int)(Y+13));
    triangle((int)(X+15),(int)(Y+2), (int)X, (int)(Y-13), (int)X, (int)(Y+13));
    arc((int)(X-7),(int)(Y-5), 20,20, (3.0*PI)/4.0,(7.0*PI)/4);
    arc((int)(X+7),(int)(Y-5), 20,20, (5.0*PI)/4.0,(9.0*PI)/4);
  }
}
