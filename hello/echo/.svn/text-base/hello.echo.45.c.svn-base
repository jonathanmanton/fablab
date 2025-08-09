//
//
// hello.echo.45.c
//
// 9600 baud serial echo hello-world program
//
// Neil Gershenfeld
// CBA MIT 10/5/08
//
// (c) Massachusetts Institute of Technology 2008
// Permission granted for experimental and personal use;
// license for commercial sale available from MIT.
//
//

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#define tx_pin PB2 // transmit pin
#define rx_pin PB3 // receive pin
#define led_pin PB4 // LED pin
#define bit_delay_time 104 // bit delay, 1/9600 in usec for 8 MHZ/8
#define char_delay_time 1 // char delay time, in ms

#define bit_delay() _delay_us(bit_delay_time) // RS232 bit delay
#define half_bit_delay() _delay_us(bit_delay_time/2) // RS232 half bit delay
#define char_delay() _delay_ms(char_delay_time) // RS232 char delay
#define output(pin) (DDRB |= byte(pin)) // set pin for output
#define set(pin) (PORTB |= byte(pin)) // set pin in PORTB
#define clear(pin) (PORTB &= ~(byte(pin))) // clear pin in PORTB
#define byte(bit) (1 << bit) // byte with bit set
#define bit_test(byte,bit) (byte & (1 << bit)) // test for bit set
#define pin_test(bit) (PINB & (1 << bit)) //test for pin test

char get_char() {
   //
   // read and return a character
   // assumes no line driver (doesn't invert bits)
   //
   unsigned char rxbyte=0;
   while (! pin_test(rx_pin))
      //
      // wait for start bit
      //
      ;
   //
   // delay to middle of first data bit
   //
   half_bit_delay();
   bit_delay();
   //
   // read data bits
   //
   if pin_test(rx_pin)
      rxbyte |= (0 << 0);
   else
      rxbyte |= (1 << 0);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 1);
   else
      rxbyte |= (1 << 1);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 2);
   else
      rxbyte |= (1 << 2);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 3);
   else
      rxbyte |= (1 << 3);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 4);
   else
      rxbyte |= (1 << 4);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 5);
   else
      rxbyte |= (1 << 5);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 6);
   else
      rxbyte |= (1 << 6);
   bit_delay();
   if pin_test(rx_pin)
      rxbyte |= (0 << 7);
   else
      rxbyte |= (1 << 7);
   return rxbyte;
   }

void put_char(char txchar) {
   //
   // print the character in txchar
   // assumes no line driver (doesn't invert bits)
   //
   // start bit
   //
   set(tx_pin);
   bit_delay();
   //
   // data bits
   //
   if bit_test(txchar,0)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,1)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,2)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,3)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,4)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,5)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,6)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   if bit_test(txchar,7)
      clear(tx_pin);
   else
      set(tx_pin);
   bit_delay();
   //
   // stop bit
   //
   clear(tx_pin);
   bit_delay();
   }

void print_string(char *str) {
   //
   // print the null-terminated program memory string str
   //
   while (pgm_read_byte(str) != 0x00)
      put_char(pgm_read_byte(str++));
      char_delay();
   }

void blink() {
   //
   // blink the LED
   //
   set(led_pin);
   _delay_ms(10);
   clear(led_pin);
   }

char message[] PROGMEM = "received character: ";

int main(void) {
   unsigned char rxbyte;
   output(tx_pin);
   output(led_pin);
   clear(tx_pin);
   while (1) {
      rxbyte = get_char();
      print_string(message);
      put_char(rxbyte);
      put_char('\n');
      blink();
      }
   }
