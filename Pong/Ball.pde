/*Known ERRORS
- Night Mode: Ball colour is full blue
*/
class Ball
{
  //Global variables (of class)
  float x, y, diameter;
  color colour;
  float xSpeed, ySpeed, xDirection, yDirection, xSpeedChange=1.0, ySpeedChange=1.0;
  float gravity=0.0;
  Boolean disappear=false;
  //static int count = 25; //Static number for amount of ball instances in a firework
  //
  //Multiple Constructors by identifying different parameters
  Ball () {
    //Costructor Is... hard coded, single variable object
    //Local variables, deleted at the end of constructor
    int startX = width*1/2;
    int startY = height*1/2;
    int referentMeasure = ( width<height) ? width : height ; //review ternary operator
    //
    //Object variables
    this.x = startX; //span myBall in middle of display
    this.y = startY; 
    this.diameter = referentMeasure*1/20;
    this.colour = color ( random(255), random(255), random(255)) ; //random(), shortcut, casting from float to intin color var
    this.xSpeed = xDirection(); // float, could be any number
    this.ySpeed = yDirection();
    xDirection = -1; //float, truncated, must be minimum 2
    yDirection = -1;
    this.xSpeedChange = 1.0;
    this.ySpeedChange = 1.0;
  }//End Ball Constructor
  //
  //Firework constructor
  Ball (float xParameter, float yParameter, float gravityParameter) {
    //Ball(); //Place holder
    this.x = xParameter; //ERROR: trigger when ball enters goal
    this.y = yParameter; //ERROR: trigger when ball enters goal
    this.colour = color ( random(255), random(255), random(255)) ;
    this.diameter = random(width*1/25);
    this.xSpeed = random(-5, 5);
    this.ySpeed = random(-5, 5);
    gravity = gravityParameter; //gloabl variable = local variable
    
  } //End firework
  //
  //overloaded constructor, moved ball constructor
  //must look like old Ball instance, and make old ball instance disappear
  Ball(float xParameter, float yParameter, float diameterParameter, color colourParameter, float xSpeedParameter, float ySpeedParameter) {
    this.x = xParameter; //spawn myBall in middle of the display
    this.y = yParameter;
    this.diameter = diameterParameter;
    this.colour = colourParameter;
    this.xSpeed = xSpeedParameter;
    this.ySpeed = ySpeedParameter;
    //
    //
    this.xSpeed = xDirection(); // float, could be any number
    this.ySpeed = yDirection();
    xDirection = -1; //float, truncated, must be minimum 2
    yDirection = -1;
    this.xSpeedChange = 1.0;
    this.ySpeedChange = 1.0;
    //
    //
  } //End movedBall constructor
  //
  float xDirection() {
    float xDirection = int ( random(-6, 6) );
    while (xDirection > -3 && xDirection < 3) {
      xDirection = int ( random(-6, 6) ); //variable must be populated first
    }
    return xDirection;
  }
  float yDirection() {
    float yDirection = int ( random(-6, 6) );
    while (yDirection > -3 && yDirection < 3) {
      yDirection = int ( random(-6, 6) ); //variable must be populated first
    }
    return yDirection;  
  }
  void draw() { //ball, different draw function than the main program
    fill(colour); //caution: must reset defaults
    ellipse(x, y, diameter, diameter); //Easter egg: at bounce, diameters changes
    fill(0);
    //
    step(); //manipulating the variables
  } //End draw
  void step() {
    ySpeed += gravity; //ball() is not affected, gravity is zero for it
    x += xSpeed * xSpeedChange; //x = x + xSpeed
    y += ySpeed * ySpeedChange;
  } //End step
  void bounce(float topParameter, float bottomParameter) {
    if ( x < 0+(diameter*1/2) || x > width-(diameter*1/2) ) xSpeed *= xDirection; //Repetition is *-1
    if ( y < topParameter+(diameter*1/2) || y > bottomParameter-(diameter*1/2)) ySpeed *= yDirection; //Repetition is *-1
    //paddle horizontal bounce code
    if (x < width*1/2) {
      if ( y < (myPaddle.paddleY+myPaddle.paddleHeight) & y > myPaddle.paddleY & x <= (myPaddle.paddleX+myPaddle.paddleWidth+diameter*1/2) & x >= (myPaddle.paddleX-diameter*1/2)) xSpeed *= xDirection;
    }
    if (x > width*1/2) {
      if ( y < (yourPaddle.paddleY+yourPaddle.paddleHeight) & y > yourPaddle.paddleY & x >= (yourPaddle.paddleX-diameter*1/2) & x <= (yourPaddle.paddleX+yourPaddle.paddleWidth+diameter*1/2) ) xSpeed *= xDirection;
    }
    //paddle vertical bounce code
    if (x < width*1/2) {
      if ( y < (myPaddle.paddleY+myPaddle.paddleHeight+diameter*1/2) & y > myPaddle.paddleY-(diameter*1/2) & x >= myPaddle.paddleX & x <= (myPaddle.paddleX+myPaddle.paddleWidth) ) ySpeed *= yDirection;
    }
    if (x > width*1/2) {
      if ( y < (yourPaddle.paddleY+yourPaddle.paddleHeight+diameter*1/2) & y > yourPaddle.paddleY-(diameter*1/2) & x >= yourPaddle.paddleX & x <= (yourPaddle.paddleX+yourPaddle.paddleWidth) ) ySpeed *= yDirection;
    }
  }//End bounce
  //
  /*
  void tableYUpdate( float tableYParameter, float tableHeightParameter, float tableWidthParameter, float tableXParameter, float myPaddleXParameter, float yourPaddleXParameter, float myPaddleYParameter, float yourPaddleYParameter, float paddleWidthParameter, float myPaddleHeightParameter, float yourPaddleHeightParameter ) {
    tableY = tableYParameter;
    tableHeight = tableHeightParameter;
    tableWidth = tableXParameter + tableWidthParameter;
    paddleX = (x < tableWidth/2) ? myPaddleXParameter : yourPaddleXParameter;
    paddleY = (x < tableWidth/2) ? myPaddleXParameter : yourPaddleXParameter;
    paddleWidth = paddleWidthParameter;
    paddleHeight = (ballX < tableWidth/2) ? myPaddleHeightParameter : yourPaddleHeightParameter;
  }*/
} //end BALL
