void createStars() 
{
for (int i=0; i<stars.length; i++) {
  float diameterRandom = random(width*1/200, width*1/120);
    float xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
    float yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
    stars[i] = new Star(xRandom, yRandom, diameterRandom);
    int j=i;
    //
    while (j>=0) {
      if (xRandom-diameterRandom*1/2 > stars[j].x && xRandom+diameterRandom*1/2 < stars[j].x) {
        xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
      }
      j--; //first j
    }//end while x
    stars[i] = new Star( xRandom, yRandom, diameterRandom );
    j=i;
    while ( j>=0 ) {
      if (yRandom-diameterRandom*1/2 > stars[j].y && yRandom+diameterRandom*1/2 < stars[j].y) {
        yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
      }
      j--; //second j
    }//end while y
    stars[i] = new Star(xRandom, yRandom, diameterRandom);
}//end population
}
