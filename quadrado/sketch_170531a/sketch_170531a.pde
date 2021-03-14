// importa as bibliotecas necessárias
// "ensina" ao processing funções extras
import oscP5.*;
import netP5.*;

//inicia a comunicação
//não diz respeito a O QUE vai ser enviado
//mas sim a COMO (em qual formato), e POR ONDE
OscP5 mnsgOsc = new OscP5(this, 6666);
NetAddress meuLocalRemoto = new NetAddress("127.0.0.1", 57120);




int rep;
float alpha = random (80, 100);
void setup() {
  size(700, 700);
  background(255);
  
}
void draw() {
  
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      
  //circ();
  quadrado();
   OscMessage minhaMnsg = new OscMessage("/bordaEsq");
    mnsgOsc.send(minhaMnsg, meuLocalRemoto);

  }
     if (key == 'a' || key == 'A') {
      
  circ();
  //quadrado();
   OscMessage minhaMnsg = new OscMessage("/bordaEsq");
    mnsgOsc.send(minhaMnsg, meuLocalRemoto);

  }
 if (key == 'c' || key == 'C') {
      
  triang();
   OscMessage minhaMnsg = new OscMessage("/bordaEsq");
    mnsgOsc.send(minhaMnsg, meuLocalRemoto);

  }
}
  else {
  background(255);
  }
}
void quadrado () {
rep=int(random(10, 50));
  float x = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float w = random (20, 100);
 
  pushMatrix();
  {

    noStroke();
    rectMode(CENTER);
    fill(0, random(20, 200 ));
    rect(x, y, w, w);
    popMatrix();
    
  }
  
}
  void circ () {
rep=int(random(10, 50));
  float x = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float w = random (20, 100);
 
  pushMatrix();
  {

    noStroke();
    fill(0, random(20, 200 ));
    ellipse(x, y, w, w);
    popMatrix();
    
  }}
    void triang () {  /// nao funcionando

  float x = random(height/5, height- height/5);
  float y = random(width/5, width- width/5);
  float w = random (width/5, width- width/5);
 
  pushMatrix();
  {

    noStroke();
    fill(0, random(20, 200 ));
    triangle(x, y,y,y, w,x);
    popMatrix();
    
  }
}