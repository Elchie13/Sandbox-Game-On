class Star {
  //global variables
  float x, y, diameter;
  //
  Star(float xParameter, float yParameter, float diameterParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.diameter = diameterParameter;
  }//end star constructor
  //
  void draw() {
    ellipse(x, y, diameter, diameter);
  }
}
