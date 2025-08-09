;
; hello.echo.45.asm
;
; 9600 baud serial echo and LED hello-world program
;
; Neil Gershenfeld
; CBA MIT 10/5/08
;
; (c) Massachusetts Institute of Technology 2008
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;

.include "tn45def.inc"

.equ led_pin = PB4 ; LED pin
.equ txpin = PB2; transmit pin
.equ rxpin = PB3; receive pin
.def bitcnt = R16; bit counter
.def temp = R17; temporary storage
.def temp1 = R18; temporary storage
.def txbyte = R19; transmit byte
.def rxbyte = R20; receive byte

;
; print
; 
.macro print
   ldi zl,low(@0*2)
   ldi zh,high(@0*2)
   rcall print_db
   .endmacro

.cseg
.org 0
rjmp reset

;
; putchar
; assumes no line driver (doesn't invert bits)
;
.equ sb = 1; number of stop bits
putchar:
   ldi bitcnt, 9+sb; 1+8+sb
   com txbyte; invert everything
   sec; set start bit
   putchar0:
      brcc putchar1; if carry set
      sbi PORTB, txpin; send a '0'
      rjmp putchar2; else	
   putchar1:
       cbi PORTB, txpin	; send a '1'
       nop ; even out timing
   putchar2:
       rcall bitdelay; one bit delay
       rcall bitdelay
       lsr txbyte; get next bit
       dec bitcnt; if not all bits sent
       brne putchar0; send next bit
   ret;
;
; getchar
; assumes no line driver (doesn't invert bits)
;
getchar:
   ldi bitcnt,9 ; 8 data bit + 1 stop bit
   getchar1:
      sbis PINB, rxpin ; wait for start bit
      rjmp getchar1
   rcall bitdelay ; 0.5 bit delay
   getchar2:
      rcall bitdelay ; 1 bit delay
      rcall bitdelay ;
      clc ; clear carry
      sbis PINB, rxpin ; if RX pin high skip
         sec ; otherwise set carry
      dec bitcnt
      breq getchar3 ; return if all bits read
      ror rxbyte ; otherwise shift bit into receive byte
      rjmp getchar2 ; go get next bit
   getchar3:
      ret
;
; bitdelay
; serial bit delay
;
.equ b = 13 ; 9600 baud (8 MHz clock /8)
bitdelay:
   ldi temp, b
   bitloop:
      dec temp
      brne bitloop
   ret
;
; blink
; blink the LED
;
blink:
   sbi PORTB, led_pin
   ldi temp, 255
   blink_loop:
      ldi temp1, 255
      blink_loop1:
         dec temp1
	 brne blink_loop1
      dec temp
      brne blink_loop
   cbi PORTB, led_pin
   ret
;
; print_db
; prints a null-terminated .db string
;
print_db:
   print_loop:
      lpm
      mov txbyte,R0
      cpi txbyte,0
      breq return
      rcall putchar
      adiw zl, 1
      rjmp print_loop
   return:
      ret
;
; main program
;
reset:
   ;
   ; set stack pointer to top of RAM
   ;
   ldi temp, high(RAMEND)
   out SPH, temp
   ldi temp, low(RAMEND)
   out SPL, temp
   ;
   ; init comm pin
   ;
   cbi PORTB, txpin
   sbi DDRB, txpin
   ;
   ; init LED pin
   ;
   cbi PORTB, led_pin
   sbi DDRB, led_pin
   ;
   ; start main loop
   ;
   loop:
      rcall getchar
      print message
         message: .db "received character: ",0
      mov txbyte, rxbyte
      rcall putchar
      ldi txbyte,10
      rcall putchar
      rcall blink
      rjmp loop
