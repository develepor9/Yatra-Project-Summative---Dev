class Surfboard
{
  float y;
  float yspeed;

  Surfboard ()
  {
    y = 200;
    yspeed = 0.25;
  }

  void Render ()
  {
    y += yspeed;
    
    // makes the board move up and down
    if (y < 196)
    {
      yspeed *= -1;
    } else if (y > 204)
    {
      yspeed *= -1;
    }
    image (surfboard, 200, y);
  }
}
