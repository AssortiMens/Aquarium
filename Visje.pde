
class Visje
{
  int x,y;
  int w,h;
  color Kleur;

  int xDir = 0;
  int yDir = 0;
  
  int vx = 1;
  int vy = 1;
  
  Visje(int tx, int ty, int tw, int th, color tKleur)
   {
     x = tx;
     y = ty;
     w = tw;
     h = th;
     Kleur = tKleur;
     xDir = 1;
     yDir = 1;
     vx = 1;
     vy = 1;
     
     rectMode(CENTER);
   }

  void Display()
  {
//    rectMode(CENTER);
    fill(Kleur);
    image(visje, x, y);
//    rect(x, y, w, h);
  }
  
  void Update()
  {
    x += (xDir * vx);
    y += (yDir * vy);
    
    if ((x < 0) || (x > (width - visje.width)))
      xDir = -xDir;
    if ((y < 0) || (y > (height - visje.height)))
      yDir = -yDir;
  }

}
