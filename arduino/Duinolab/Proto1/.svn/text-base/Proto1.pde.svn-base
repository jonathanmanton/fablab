/*
  Based on the LiquidCrystal Library - Hello World example program
  http://www.arduino.cc/en/Tutorial/LiquidCrystal
 
  The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD R/W pin to digital pin 7
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * ends to +5V and ground
 
 Joystick
 Button to digital 6 - note digital 13 pullups only go to 1.7v... hmm.
 hor - analog 4
 ver - analog 5
 
 Buttons, attached to ground, will use AVR internal pullups
 * B1 to digital pin 8
 * B1 to digital pin 9
 * B1 to digital pin 10

 */

#define J_BUTTON 6
#define J_HORIZ A4
#define J_VERT A5

#define D_POT A2
#define E_POT A3

#define ENC_A 14
#define ENC_B 15
#define ENC_PORT PINC

// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  int i;
  
  // set the R/W mode of the LCD to write
  pinMode(7, OUTPUT);  
  digitalWrite(7, LOW);
  
  //set up button inputs, including internal pullups
  for (i = 8; i <= 10; i++) {
    pinMode(i, INPUT);  
    digitalWrite(i, HIGH);
  }
  
  // set button mode for joystick pushbutton
  pinMode(J_BUTTON, INPUT);
  digitalWrite(J_BUTTON, HIGH);
  
  /* Setup encoder pins as inputs */
  pinMode(ENC_A, INPUT);
  digitalWrite(ENC_A, HIGH);
  pinMode(ENC_B, INPUT);
  digitalWrite(ENC_B, HIGH);
  
  Serial.begin (115200);
  Serial.println("Start");
  
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  // clear screen
  lcd.clear();
}

void display_button(int iopin, int row, int col) {
  lcd.setCursor(col, row);
  if(digitalRead(iopin)) {
      lcd.print('x');
    } else {
      lcd.print('o');
  }
}

void display_pot(int iopin, int row, int col) {
  lcd.setCursor(col, row);
  char a[4];
  lcd.print('    ');
  int sensorvalue = analogRead(iopin);
  sprintf(a, "%4d", sensorvalue);
  lcd.setCursor(col, row);
  lcd.print(a);
}  
/* returns change in encoder state (-1,0,1) */
int8_t read_encoder()
{
  static int8_t enc_states[] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};
  static uint8_t old_AB = 0;
  /**/
  old_AB <<= 2;                   //remember previous state
  old_AB |= ( ENC_PORT & 0x03 );  //add current state
  return ( enc_states[( old_AB & 0x0f )]);
}

void loop() {
  static uint8_t counter = 0;      //this variable will be changed by encoder input
  int8_t tmpdata;
  char a[3];
 /**/
  int i;
  
  for (i = 8; i <= 10; i++) {
    display_button(i, 0, i-8);
  }

  tmpdata = read_encoder();
  if( tmpdata ) {
    Serial.print("Counter value: ");
    Serial.println(counter, DEC);
    counter += tmpdata;
  }
  lcd.setCursor(5,0);
  sprintf(a, "%3u", counter);
  lcd.print(a);


  display_button(J_BUTTON, 0, 15);
  display_pot(D_POT, 1,0);
  display_pot(E_POT, 1,4);
  display_pot(J_HORIZ, 1,8);
  display_pot(J_VERT, 1,12);
}

