;
; hello.serial.i0.45.asm
;
; 9600 baud serial echo program
;
; Neil Gershenfeld
; CBA MIT 10/15/07
;
; (c) Massachusetts Institute of Technology 2007
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;
.include "tn45def.inc"
;
; pin definitions
;
.equ tx_pin = PB2; transmit pin
.equ rx_pin = PB3; receive pin
;
; register definitions
;
.def bit_count = R16; bit counter
.def temp = R17; temporary storage
.def temp1 = R18; temporary storage
.def txbyte = R19; transmit byte
.def rxbyte = R20; receive byte
;
; print macro
; 
.macro print
   ldi zl,low(@0*2)
   ldi zh,high(@0*2)
   rcall print_db
   .endmacro
;
; code segment
;
.cseg
.org 0
rjmp reset
;
; bit delay
; serial bit delay
;
.equ b = 13 ; 9600 baud (clock /8)
;.equ b = 8 ; 115200 baud (clock /1)
bit_delay:
   ldi temp, b
   bitloop:
      dec temp
      brne bitloop
   ret
;
; putchar
; assumes no line driver (doesn't invert bits)
;
.equ sb = 1; number of stop bits
putchar:
   ldi bit_count, 9+sb; 1+8+sb
   com txbyte; invert everything
   sec; set start bit
   putchar0:
      brcc putchar1; if carry set
      sbi PORTB, tx_pin; send a '0'
      rjmp putchar2; else	
   putchar1:
       cbi PORTB, tx_pin	; send a '1'
       nop ; even out timing
   putchar2:
       rcall bit_delay; one bit delay
       rcall bit_delay
       lsr txbyte; get next bit
       dec bit_count; if not all bits sent
       brne putchar0; send next bit
   ret;
;
; getchar
; assumes no line driver (doesn't invert bits)
;
getchar:
   ldi bit_count,9 ; 8 data bit + 1 stop bit
   getchar1:
      sbis PINB, rx_pin ; wait for start bit
      rjmp getchar1
   rcall bit_delay ; 0.5 bit delay
   getchar2:
      rcall bit_delay ; 1 bit delay
      rcall bit_delay ;
      clc ; clear carry
      sbis PINB, rx_pin ; if RX pin high skip
         sec ; otherwise set carry
      dec bit_count
      breq getchar3 ; return if all bits read
      ror rxbyte ; otherwise shift bit into receive byte
      rjmp getchar2 ; go get next bit
   getchar3:
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
   ; init transmit pin for output
   ;
   sbi PORTB, tx_pin
   sbi DDRB, tx_pin
   ;
   ; main loop
   ;
   main_loop:
      rcall getchar
      print message
         message: .db "received character: ",0
      mov txbyte, rxbyte
      rcall putchar
      ldi txbyte,10
      rcall putchar
      rjmp main_loop
