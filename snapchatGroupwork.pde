/**
Creative Interactions - Assignment 2
*/

//import java.util.List<E>;
//import java.util.ArrayList<E>;

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

//int[] filters = new int[] {THRESHOLD, GRAY, INVERT, ERODE, DILATE};
//int currentFilter = 0;

void setup() {
  size(1920, 1080);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  star = loadImage("star.png");
  bg = loadImage("background.jpeg");
  background(bg);
}

void draw() {
  
}

// ----------------------------------------------------------------------------
// EVENT HANDLERS
// ----------------------------------------------------------------------------

void mousePressed() {
  if (mouseButton == RIGHT) {
    drawStars(pmouseX, pmouseY);
  }
}

void keyPressed() {
    // Colour Selection
       //BLUE
     if (key == 'b' || key == 'B') {
       stroke(0,0,255);
     } // RED
     else if (key == 'r' || key == 'R') {
       stroke(255,0,0);
     } // GREEN
     else if (key == 'g' || key == 'G') {
       stroke(0,255,0);
     } // YELLOW
     else if (key == 'y' || key == 'Y') {
       stroke(255,255,0);
     } //ORANGE
     else if (key == 'o' || key == 'O') {
       stroke(255,128,0);
     } //PINK
     else if (key == 'p' || key == 'P') {
       stroke(255,0,255);
     } //WHITE
     else if (key == 'w' || key == 'W') {
       stroke(255);
     }
     
    // FILTERS
     else if (key == 'f' || key == 'F') {
       save("/data/backup.jpeg");
       filter(INVERT);
       //filter(filters[currentFilter++]);
       //if (currentFilter >= filters.length) currentFilter = 0;
     }
    // REVERSE FILTER
     else if (key == 'u' || key == 'U') {
       background( loadImage("backup.jpeg"));
     }
}

void keyReleased() {
  
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

// ----------------------------------------------------------------------------
// CUSTOM METHODS
// ----------------------------------------------------------------------------

void drawStars(float x, float y) {
  image(star, x - 12.5, y - 12.5, 25, 25);
}
