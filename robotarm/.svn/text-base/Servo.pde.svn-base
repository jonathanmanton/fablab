#include <Servo.h> 
 
Servo myservo[6];  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 
int shoulder_start = 640;
int shoulder_offset = 2930;
int base_start = 1500;
int wrist_start = 1730;
int elbow_start = 1100;

 
void setup() 
{ 
  myservo[0].attach(9);  // attaches the servo on pin 9 to the servo object 
  myservo[1].attach(8);  // attaches the servo on pin 9 to the servo object 
  myservo[2].attach(7);  // attaches the servo on pin 9 to the servo object 
  myservo[3].attach(6);  // attaches the servo on pin 9 to the servo object 
  myservo[4].attach(5);  // attaches the servo on pin 9 to the servo object 
  myservo[5].attach(4);  // attaches the servo on pin 9 to the servo object 
  Serial.begin(9600);
  myservo[0].writeMicroseconds(shoulder_start); // center on initialization
  myservo[1].writeMicroseconds(shoulder_offset - shoulder_start); // center on initialization
  myservo[2].writeMicroseconds(base_start); // center on initialization
  myservo[3].writeMicroseconds(elbow_start); // center on initialization
  myservo[4].writeMicroseconds(wrist_start); // center on initialization
  myservo[5].writeMicroseconds(1500); // center on initialization
} 
 
 
void loop() 
{ 
  byte data;
  if(Serial.available()) {
    byte servo = Serial.read();
    while(!Serial.available());
    byte high = Serial.read();
    while(!Serial.available());
    byte low = Serial.read();
    int pos = high*256 + low;
    if(servo == 1) {
      myservo[0].writeMicroseconds(pos);
      myservo[1].writeMicroseconds(shoulder_offset - pos);
      Serial.println("moving shoulder");
    }
    if(servo >= 3 && servo <= 6) {
      myservo[servo - 1].writeMicroseconds(pos);
      Serial.println("moving base");
    }
    Serial.println(servo, DEC);
    Serial.println(pos, DEC);
    Serial.println();
  }
} 
