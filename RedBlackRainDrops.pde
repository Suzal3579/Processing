Tara[] taras = new Tara[3000];

float speed;

void setup(){
    size(1340,620);
    for(int i = 0;i < taras.length;i++){
        taras[i] = new Tara();
    }
}

void draw(){
    background(255);
    speed = map(mouseX,0 ,width,0,10);
    translate(width/2,0);
    for(int i = 0;i < taras.length;i++){
        taras[i].update();
        taras[i].show(i);
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

    void show(int val){
        int mainVal1 = val-1500;
               
        fill(mainVal1,0,0);
        
        noStroke();
        
        float sx = map(x/z,0,1,0,width);
        float sy = map(y/z,0,1,0,height);
        float r = map(z,0,width,40,0);

        ellipse(sx,sy,r,r);

    }
}