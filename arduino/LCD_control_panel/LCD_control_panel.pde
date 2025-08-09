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
 
 Buttons, attached to ground, will use AVR internal pullups
 * B1 to digital pin 8
 * B1 to digital pin 9
 * B1 to digital pin 10

 */

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
  
  
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("hello, world!");
}

void loop() {
  int i;
  
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(millis()/1000);
  
  for (i = 8; i <= 10; i++) {
    lcd.setCursor(i,1);
    if(digitalRead(i)) {
      lcd.print('x');
    } else {
      lcd.print('o');
    }
  }
}

