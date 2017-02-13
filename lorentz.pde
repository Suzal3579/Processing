// import peasy.*;

float x = 0.01, y = 0, z = 0;
float sigma = 10, beta = 28,row = 8.0/3.0;

// PeasyCam cam;
// Syntax for ArrayList in java ...
ArrayList<PVector> arraylist = new ArrayList<PVector>();

void setup() {
    size(1340, 600, P3D);    
    colorMode(HSB);
    // cam = new PeasyCam(this,500); 
}

void draw() {
    background(255);
    float dt = 0.01;

    // Lorentz Formula from wikipedia ...
    
    float dx = (sigma * (y - x)) * dt;
    float dy = (x * (beta - z) - y) * dt;
    float dz = (x * y - row * z) * dt;
    x = x + dx;
    y = y + dy;
    z = z + dz;

    // Lorentz Formula Ends here ...
    // For smooth continuous line there should be more finer and closer points per frame .... sO multiply by dt in above part ...

    // Storing the points in Pvector ArrayList .....
    arraylist.add(new PVector(x,y,z));

    translate(width/2,height/2);
    scale(5);           
    stroke(0);
    noFill();
    
    float hue = 0;
    beginShape();
    for(PVector vector : arraylist){
        stroke(hue,255,255);
        vertex(vector.x,vector.y,vector.z);
        hue = hue + 0.1;
      
        if(hue>255){
            hue = 0;
        }
    }
    endShape();
}
