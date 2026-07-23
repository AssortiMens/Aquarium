
class Visje
{
  int x,y;
  int w,h;

  int xDir = 1;
  int yDir = 1;
  
  int vx = 1;
  int vy = 1;
  
  Visje(int tx, int ty, int tw, int th)
   {
     x = tx;
     y = ty;
     w = tw;
     h = th;

     xDir = 1;
     yDir = 1;
     vx = int(random(10)+1);
     vy = int(random(5)+1);
     
//     rectMode(CENTER);
   }

  void Display()
  {
//    rectMode(CENTER);
//    animation = new Animation("data/haai.gif",256);
//    image(visje, 0, 0);
//    image(gifAnimation1,x,y);
    if (xDir > 0)
      image(gifAnimation2,x,y);
    else
      image(gifAnimation3,x,y);
//    rect(x, y, w, h);
  }
  
  void Update()
  {
    x += (xDir * vx);
    y += (yDir * vy);
    
    if ((x < 0) || (x > (width - w)))
      xDir = -xDir;
    if ((y < 0) || (y > (height - h)))
      yDir = -yDir;
  }

}
