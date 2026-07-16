/**********************************/
/*                                */
/* Aquarium aan- en afmeldsysteem */
/*                                */
/*       Door: William Senn       */
/*                                */
/**********************************/

/* Globals */

int NumVisjes = 0;
int MaxNumVisjes = 256;

Visje visjes[]={
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
                null,null,null,null,null,null,null,null,
                null,null,null,null,null,null,null,null
};

PImage visje;// = loadImage("data/visje.jpg");

void setup()
{
  fullScreen();
 
  visje = loadImage("data/visje.jpg");
}

void draw()
{
  background(0);
  for (int i = 0; i < NumVisjes; i++) // = 0; NumVisjes < 256; NumVisjes++)
   {
     visjes[i].Display();
   }

  for (int i = 0; i < NumVisjes; i++) // = 0; NumVisjes < 256; NumVisjes++)
   {
     visjes[i].Update();
   }
}

void Aanmelden()
{
  if (NumVisjes < MaxNumVisjes)
  {
    // Spawn a visje here!
    visjes[NumVisjes] = new Visje(0,0,visje.width,visje.height,color(random(256),random(256),random(256)));
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
