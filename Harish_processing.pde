import processing.serial.*;
import ddf.minim.*;

Serial myPort;
char val;
int appear;
float volume;

Minim minim;
AudioSnippet effect1;
AudioSnippet effect2;
AudioSnippet effect3;
AudioSnippet music1;
AudioSnippet music2;

boolean hasVolume;

void setup() {
  size(200, 200);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  minim = new Minim(this);
  effect1 = minim.loadSnippet("soundEffect1.wav");
  effect2 = minim.loadSnippet("soundEffect2.wav");
  effect3 = minim.loadSnippet("soundEffect3.wav");
//  music1 = minim.loadSnippet("music3.wav");
  music2 = minim.loadSnippet("music2.wav");
}

void draw() {
  background(0, 0, 0);
  if (myPort.available() > 0) {
    val = myPort.readChar();
    if (val == '1') {
      appear = 11;
    } else if (val == '2') {
      appear = 22;
    } else if (val == '3') {
      appear = 33;
    } else if (val == '4') {
      appear = 44;
    } else if (val == '5') {
      appear = 55;
    }
  }

  if (appear == 11) {
    if (!effect2.isPlaying()) {
      effect2.play();
    }
    if (!effect1.isPlaying()) {
      effect1.rewind();
    }
  }
  if (appear == 22) {
    if (!effect3.isPlaying()) {
      effect3.play();
      if (!effect2.isPlaying()) {
        effect2.rewind();
      }
    }
  }
  if (appear == 33) {
    effect1.play();
    if (!effect3.isPlaying()) {
      effect3.rewind();
    }
  }
  if (appear == 44) {
    music2.play();
//    if (!music1.isPlaying()) {
//      music1.rewind();
//    }
    effect1.pause();
    effect2.pause();
    effect3.pause();
//    music1.pause();
  }
  if (appear == 55) {
//    music1.play();
    if (!music2.isPlaying()) {
      music2.rewind();
    }
  }
}

