/**
Creative Interactions - Assignment 2
*/

/*
  IDEAS
  -----------------------------------------------------------------
  * Draw with mouse when SHIFT(?) is pressed
    - Randomize color?
    - or LineWeight? (thickness)
    - 
  * Filters with keypress (https://processing.org/reference/filter_.html)
    - save with mouse click
  * CTRL + mouse wheel OR mouse position: change the color. Display it somehow.
  * Cut and paste (or move around) a part of the picture (https://processing.org/reference/texture_.html)
  * Randomize the place of a stamp (or a place of multiple stars like you've been hit on the head) on the picture
    when you holding down a key or key + mouse combo
    (e.g. https://bensbitterblog.files.wordpress.com/2018/05/simpleboilingekaltadeta-max-1mb.gif?w=350&h=217)
  * While Holding down the right mouse key and writeing it will display the written text at the place of the mouse click
  * CTRL + Z will remove the last modification.

*/

PImage bg;
PImage star;

void setup() {
  size(960, 720);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");
  star = loadImage("star.png");
  background(bg);
}

void draw() {
  
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    drawStars(pmouseX, pmouseY);
  }
}

void drawStars(float x, float y) {
  image(star, x - 12.5, y - 12.5, 25, 25);
}
