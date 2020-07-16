import codeanticode.syphon.*;
SyphonServer server;
import themidibus.*;
MidiBus myBus; // The MidiBus
int timer=20;
float x=0;
float y=0;
Key[] wkeys;
int countW = 128;

int[] keyArr =     {0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 0, 1, 0};

int Note, Not;
int vel;

void setup() {
  size (1080, 300, P3D);
  PJOGL.profile=1;
  server = new SyphonServer(this, "Processing Syphon");
  MidiBus.list();
  myBus = new MidiBus(this, 1, 0);



  wkeys = new Key[countW];


  int index = 0;
  for (int x = 0; x<countW; x++) {

    wkeys[index++]= new Key(x*10, 12);
    wkeys[x].keyArrlocal=keyArr[x];
  }
}

void draw() {

  background(#EAD87D);


  for (Key k : wkeys) {
    k.updateW();
    k.display();
  }
  server.sendScreen();
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn

  if ( velocity>0) {
    velocity=0;
    wkeys[pitch].flag = true;
    wkeys[pitch].on = true;
    wkeys[pitch].timer=20;
    print(pitch + "on");
  }



  if ( wkeys[pitch].flag == false) {
    velocity=0;
    for (int x = 0; x<countW; x++) {
      wkeys[x].flag=false;
    }
    wkeys[pitch].on = false;
    print(pitch + "off");
  }


  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}
