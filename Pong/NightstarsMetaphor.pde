//global variables
int NumberOfStars=1500;
Star[] stars = new Star[NumberOfStars];

void starsSetup() {
  createStars();
}//end setup
//
void starsDraw() {
  background(#000000);
  fill(255);
  for (int i=0; i<stars.length; i++) {
    stars[i].draw();
  }
}
//
void starsMousePressed() {
  createStars();
}//end mousePressed
