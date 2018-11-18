static int xVal = 0;

class Sky
{
  PImage [] sky = new PImage [4];
  float [] Xs = new float [sky.length];
  float [] Ys = new float [sky.length];
  float [] xSpeeds = new float [sky.length];

  Sky()
  {
    for (int i =0; i < sky.length; i++)
    {
      xVal += 700;
      Xs [i] = xVal;
      Ys [i] = (float)(Math.random()*125+1);
      xSpeeds [i] = (float) (Math.random()*5.25+1);
      sky[i] = cloud;
    }
  }

  void Render()
  {
    // when the clouds go of the screen randomise the speed and y 
    // (within a limit), else continue moving the clouds to the left.
    for (int i =0; i < sky.length; i++)
    {
      if (Xs [i] < - 300)
      {
        Ys [i] = (float)(Math.random()*125+1);
        Xs [i] = 2000;
        xSpeeds [i] = (float) (Math.random()*5.25+1);
        sky[i] = cloud;
      }
      Xs[i] -= xSpeeds[i];
      image (sky[i], Xs[i], Ys[i]);
    }
  }
}
