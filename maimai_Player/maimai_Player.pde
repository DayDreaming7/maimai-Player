//import processing.sound.*;
import ddf.minim.*;
import org.multiply.processing.*;
import lord_of_galaxy.timing_utils.*;
import arb.soundcipher.*; 

//Sounds
Minim minim;
AudioPlayer song;
String songName = "echo";
float songVolGain = -5.0;
AudioSample tapSound;
String tapSoundName = "tap";
float tapSoundVolGain = 8.0;

//SoundCipher
SCScore pattern;

//ArrayLists
ArrayList <Tap> taps;
ArrayList <HitPoint> hitPoints;
ArrayList <StartPoint> startPoints;

//Shapes
PShape psTap;
PShape tapOutter;
PShape tapInner;
PShape tapPoint;

float tapDefSpeed = 5;

//playing
Stopwatch playTimer;
boolean playing = false;

float displayTimeBuffer = 100;
float soundTimeBuffer = 3;

int tapCount = 0;
int movingTime;

//----------------------------------------------------------------------------
void setup() {
  fullScreen();
  //size(1200,800);
  orientation(LANDSCAPE);
  noStroke();
  ellipseMode(RADIUS);
  shapeMode(CENTER);
  frameRate(60);

  taps = new ArrayList();
  hitPoints = new ArrayList();
  startPoints = new ArrayList();

  minim = new Minim(this);
  song = minim.loadFile(songName + ".mp3");
  tapSound = minim.loadSample(tapSoundName + ".mp3", 512);
  song.setGain(songVolGain);
  tapSound.setGain(tapSoundVolGain);

  pattern = new SCScore();
  pattern.addCallbackListener(this);
  pattern.tempo(60*1000); //frameRate * 1000

  playTimer = new Stopwatch(this);

  initializeAll(); //Size, Shapes, HitPoints of mainRing
}

void draw() {
  background(bgColor);
  update();
}

void keyPressed() {
  if (key == ' ') {
    playing = !playing;

    if (playing) {
      song.rewind();
      playTimer.start();
      song.play();
      pattern.play();
    } else {
      playTimer.reset();
      song.pause();
    }
  }
}

void handleCallbacks(int callbackID) {
  if (callbackID == 0) {
    tapSound.trigger();
  }
  if (callbackID == 1) {
    taps.get(tapCount).visible = true;
    tapCount++;
  }
}