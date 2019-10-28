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

color drawingColor = #000000; // The colour of the drawing function
float drawingWeight = 5; // The thickness of the drawing function

void setup() {
  size(1920, 1080);
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
  // DRAWING STARS AT CLICKED POSITION
  if (mouseButton == RIGHT) {
    drawStars(pmouseX, pmouseY);
  }
}

int[] filters = new int[] {THRESHOLD, GRAY, INVERT, ERODE, DILATE};
int currentFilter = 0; // The index of the currently used filter
boolean hasBackup = false; // Indicate the backup of the whole picture

void keyPressed() {
    // COLOR SELECTION
     //BLUE
     if (key == 'b' || key == 'B') {
       drawingColor = color(0,0,255);
     }
     // RED
     else if (key == 'r' || key == 'R') {
       drawingColor = color(255,0,0);
     }
     // GREEN
     else if (key == 'g' || key == 'G') {
       drawingColor = color(0,255,0);
     }
     // YELLOW
     else if (key == 'y' || key == 'Y') {
       drawingColor = color(255,255,0);
     }
     //ORANGE
     else if (key == 'o' || key == 'O') {
       drawingColor = color(255,128,0);
     }
     //PINK
     else if (key == 'p' || key == 'P') {
       drawingColor = color(255,0,255);
     }
     //WHITE
     else if (key == 'w' || key == 'W') {
       drawingColor = color(255);
     }
     
    // GO THROUGH ALL THE FILTERS
     else if (key == 'f' || key == 'F') {
       // Reverse the previous filter if there is any
       if (hasBackup) restoreImage();
       backupImage();
       
       filter(filters[currentFilter++]);
       // Make shure the 'F' key go through all the filters, so jump to the beginning if it reached the end of the list
       if (currentFilter >= filters.length) currentFilter = 0;
     }
    // REVERSE FILTER
     else if (key == 'd' || key == 'D') {
       if (hasBackup) restoreImage();
     }
    // SAVE FILTER
     else if (key == 's' || key == 'S') {
       hasBackup = false;
     }
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    // DRAW WITH THE MOUSE WHEN LEFT BUTTON IS PRESSED
    strokeWeight(drawingWeight);
    stroke(drawingColor);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

void mouseWheel(MouseEvent e) {
  float count = e.getCount();
  // IF THE USER ROTATE THE WHEEL UP, INCREASE drawingWeight
  if (count < 0 && drawingWeight < 50) drawingWeight -= count;
  // IF THE USER ROTATE THE WHEEL DOWN, DECREASE drawingWeight
  else if (count > 0 && drawingWeight > 1) drawingWeight -= count;
}

// ----------------------------------------------------------------------------
// CUSTOM METHODS
// ----------------------------------------------------------------------------

/**
 * DRAW STARS AROUND THE GIVEN POSITION IN AN ELLIPSIS SHAPE
**/
void drawStars(float x, float y) {
  noFill();
  stroke(255,255,0);
  strokeWeight(1);
  
  ellipse(x, y, 200, 50);
  
  image(star, x - 112.5, y - 12.5, 25, 25);
  image(star, x - 72.5, y - 32.5, 25, 25);
  image(star, x - 12.5, y - 37.5, 25, 25);
  image(star, x + 45, y - 32.5, 25, 25);
  image(star, x + 87.5, y - 12.5, 25, 25);
  image(star, x + 45, y + 7.5, 25, 25);
  image(star, x - 12.5, y + 12.5, 25, 25);
  image(star, x - 72.5, y + 7.5, 25, 25);
}

private static final String BACKUP_FILE_NAME = "backup.jpeg";

void backupImage() {
  save("/data/" + BACKUP_FILE_NAME);
  hasBackup = true;
}

void restoreImage() {
  background( loadImage(BACKUP_FILE_NAME));
  hasBackup = false;
}
