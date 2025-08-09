;
; hello3.asm
; Neil Gershenfeld CBA MIT 10/29/05
; tiny13 hello world program
;

.include "tn13def.inc"
.equ txpin = PB4; transmit pin
.def bitcnt = R16; bit counter
.def temp = R17; temporary storage
.def temp1 = R18; temporary storage
.def txbyte = R19; data byte

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
; bit delay
;
.equ b = 17 ; 9600 bps
bitdelay:
   ldi temp, b
   bitloop:
      dec temp
      brne bitloop
   ret
;
; print_delay
; delay between printed lines
;
.equ delay = 200
print_delay:
   ldi temp1, delay
   charloop1:
      ldi temp, delay
      charloop0:
         dec temp
         brne charloop0
      dec temp1
      brne charloop1
   ret
;
; print
; prints a null-terminated string
;
print:
   print_loop:
      lpm
      mov txbyte,R0
      cpi txbyte,0
      breq return
      rcall putchar
      inc zl
      rjmp print_loop
   return:
      ret
;
; string to print
;
print_string:
   .db "hello world",13,10,0
;
; main program
;
reset:
   ldi temp, low(RAMEND) ; set stack pointer to top of RAM
   out SPL, temp ;
   sbi PORTB, txpin; init comm pin
   sbi DDRB, txpin
   loop:
      ldi zl,low(print_string*2)
      ldi zh,high(print_string*2)
      rcall print
      rcall print_delay
      rjmp loop
