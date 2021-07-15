/*Este programa gera texto (em grelha) com tipografias aleatórias em cada iteração, programa desenvolvido por RICARDO SACADURA no âmbito da prdução
 da identidade gráfica da Queima das Fitas, Coimbra 2021 */

import processing.pdf.*;

PFont f, frase;

//class invocation
Linha [] linha1, linha2, linha3, linha4, linha5;


//Definir as palavras (se a palavra nova diferir no número de letras é necessário alterar o valor das variáveis - num1, num2 e num3)
String queima = "QueiMA", das = "daS", fitas = "FiTaS", coimbra="CoiMbrA", data="2021";

int num1 = 6, num2 = 3, num3=5, num4=7, num5=4; //variável para o número de caracteres de cada palavra (ciclos (for))
int inc, inc_size=0;

float size, x, l, a;

color c;

void setup() {

  size(750, 750);
  //pixelDensity(2); //usar só caso seja necessário ver o programa em alta resolução

  beginRecord(PDF, "logo####.pdf");

  /*-------------------------------------------------------------------------------------
   Inicializa a 1ª palavra 'QUEIMA'*/

  linha1 = new Linha[num1];
  char [] q1=new char[num1];
  float y1;
  int total1=0;

  for (int i=0; i<num1; i++) {

    if (linha1[i]==linha1[0]) {
      l=90;
      a=100;
      x=90;
      y1=(height/2)-130;
      inc=90;
    } else {
      l=60;
      a=70;
      x=60;
      y1=(height/2)-100;
      inc=120;
    }

    linha1[i]= new Linha(i*x + inc, y1, l, a, q1[c]=queima.charAt(total1), f, a);
    linha1[i].sorteiaY();
    //linha1[i].setColor();
    linha1[i].sorteia();
    total1+=1;
  }

  /*-------------------------------------------------------------------------------------
   Inicializa a 2ª palavra 'DAS'*/
  linha2 = new Linha[num2];
  char [] q2=new char[num2];
  float y2=(height/2);
  int total2=0;

  for (int i=0; i<num2; i++) {
    linha2[i]= new Linha(i*40 + inc +10, y2 + 10, 40, 50, q2[c]=das.charAt(total2), f, a);
    linha2[i].sorteiaY();
    //linha2[i].setColor();
    linha2[i].sorteia();
    total2+=1;
  }

  /*-------------------------------------------------------------------------------------
   Inicializa a 3ª palavra 'FITAS'*/
  linha3 = new Linha[num3];
  char []q3=new char[num3];
  int total3=0;

  for (int i=0; i<num3; i++) {

    if (linha1[i]==linha1[0]) {
      l=90;
      a=100;
      x=90;
      inc=265;
      y2=(height/2)-10;
    } else {
      l=60;
      a=70;
      x=60;
      inc=295;
      y2=(height/2)+20;
    }


    linha3[i]= new Linha(i*x + inc, y2, l, a, q3[c]=fitas.charAt(total3), f, a);
    linha3[i].sorteiaY();
    //linha3[i].setColor();
    linha3[i].sorteia();
    total3+=1;
  }

  /*-------------------------------------------------------------------------------------
   Inicializa a 4ª palavra 'COIMBRA'*/

  linha4 = new Linha[num4];
  char []q4=new char[num4];
  float y4;
  int total4=0;

  for (int i=0; i<num4; i++) {

    if (linha4[i]==linha4[0]) {
      l=50;
      a=60;
      x=55;
      inc=205;
      y4=(height/2)+85;
    } else {
      l=35;
      a=45;
      x=35;
      inc=220;
      y4=(height/2)+100;
    }

    linha4[i]= new Linha(i*x +inc, y4 + 10, l, a, q4[c]=coimbra.charAt(total4), f, a);
    //linha4[i].sorteiaY();
    //linha2[i].setColor();
    linha4[i].sorteia();
    total4+=1;
  }

  /*-------------------------------------------------------------------------------------
   Inicializa a 5ª palavra '2021'*/

  linha5 = new Linha[num5];
  char []q5=new char[num5];
  float y5;
  int total5=0;

  for (int i=0; i<num5; i++) {

    l=25;
    a=35;
    x=27;
    inc=278;
    y5=(height/2)+160;

    linha5[i]= new Linha(i*x +inc, y5 + 10, l, a, q5[c]=data.charAt(total5), f, a);
    //linha4[i].sorteiaY();
    //linha2[i].setColor();
    linha5[i].sorteia();
    total5+=1;
  }

  /*-------------------------------------------------------------------------------------*/

  setFundo(); // invocação da função que muda o fundo do painél
}

void draw() {

  background(255); // para alterar o fundo a cada iteração substituir 0 '255' por 'c'


  /*-------------------------------------------------------------------------------------
   Desenha a 1ª palavra 'QUEIMA'*/

  float inc_size=0;
  for (int d=0; d<num1; d++) {
    linha1[d].desenha();
    linha1[d].escreve();

    if (linha1[d].getLargura_Letra()<linha1[d].getLargura()) {
      inc_size=2;
    } else if (linha1[d].getLargura_Letra() >= linha1[d].getLargura()) {
      inc_size=-2;
    }

    if (linha1[d].getSize()>=130) {
      linha1[d].increaseSize(-1);
    } else {
      linha1[d].increaseSize(inc_size);
    }
  }

  /*-------------------------------------------------------------------------------------
   Desenha a 2ª palavra 'DAS'*/

  for (int d=0; d<num2; d++) {
    linha2[d].desenha();
    linha2[d].escreve();

    if (linha2[d].getLargura_Letra()<linha2[d].getLargura()) {
      inc_size=1;
    } else if (linha2[d].getLargura_Letra()>=linha2[d].getLargura()) {
      inc_size=-1;
    }

    if (linha2[d].getSize()>=130) {
      linha2[d].increaseSize(-1);
    } else {
      linha2[d].increaseSize(inc_size);
    }
  }

  /*-------------------------------------------------------------------------------------
   Desenha a 3ª palavra 'FITAS'*/

  for (int d=0; d<num3; d++) {
    linha3[d].desenha();
    linha3[d].escreve();

    if (linha3[d].getLargura_Letra()<linha3[d].getLargura()) {
      inc_size=1;
    } else if (linha3[d].getLargura_Letra()>=linha3[d].getLargura()) {
      inc_size=-1;
    }

    if (linha3[d].getSize()>=130) {
      linha3[d].increaseSize(-1);
    } else {
      linha3[d].increaseSize(inc_size);
    }
  }

  /*-------------------------------------------------------------------------------------
   Desenha a 4ª palavra 'COIMBRA'*/

  for (int d=0; d<num4; d++) {
    linha4[d].desenha();
    linha4[d].escreve();

    if (linha4[d].getLargura_Letra()<linha4[d].getLargura()) {
      inc_size=1;
    } else if (linha4[d].getLargura_Letra()>=linha4[d].getLargura()) {
      inc_size=-1;
    }

    if (linha4[d].getSize()>=60) {
      linha4[d].increaseSize(-1);
    } else {
      linha4[d].increaseSize(inc_size);
    }
  }

  /*-------------------------------------------------------------------------------------
   Desenha a 5ª palavra '2021'*/

  for (int d=0; d<num5; d++) {
    linha5[d].desenha();
    linha5[d].escreve();

    if (linha5[d].getLargura_Letra()<linha5[d].getLargura()) {
      inc_size=1;
    } else if (linha5[d].getLargura_Letra()>=linha5[d].getLargura()) {
      inc_size=-1;
    }

    if (linha5[d].getSize()>=50) {
      linha5[d].increaseSize(-1);
    } else {
      linha5[d].increaseSize(inc_size);
    }
  }
}

void keyPressed() {

  /*-------------------------------------------------------------------------------------
   COMANDOS DE INTERAÇÃO*/

  if (key=='c') {
    for (int h=0; h<num1; h++) {
      linha1[h].sorteiaY();
      linha1[h].setColor();
      linha1[h].sorteia();
    }
    for (int h=0; h<num2; h++) {
      linha2[h].sorteiaY();
      linha2[h].setColor();
      linha2[h].sorteia();
    }
    for (int h=0; h<num3; h++) {
      linha3[h].sorteiaY();
      linha3[h].setColor();
      linha3[h].sorteia();
    }
    for (int h=0; h<num4; h++) {
      //linha4[h].sorteiaY();
      linha4[h].setColor();
      linha4[h].sorteia();
    }
    for (int h=0; h<num5; h++) {
      //linha5[h].sorteiaY();
      linha5[h].setColor();
      linha5[h].sorteia();
    }

    setFundo();
  }

  if (key=='s') {

    endRecord(); //guarda o frame atual
    println("a imagem foi salva");
    beginRecord(PDF, "logo####.pdf"); //inicia o record do frame seguinte
  }

  if (key=='e') {
    exit(); //sair do programa
  }
}

color setFundo() { //função que atribui uma nova cor de fundo a cada iteração
  color []fundo= new color[9];
  int sorteado;

  //cores das faculdades
  fundo[0]= color(#be0c15);
  fundo[1]= color(#00447f);
  fundo[2]= color(#0096d6);
  fundo[3]= color(#551900);
  fundo[4]= color(#f99d31);
  fundo[5]= color(#ffc425);
  fundo[6]= color(#53247f);
  fundo[7]= color(#eb352e);
  fundo[8]= color(#551900);

  sorteado = (int) random(0, fundo.length);

  c=color(fundo[sorteado]);

  return c;
}
