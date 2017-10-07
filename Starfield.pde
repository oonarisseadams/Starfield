/*
Starfield: Reqs
First, finish the NormalParticle class. It will need the following members:
  - 5 member variables: X and Y positions, Color, Angle and Speed. (Hint: use doubles for X, Y, Speed and Angle)
  - NormalParticle(), the class constructor
  - void move(), Takes the cos of the angle times the speed and adds it to the X coordinate. Does the same to Y with the sin of the angle.
  - void show(), draws the particle in the correct color

    Now finish the program's setup() and draw()
  - Add one NormalParticle variable, and make sure you can see it move
  - Now modify the program so you have an array of NormalParticles.
  - Run your program and make sure you can see all the particles move.
  - Finish the Particle interface. It will list two methods:

    public void show();
    public void move();

  - Have your NormalParticle implement the Particle interface.
  - Add public in front of the move() & show() methods in your NormalParticle class.
  - Create an OddballParticle class that implements the Particle interface.
  - Finish the OddballParticle class. It will be similiar to the NormalParticle, but 
    OddballParticles should have different move() and show() methods.
  - Change your array of NormalParticles to an array of type Particle.
  - Change the first element in the array to a OddballParticle instead of a NormalParticle
  - Run your program. Make sure you can see the Oddball.

Now, write a new Jumbo class that extends NormalParticle (or extends OddballParticle). 
In this class you will only need to override 
  - the one method public void show() to draw a larger ellipse.
  - Change the second element in the array to a Jumbo instead of a normal Particle. 
  Run your program and make sure you can see the Jumbo.
    Submit the url of your GitHub webpage via the school loop drop box for the assignment

Extensions: Have a fun and be creative. 
If you have extra time you may want to modify your program and add extra features. 
Experiment with different arrangements of particles. Look at student work from the 
links below for other variations.
*/

Particle[] masa;

void setup(){
  size(400,400);
  masa = new Particle[300];
  for (int i = 0; i < masa.length; i++)
  {
    masa[i] = new NormalParticle();
  }
  masa[250] = new OddballParticle();
  masa[5] = new JumboParticle();
}

void draw()
{
  background(0);
  for (int i = 0; i < masa.length; i++)
  {
    masa[i].move();
    masa[i].show();
  }
}

class NormalParticle implements Particle
{
  double x , y, speed, angle;
  int mycolor;
  
  NormalParticle()
  {
    x = 200;
    y = 200;
    angle = Math.random()*2*Math.PI;
    speed = Math.random()*5+1;
  }
  
  
  
  public void move ()
  {
    x = x + (Math.cos((float)angle) * speed);
    y = y + (Math.sin((float)angle) * speed);
  }
  
  
  
  public void show()
  {
    mycolor = color ((int)(Math.random()*255)+20, (int)(Math.random()*255)+30, (int)(Math.random()*255)+70);
    fill(mycolor);
    ellipse((float)x, (float)y, 3, 3);
  }
}

interface Particle
{
  public void move();
  public void show();
}




class OddballParticle implements Particle
{
  double x, y, speed, angle, rotation;
  OddballParticle()
  {
    x = 0;
    y = 0;
    angle = .5*PI;
    speed = Math.random()*5;
    rotation = 0;
  }
  
  
  public void move()
  {
    x = x + (Math.cos((float)angle) * speed);
    y = y + (Math.sin((float)angle) * speed);
  }
  
  
  public void show()
  {
    pushMatrix();
    translate(200,200);
    rotate((float)rotation);
    fill(255,60,45);
    ellipse((float)x,(float)y, 20, 20);
    popMatrix();
  }
}
    


class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
  }
  public void show()
  {
    mycolor = color ((int)(Math.random()*255)+40, (int)(Math.random()*255)+300, (int)(Math.random()*255)+78);
    fill(mycolor);
    ellipse((float)x, (float)y, 20, 20);
    
  }
}
void mousePressed()
{
  for (int i = 0; i < masa.length; i++)
  {
    masa[i] = new NormalParticle();
    masa[250] = new OddballParticle();
    masa[5] = new JumboParticle();
  }
}


