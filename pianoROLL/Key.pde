class Key {

  float x;
  float y;
  int offset;
  color r = color(255, 50, 40);
  color w = color(255, 255, 255);
  color b = color(0, 0, 0);
  boolean on, flag;
  int timer= 0;
  int keyArrlocal;


  Key( int xpos, int off) {


    x=xpos;
    offset=off;
  }
  void updateW() { 

    timer--;
    if (timer == 0) {

      flag = false;
    }

    if (flag==true) {

      fill(r);
    } else {

      fill(w);
    }
  }


  void updateB() {  
    if (on ==true) {

      fill(r);
    } else {

      fill(b);
    }
  }

  void display() {
    rectMode(CENTER);
    if (keyArrlocal == 0) {
      rect(x+offset, height/2, 10, 50);
    } else {
      fill(0);
      if (flag ==true) { 
        fill(r);
      } 
      rect(x+offset, height/2-10, 10, 40);
    }
  }
}
