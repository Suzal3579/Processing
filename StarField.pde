Tara[] taras = new Tara[1500];

float speed;

void setup(){
    size(1340,600);
    for(int i = 0;i < taras.length;i++){
        taras[i] = new Tara();
    }
}

void draw(){
    background(0);
    speed = map(mouseY,0 ,width,0,50);
    translate(width/2,height/2);
    for(int i = 0;i < taras.length;i++){
        taras[i].update();
        taras[i].show();
    }
}


class Tara{
    float x,y,z;
    Tara(){
        x = random(-width,width);
        y = random(-height,height);
        z = random(width);
    }

    void update(){
        z = z-speed;
        if(z < 0){
            z = width;
            x = random(-width,width);
            y = random(-height,height);
        }
    }

    void show(){
        fill(255);
        noStroke();
        float sx = map(x/z,0,1,0,width);
        float sy = map(y/z,0,1,0,height);
        float r = map(z,0,width,16,0);
        ellipse(sx,sy,r,r);
    }
}