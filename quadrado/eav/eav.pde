// importa as bibliotecas necessárias
// "ensina" ao processing funções extras
import oscP5.*;
import netP5.*;
import processing.serial.*; // reference the serial library

import cc.arduino.*; // reference the arduino library

Arduino arduino; // create a variable arduino of the Arduino data type


//inicia a comuni cação
//não diz respeito a O QUE vai ser enviado
//mas sim a COMO (em qual formato), e POR ONDE
OscP5 mnsgOsc = new OscP5(this, 6666);
NetAddress meuLocalRemoto = new NetAddress("127.0.0.1", 57120);

int limite=1020;

int rep;
float alpha = random (80, 100);


void setup() {
  fullScreen();
  //size(700, 700);
  background(255);
  //println(Serial.list());
  arduino = new Arduino(this, "COM13", 57600);
}


void draw() {

  float a = arduino.analogRead(1);
  float b = arduino.analogRead(3);
  float c = arduino.analogRead(5);
  println(c);
  //if (a >= limite) {


  //  quadrado();
  //  OscMessage minhaMnsg = new OscMessage("/quadrado");
  //  mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  //}

  //if (a <= 0) {

  //  //circ();
  //  quadrado();
  //  OscMessage minhaMnsg = new OscMessage("/quadrado");
  //  mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  //}

  //if (b >= limite) {

  //  circ();
  //  //quadrado();
  //  OscMessage minhaMnsg = new OscMessage("/circ");
  //  mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  //}

  //if (b <= 0 ) {

  //  circ();
  //  //quadrado();
  //  OscMessage minhaMnsg = new OscMessage("/circ");
  //  mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  //}

  if (c >= limite) {
    quadrado();
    triang();
    OscMessage minhaMnsg = new OscMessage("/quadrado");
    mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  } 
  //if (c <= 0) {
  //  quadrado();
  //  triang();
  //  OscMessage minhaMnsg = new OscMessage("/quadrado");
  //  mnsgOsc.send(minhaMnsg, meuLocalRemoto);
  //}
  else {
    background(255);
  }
}
void quadrado () {
  rep=int(random(10, 50));
  float x = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float k = random (50, 120);

  pushMatrix();
  {

    noStroke();
    rectMode(CENTER);
    fill(0, random(40, 200 ));
    rect(y, x, k, k);
    popMatrix();
  }
}
void circ () {
  rep=int(random(10, 50));
  float x = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float r = random (20, 100);

  pushMatrix();
  {

    noStroke();
    fill(0, random(20, 200 ));
    ellipse(x, y, r, r);
    popMatrix();
  }
}
void triang () {  /// nao funcionando

  float x = random(height/5, height- height/5);
  float u = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float w = random (width/5, width- width/5);

  pushMatrix();
  {

    noStroke();
    fill(0, random(20, 200 ));
    triangle(y, x, y, u, w, x);
    popMatrix();
  }
}