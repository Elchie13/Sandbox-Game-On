void netExplosion(float xParameter, float yParameter) {
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(xParameter, yParameter, 1.0);
  }
} //End netExplosion
