Drop[] drops= new Drop[600];

void setup() {
    size(1340, 620);
    for (int i = 0; i<drops.length;i++){
        drops[i] = new Drop();
    }   
}

void draw() {
    background(255);
    for (int i = 0; i<drops.length;i++){
        drops[i].fall();
        drops[i].show();
    }  
}


class Drop{

    float x = random(width) ,
          y=random(-200,-100),
          z = random(0,20),
          yspeed=map(z,0,20,1,6),
          rainHeight = map(z,0,20,10,20);

    void fall(){
        y= y+yspeed;
        float gravity = map(z,0,20,0,0.3);
        yspeed = yspeed+gravity;
        if(y > height){
            y=random(-200,-100);
            yspeed = map(z,0,20,4,10);
        }
    }

    void show(){
        float thickness = map(z,0,20,1,5);
        strokeWeight(thickness);
        stroke(random(0,255),random(0,255),random(0,255));
        line(x, y, x, y+rainHeight);
    }
}
