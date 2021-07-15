class Linha {
  float x, y; //posição
  float w, h; //largura e altura do módulo
  char queima; //letra
  PFont f; //tipografia
  int sort, sort2; //nmr sorteio
  float size, fw;
  float sortY;
  color c;

  Linha(float xpos, float ypos, float wval, float hval, char queima_, PFont f_, float size_) {
    x=xpos;
    y=ypos;
    w=wval;
    h=hval;
    queima=queima_;
    f=f_;
    size=size_;
  }

  void desenha() {
    noFill();
    noStroke();
    //strokeWeight(1);
    rect(x, y, w, h);
  }

  //Esta função vai sortear uma tipografia por cada letra que é desenhada, as várias fontes são carregadas aqui.
  PFont sorteia() {

    StringList sorteio;
    int sort;
    sorteio = new StringList();

    sorteio.append("FranklinGothicStd-Condensed.otf");
    sorteio.append("SpaceMono-Bold.ttf");
    sorteio.append("SportingGrotesque-Bold.otf");
    sorteio.append("London Fill.ttf");
    sorteio.append("Charter-Bold-04.ttf");
    sorteio.append("FuturaStd-Bold.otf");

    String []sorteado = sorteio.array();

    sort = (int) random(0, sorteado.length);

    f = createFont(sorteado[sort], 100, true);

    return f;
  }

  float sorteiaY() {

    sortY=round(random(-5, 5));
    return sortY;
  }

  float setColor() {

    color []sorteado= new color[10];

    sorteado[0]= color(#be0c15);
    sorteado[1]= color(#00447f);
    sorteado[2]= color(#0096d6);
    sorteado[3]= color(#fff6dc);
    sorteado[4]= color(#f99d31);
    sorteado[5]= color(#ffc425);
    sorteado[6]= color(#53247f);
    sorteado[7]= color(#eb352e);

    sort2 = (int) random(0, sorteado.length);

    c= color(sorteado[sort2]);

    return c;
  }

  float getLargura_Letra() {
    float fw = textWidth(queima);
    return fw;
  }
  float getLargura() {
    return w;
  }

  float getSize() {
    return size;
  }

  float getChar() {
    return queima;
  }

  float increaseSize(float inc) {
    size+=inc;
    return size;
  }


  //Esta função vai escrever texto sempre que é chamada.
  void escreve() {
    fill(0);
    textFont(f);
    textSize(size);
    textAlign(CENTER, LEFT);
    text(queima, x+(w/2), y+h+sortY);
  }
}
