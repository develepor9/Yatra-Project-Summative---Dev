Sky clouds;
Surfboard board;

//sound
import processing.sound.*;
SoundFile file;
String audioName = "Surfaris - Wipe Out.mp3";
String path;

//images
PImage surfboard;
PImage sea;
PImage splash;
PImage cloud;

//variables
int scene =1;
int score =0;
int startTime;
float x= 950;
float xSpeed = -5.25;

void setup ()
{
  size (1200, 800);

  surfboard = loadImage("guy on a surfboard.png");
  sea = loadImage("sea background.jpg");
  sea.resize(width, height);
  splash = loadImage ("splash.png");
  splash.resize(300, 200);
  cloud = loadImage("cloud.png");
  cloud.resize (300, 150);

  clouds = new Sky();
  board = new Surfboard();

  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.loop();
}

void draw ()
{
  if (scene == 1)
  {
    sceneOne();
  }
  if (scene == 2)
  {
    sceneTwo();
  }
  if (scene == 3)
  {
    sceneThree();
  }
}

void sceneOne()
{
  background (255);
  fill(0);

  // instructions
  textSize (20);
  textAlign (CENTER);
  text ("Keep the circle in the green" 
    +" rectangle by using the arrow keys to keep the"
    +" surfer on the board. Press 's' to start.", 450, 250, 300, 300);

  // goes to the game when s is pressed
  if (keyPressed)
  {
    if (key == 's' || key == 'S')
    {
      scene =2;
      startTime = millis();
    }
  }
}

void sceneTwo()
{
  // will stop the game if the circle goes out of the green rectangle
  if (x < 800|| x > 1125)
  {
    scene = 3;
    file.stop();
  }

  // adds 1 to the score every second the player is 'on' the board
  if ((millis()-startTime)>1000)
  {
    score ++;
    startTime = millis();
  }

  image (sea, 0, 0);
  board.Render();
  clouds.Render();

  fill (150, 25, 25);
  rect (775, 362.5, 350, 25);
  fill (25, 150, 25);
  rect (800, 362.5, 300, 25);

  fill(0);
  ellipse (x, 375, 25, 25);

  textSize (20);
  textAlign (CENTER);
  text ("Score: "+score, 150, 362.5, 200, 100);

  // changes x speed depending on which key is pressed
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == LEFT)
      {
        xSpeed = 12.25;
      }
      if (keyCode == RIGHT)
      {
        xSpeed = -12.25;
      }
    }
  }

  x-= xSpeed;
}

void sceneThree()
{
  image (sea, 0, 0);

  //displays score etc
  textSize (20);
  textAlign (CENTER);
  text ("Score: "+score, 150, 362.5, 200, 100);
  text ("Wipeout!", 800, 362.5, 200, 100);
  image (splash, width/2-splash.width/2, (height-splash.height)-100);
}
