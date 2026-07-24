/**********************************/
/*                                */
/* Aquarium aan- en afmeldsysteem */
/*                                */
/*       Door: William Senn       */
/*                                */
/**********************************/

import gifAnimation.*;

/* Globals */

int NumVisjes = 0;
int MaxNumVisjes = 256;

Visje visjes[]={null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null};

PImage visje;
//Gif gifAnimation1;
Gif gifAnimation2;
Gif gifAnimation3;

void setup()
{
  fullScreen();
  pixelDensity(1);
 
//  for(int frame = 0; frame < 256; frame++)
    visje = loadImage("data/Aquarium-Achtergrond.jpg"); // per frame basis!
//    visje.width = width; visje.height = height;
    visje.resize(width,height);
//    gifAnimation1 = new Gif(this,"data/haai.gif");
//    gifAnimation1.play();
    gifAnimation2 = new Gif(this,"data/clownfish-swimming-rechts.gif"); //hallo.gif");
//    gifAnimation2.play();
    gifAnimation3 = new Gif(this,"data/clownfish-swimming-links.gif");
//    gifAnimation3.play();
    
    if ((gifAnimation2 == null)||(gifAnimation3 == null))
      System.exit(0);
    else
     {
       gifAnimation2.loop();
       gifAnimation3.loop();
       gifAnimation2.play();
       gifAnimation3.play();
     }
}

void draw()
{
  background(0);
  image(visje,0,0); // = loadImage("data/Aquarium-Achtergrond.jpg"); // per frame basis!
  for (int i = 0; i < NumVisjes; i++)
   {
     visjes[i].Display();
   }

  for (int i = 0; i < NumVisjes; i++)
   {
     visjes[i].Update();
   }
}

void Aanmelden()
{
  if (NumVisjes < MaxNumVisjes)
  {
    // Spawn a visje here!
    if ((visjes[NumVisjes] = new Visje(0,0,200,102)) != null) // 0,0,512,383 of 0,0,visje.width,visje.height of 0,0,195,95
      NumVisjes++;
  }
}

void Afmelden()
{
  if (NumVisjes > 0)
  {
    // Unspawn a visje
    NumVisjes--;
    visjes[NumVisjes] = null;
  }
}

void keyPressed()
{
  if (key == 'a')
    Aanmelden();
  else
   if (key == 'c')
     Afmelden();
}
