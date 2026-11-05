
class Visje
{
  int x,y;
  int w = 200, h = 102;

  int xDir = 1;
  int yDir = 1;
  
  int vx = 1;
  int vy = 1;
  
  color kleur; // = color(255,255,255,255);

  //Gif gifAnimation2a = null; //gifAnimation2;
  //Gif gifAnimation3a = null; //gifAnimation3;
  
  int NumImages = 8;

  PImage gifAnimation = null;
  PImage[] gifAnimation2a = new PImage[NumImages]; //{null,null,null,null,null,null,null,null}; // [NumImages];
  PImage[] gifAnimation3a = new PImage[NumImages]; //{null,null,null,null,null,null,null,null};
                 /*{null,null,null,null,null,null,null,null,null,null,null,null,
                    null,null,null,null,null,null,null,null,null,null,null,null,
                    null,null,null,null,null,null,null,null}; */
//  PImage image2 = null; //new PImage[NumImages];

// PImage[] allFrames = Gif.getPImages(this, "lavalamp.gif"); 
  int frame = 0;
  
  Visje(int tx, int ty, int tw, int th, color tkleur)
   {
     x = tx;
     y = ty;
     w = tw;
     h = th;

//     w = 200; h = 102;
     
     xDir = 1;
     yDir = 1;
     vx = int(random(8)+1);
     vy = int(random(4)+1);
     
//     rectMode(CENTER);
     kleur = tkleur;
     fill(kleur);

//     gifAnimation2.loop();
//     gifAnimation3.loop();
//     gifAnimation2.play();
//     gifAnimation3.play();
     
     for (int frame = 0; frame < NumImages; frame++) {
       gifAnimation2a[frame] = gifAnimation2[frame].copy(); // copy a frame?!
       gifAnimation3a[frame] = gifAnimation3[frame].copy(); // copy a frame?!

       gifAnimation2a[frame].resize(w,h);
       gifAnimation3a[frame].resize(w,h);
     }

     frame = 0;

//     gifAnimation2a.loop(); //[frame].loop();
//     gifAnimation3a.loop(); //[frame].loop();
//     gifAnimation2a.play(); //[frame].play();
//     gifAnimation3a.play(); //[frame].play();

     gifAnimation = ((xDir > 0)?(gifAnimation2a[frame]):(gifAnimation3a[frame]));
//     gifAnimation2.resize(w,h);
//     gifAnimation3.resize(w,h);
//    for (int frame = 0; frame < NumImages; frame++) {
//      image = gifAnimation.copy(); //gifAnimation = gifAnimation.copy();
//      image.resize(w,h);
//      gifAnimation2.frameCount++;
//      gifAnimation2.play();
//      gifAnimation2++;
//    }
//    for (int frame = 0; frame < NumImages; frame++) {
//      image2 = gifAnimation3.copy();
//      image2.resize(w,h);
//      gifAnimation3.loop();
//      gifAnimation3.play();
//      image2[frame].play();
//    }

//    frame=0;
  }

  void Display()
  {
//    rectMode(CENTER);
//    animation = new Animation("data/haai.gif",256);
//    image(visje, 0, 0);
//    image(gifAnimation1,x,y);
//    fill(color(255,255,255),255);
    
    fill(kleur);
//    stroke(kleur);
//    strokeWeight(1);
//    strokeJoin(BEVEL);

    noStroke();
    
    gifAnimation = ((xDir > 0)?(gifAnimation2a[frame]):(gifAnimation3a[frame]));
//    gifAnimation = gifAnimation2;
//      fill(kleur);
//      image(gifAnimation,x,y);
//      ellipse(x,y,10,10);
//      gifAnimation2.color[0] = color(255,255,255,255));
//    }
//    else {
//      gifAnimation = gifAnimation3;
//      fill(kleur);
//      image(gifAnimation3,x,y);
//      ellipse(x,y,10,10);
//    }

//    image = gifAnimation.copy(); //gifAnimation = gifAnimation.copy();
//    image.resize(w,h);

//    rect(0,0,w,h); // cause delay...
//    if (xDir > 0)

//    gifAnimation.jump();
    image(gifAnimation,x,y);
//    else
//      image(image2,x,y);

//    ellipse(x,y,40,40);
//    rect(x, y, w, h);
  
  }
  
  void Update()
  {
    x += (xDir * vx);
    y += (yDir * vy);
    
    if ((x < 0) || (x > (width - w))) // Upper left corner
      xDir = -xDir;
    if ((y < 0) || (y > (height - h))) // Upper left corner
      yDir = -yDir;

    gifAnimation = ((xDir > 0)?(gifAnimation2a[frame]):(gifAnimation3a[frame]));
//    image = gifAnimation.copy(); //gifAnimation = gifAnimation.copy();
//    image.resize(w,h);

//    image.blend(image,0,0,w,h,0,0,w,h,BLEND);
//    image.blend(image,0,0,w,h,0,0,w,h,DARKEST);
//    image.blend(gifAnimation,0,0,gifAnimation.width,gifAnimation.height,0,0,w,h,ADD);

//    image.resize(w,h);
//    gifAnimation.jump(frame);
    
    if ((frameCount % 8) == 0) {
      frame++;
      frame %= NumImages;
    }
    
  }

}
