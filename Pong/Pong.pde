//global variables and objects
Ball myBall, movedBall; // Both 1/2's of constructor
Ball[] fireworks = new Ball[25];
Paddle pongTable, myPaddle, yourPaddle;
//
color pongTableColour = #171CFA; //ERROR: move to table CLASS, 255 is full Blue
boolean speedActive = true;
boolean explosion = true;
float gravity=0.5;
//
void setup() {
  size(700, 400); //fullscreen(); displayWidth; displayHeight
  //ScreenSizeChecker for landscape, portrait, square views
  //Updated automatically for screen rotation on android
  // Population
  starsSetup();
  myBall = new Ball();
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball( width*-1, height*-1, 0.5 );
  }
  movedBall = new Ball(width*-1, height*-1, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed);
  //error: paddle constructor for table does not populate paddle variables before paddles, paddle variables fail due to NULL
  //pongTable = new Paddle(); //rect(), drawn here
  myPaddle = new Paddle( 0, myBall.diameter );
  yourPaddle = new Paddle( width, myBall.diameter);
  //
} //end setup
//
void draw() { 
  //background(pongTableColour); //Night mode is known in CLASS, not DRIVER
  starsDraw();
  //
  //Arithmetic for paddles
  //paddles drawn before ball
  myPaddle.table();
  myPaddle.draw();
  yourPaddle.draw();
  //
  if ( myBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    myBall.draw();
  }
  //
  myBall.bounce(myPaddle.tableY, myPaddle.tableBottom);
  movedBall.bounce(myPaddle.tableY, myPaddle.tableBottom);
  //
  //myBall.tableYUpdate(myPaddle.tableX, myPaddle.tableY, myPaddle.tableWidth, myPaddle.tableHeight, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddleWidth, myPaddle.paddleHeight, yourPaddle.paddleHeight);
  //movedBall.tableYUpdate(myPaddle.tableX, myPaddle.tableY, myPaddle.tableWidth, myPaddle.tableHeight, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddleWidth, myPaddle.paddleHeight, yourPaddle.paddleHeight);
  //Trigger: left goal, right goal
  //ERROR: ball instance still bounces
if ((myBall.x < (2*myBall.diameter) || myBall.x > ( width-(2*myBall.diameter)) || movedBall.x < (2*movedBall.diameter) || movedBall.x > ( width-(2*movedBall.diameter)))) {
    if (explosion==true) {
    if (myBall.x < (2*myBall.diameter) || myBall.x > ( width-(2*myBall.diameter)) ) netExplosion(myBall.x, myBall.y);
    if (movedBall.x < (2*movedBall.diameter) || movedBall.x > ( width-(2*movedBall.diameter)) ) netExplosion(movedBall.x, movedBall.y);
    }
    explosion=false;
  } //Goal, firework constructor execution, based on x-value
  else 
  {
  explosion=true;
  }
  //
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  println(fireworks[0].y);
  movedBall.draw();
} //end draw
//
void keyPressed() {
  if (key=='o' || key=='O') {
    if (speedActive == true) {
    myBall.xSpeed*=1.25;
    myBall.ySpeed*=1.25;
    speedActive=false;
    }
  } 
  if (key=='a' || key=='A') {
    if (speedActive == true) {
    myBall.xSpeed*=1.25;
    myBall.ySpeed*=1.25;
    speedActive=false;
    }
  } 
  //
  myPaddle.keyPressedWS();
  yourPaddle.keyPressedOL();
} //end keyPressed
//
void keyReleased() {
  if (key=='o' || key=='O') {
  myBall.xSpeed/=1.25;
  myBall.ySpeed/=1.25;
  speedActive=true;
  }
  if (key=='a' || key=='A') {
  myBall.xSpeed/=1.25;
  myBall.ySpeed/=1.25;
  speedActive=true;
  }
  //
  myPaddle.keyReleasedWS();
  yourPaddle.keyReleasedOL();
} //end KeyReleased
void mousePressed() {
  starsMousePressed();
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(mouseX, mouseY, 0.5);
  }
  movedBall = new Ball(mouseX, mouseY, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed);
} //end mousePressed
//
void ballCollisions() {
  //change code to instances
  //if ( x < 0+(diameter*1/2) || x > width-(diameter*1/2) ) xSpeed *= xDirection; //Repetition is *-1
  //if ( y < 0+(diameter*1/2) || y > height-(diameter*1/2)) ySpeed *= yDirection; //Repetition is *-1
}//End ball collisions
//End DRIVER
