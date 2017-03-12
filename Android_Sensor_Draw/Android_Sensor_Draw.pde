import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;
float tx,ty,tz;
Tara[] taras = new Tara[3000];
float speed;

// For accessing sensors ... check out processing reference page ...

void setup() {
  fullScreen();
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  textFont(createFont("Arial", 60));
    for(int i = 0;i < taras.length;i++){
        taras[i] = new Tara();
    }

}

void draw() {
  background(255);
    speed = ty;
    translate(displayWidth/2,0);
    for(int i = 0;i < taras.length;i++){
        taras[i].update();
        taras[i].show(i);
    }
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    tx = event.values[0];
    ty = event.values[1];
    tz = event.values[2];  
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}

class Tara{
    float x,y,z;
    
    Tara(){
        x = random(-displayWidth,displayWidth);
        y = random(-displayHeight,displayHeight);
        z = random(displayWidth);
    }

    void update(){
        z = z-speed;
        if(z < 0){
            z = displayWidth;
            x = random(-displayWidth,displayWidth);
            y = random(-displayHeight,displayHeight);
        }
    }

    void show(int val){
        int mainVal1 = val-1500;
        fill(mainVal1,0,0);
        noStroke();
        float sx = map(x/z,0,1,0,displayWidth);
        float sy = map(y/z,0,1,0,displayHeight);
        float r = map(z,0,displayWidth,40,0);
        ellipse(sx,sy,r,r);
    }
}