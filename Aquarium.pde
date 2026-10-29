/**********************************/
/*                                */
/* Aquarium aan- en afmeldsysteem */
/*                                */
/*       Door: William Senn       */
/*                                */
/**********************************/

import gifAnimation.*;

/* Globals */

boolean Aanmelden = false;
boolean Afmelden = false;

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

PImage achtergrond; //visje;
PImage plant_1;

Gif gifAnimation1;
Gif gifAnimation2;
Gif gifAnimation3;

void setup()
{
  fullScreen();
  pixelDensity(1);
 
//  for(int frame = 0; frame < 256; frame++)
    achtergrond = loadImage("data/Aquarium-Achtergrond.jpg"); // per frame basis!
//    visje.width = width; visje.height = height;
    achtergrond.resize(width,height);
    gifAnimation1 = new Gif(this,"data/waterplant_1.gif");
//    gifAnimation1 = new Gif(this,"data/haai.gif");
//    gifAnimation1.play();
    gifAnimation2 = new Gif(this,"data/clownfish-swimming-rechts.gif"); //hallo.gif");
//    gifAnimation2.play();
    gifAnimation3 = new Gif(this,"data/clownfish-swimming-links.gif");
//    gifAnimation3.play();
    
    if ((gifAnimation1 == null)||(gifAnimation2 == null)||(gifAnimation3 == null))
      System.exit(0);
    else
     {
       gifAnimation1.loop();
       gifAnimation2.loop();
       gifAnimation3.loop();
       
       gifAnimation1.play();
       gifAnimation2.play();
       gifAnimation3.play();
     }
    
    Aanmelden = false;
    Afmelden = false;
}

void draw()
{

  background(0);
  
  image(achtergrond,0,0); // = loadImage("data/Aquarium-Achtergrond.jpg"); // per frame basis!
  
  for (int i = 0; i < NumVisjes; i++)
   {
     visjes[i].Display();
   }
   
  image(gifAnimation1,0,0); // waterplant op de voorgrond
  
  for (int i = 0; i < NumVisjes; i++)
   {
     visjes[i].Update();
   }
   
//   sorteerAlleVisjes();

   if ((Aanmelden == true) && (Afmelden == false)) {
     Aanmelden();
     Aanmelden = Afmelden = false;
   }
   else {
     if ((Aanmelden == false) && (Afmelden == true)) {
       Afmelden();
       Afmelden = Aanmelden = false;
     }
   }
   
   sorteerAlleVisjes();

}

// Sorteert alle visjes op breedte en daarna op hoogte...

void sorteerAlleVisjes()
{
  Visje hulpje = null;
  
  for(int i = 0; i < NumVisjes-1; i++)
  {
    for(int j = i+1; j < NumVisjes; j++)
    {
      if ((visjes[i] != null) && (visjes[j] != null)) {
        if (visjes[i].w > visjes[j].w) {
          hulpje = visjes[i];
          visjes[i] = visjes[j];
          visjes[j] = hulpje;
        }
        if (visjes[i].w == visjes[j].w) {
          if (visjes[i].h > visjes[j].h) {
            hulpje = visjes[i];
            visjes[i] = visjes[j];
            visjes[j] = hulpje;
          }
        }
      }
    }
  }
}

void Aanmelden()
{
  if ((Aanmelden == true) && (Afmelden == false)) {
//    Aanmelden = false;
    if (NumVisjes < MaxNumVisjes)
    {
      // Spawn a visje here!
      if ((visjes[NumVisjes] = new Visje(0,0,int(random(200)+55),int(random(100)+51),color(random(256),random(256),random(256),(255)))) != null) { // 0,0,512,383 of 0,0,visje.width,visje.height of 0,0,195,95
        NumVisjes++;
//        Aanmelden = false;
      }
    }
  }
  Aanmelden = Afmelden = false;
}

void Afmelden()
{
  if ((Afmelden == true) && (Aanmelden == false)) {
//    Afmelden = false;
    if (NumVisjes > 0)
    {
      // Unspawn a visje
      NumVisjes--;
      visjes[NumVisjes] = null;
//      Afmelden = false;
    }
  }
  Afmelden = Aanmelden = false;
}

void keyPressed()
{
  char Key = '\0';
  
  Key = key;
  
  Key &= 0x5f; // toUpper();
  
  Aanmelden = Afmelden = false; // force flush all keys...
  
  if (Key == 'A') {
    Aanmelden = true;
    Afmelden = false;
  }
  else {
    if (Key == 'C') {
      Afmelden = true;
      Aanmelden = false;
    }
  }
}

void keyReleased()
{
  char Key = '\0';
  
  Key = key;

  Key &= 0x5f; // toUpper();
  
  Aanmelden = Afmelden = false; // Force flush all keys...
  
  if (Key == 'A') {
    Aanmelden = false;
    Afmelden = false;
  }
  else {
    if (Key == 'C') {
      Afmelden = false;
      Aanmelden = false;
    }
  }
}
