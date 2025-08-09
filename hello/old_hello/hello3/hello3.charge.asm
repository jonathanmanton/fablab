;
; hello3.charge.asm
; Neil Gershenfeld CBA MIT 10/29/05
;
; definitions
;
.include "tn13def.inc"
.equ chargepin  = PB1 ; charging pin
.equ txpin = PB4 ; serial transmit pin
.def bitcnt = R16 ; bit counter
.def temp = R17	; temporary storage
.def temp1 = R18 ; temporary storage
.def txbyte = R19 ; data byte
;
; start of code
;
.cseg
.org 0
rjmp reset ; jump to reset routine
;
; putchar routine
; assumes no line driver (doesn't invert bits)
;
.equ sb = 1 ;  number of stop bits
putchar:
   ldi bitcnt, 9+sb ; 1+8+sb
   com txbyte ; invert everything
   sec ; set start bit
   putchar0:
      brcc putchar1 ; if carry set
      sbi PORTB, txpin ; send a '0'
      rjmp  putchar2 ; else	
   putchar1:
      cbi PORTB, txpin ; send a '1'
      nop
   putchar2:
      rcall bitdelay ; one bit delay
      rcall  bitdelay
      lsr txbyte ; get next bit
      dec bitcnt ; if not all bits sent
      brne putchar0 ; send next
   ret ; else return
;
; serial bit delay routine
; for 1 MHz clock: 9600 bps - b=14, 19200 bps - b=5, 28800 bps - b=2
;
.equ b = 16
bitdelay:
   ldi temp, b
   bitloop: dec temp
   brne bitloop
   ret
;
; routine to wait for sample to settle
;
.equ delay = 10
settle:
   ldi temp1, delay
   sloop1:
      ldi temp, delay
      sloop0:
         dec temp
         brne sloop0
      dec temp1
      brne sloop1
   ret
;
; main program
;
reset:	   
   ;
   ; init output pins
   ;
   sbi PORTB, txpin ; comm
   sbi DDRB, txpin ; "
   sbi PORTB, chargepin ; charging
   sbi DDRB, chargepin ; "
   ;
   ; init A/D
   ;
   cbi ADMUX, REFS0 ; use Vcc as reference
   cbi ADMUX, ADLAR ; right-adjust result
   sbi ADCSRA, ADEN ; enable A/D
   cbi ADCSRA, ADATE ; disable auto-trigger
   cbi ADCSRA, ADPS2 ; set prescaler for /2
   cbi ADCSRA, ADPS1 ; "
   cbi ADCSRA, ADPS0 ; "
   cbi ADMUX, MUX1 ; input on ADC1
   sbi ADMUX, MUX0 ; "
   ;
   ; infinite main loop
   ;
   loop:
      ;
      ; settle sample and start upward step response
      ;
      cbi PORTB, chargepin
      rcall settle
      sbi PORTB, chargepin
      ;
      ; wait for no delay
      ;
      ;
      ; read response
      ;
      sbi ADCSRA, ADSC ; start conversion
      adloop1up:
         sbic ADCSRA, ADSC ; loop until complete
         rjmp adloop1up
      ;
      ; send conversion
      ;
      in txbyte, ADCL ; send low byte
      rcall putchar
      in txbyte,ADCH ; send high byte
      rcall putchar
      ;
      ; settle sample and start downward step response
      ;
      cbi PORTB, chargepin
      ;
      ; wait for no delay
      ;
      ;
      ; read response
      ;
      sbi ADCSRA, ADSC ; start conversion
      adloop1down:
         sbic ADCSRA, ADSC ; loop until complete
         rjmp adloop1down
      ;
      ; send conversion
      ;
      in txbyte, ADCL ; send low byte
      rcall putchar
      in txbyte,ADCH ; send high byte
      rcall putchar
      ;
      ; settle sample and start upward step response
      ;
      cbi PORTB, chargepin
      rcall settle
      sbi PORTB, chargepin
      ;
      ; wait for 3 delay
      ;
      nop
      nop
      nop
      ;
      ; read response
      ;
      sbi ADCSRA, ADSC ; start conversion
      adloop3up:
         sbic ADCSRA, ADSC ; loop until complete
         rjmp adloop3up
      ;
      ; send conversion
      ;
      in txbyte, ADCL ; send low byte
      rcall putchar
      in txbyte,ADCH ; send high byte
      rcall putchar
      ;
      ; settle sample and start downward step response
      ;
      cbi PORTB, chargepin
      ;
      ; wait for 3 delay
      ;
      nop
      nop
      nop
      ;
      ; read response
      ;
      sbi ADCSRA, ADSC ; start conversion
      adloop3down:
         sbic ADCSRA, ADSC ; loop until complete
         rjmp adloop3down
      ;
      ; send conversion
      ;
      in txbyte, ADCL ; send low byte
      rcall putchar
      in txbyte,ADCH ; send high byte
      rcall putchar
      ;
      ; send 1 2 3 4 for framing
      ;
      ldi txbyte, 1
      rcall putchar
      ldi txbyte, 2
      rcall putchar
      ldi txbyte, 3
      rcall putchar
      ldi txbyte, 4
      rcall putchar
      rjmp loop
