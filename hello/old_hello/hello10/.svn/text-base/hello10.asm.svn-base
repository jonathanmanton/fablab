;
; hello10.asm
; LED array
; Neil Gershenfeld CBA MIT 11/12/06
; 

.include "tn45def.inc"
.equ txpin = PB2; transmit pin
.def temp = R16; temporary storage
.def temp1 = R17; temporary storage
.def temp2 = R18; temporary storage

.cseg
.org 0
rjmp reset

;
; LED delay
;
led_delay:
   ldi temp, 255
   led_delay_loop:
      ldi temp1, 25
      led_delay_loop_1:
         dec temp1
	 brne led_delay_loop_1
      dec temp
      brne led_delay_loop
   ret
;
; LED fast delay
;
led_fast_delay:
   ldi temp, 200
   led_fast_delay_loop:
      dec temp
      brne led_fast_delay_loop
   ret
;
; main program
;
reset:
   ldi temp, low(RAMEND) ; set stack pointer to top of RAM
   out SPL, temp ;
   ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
   out PORTB, temp ; set all pins to inputs with pull-ups enabled
   clr temp ;
   out DDRB, temp ;
   loop:
      ;
      ; slow scan individual LEDs
      ;
      cbi PORTB, PB2 ; sink on PB2
      ldi temp, ((1 << PB1) | (1 << PB2))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB0) | (1 << PB2))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB4) | (1 << PB2))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB3) | (1 << PB2))
      out DDRB, temp
      rcall led_delay
      sbi PORTB, PB2 ; return PB2 to input with pull-up
      cbi PORTB, PB1 ; sink on PB1
      ldi temp, ((1 << PB2) | (1 << PB1))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB0) | (1 << PB1))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB4) | (1 << PB1))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB3) | (1 << PB1))
      out DDRB, temp
      rcall led_delay
      sbi PORTB, PB1 ; return PB1 to input with pull-up
      cbi PORTB, PB0 ; sink on PB0
      ldi temp, ((1 << PB2) | (1 << PB0))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB1) | (1 << PB0))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB4) | (1 << PB0))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB3) | (1 << PB0))
      out DDRB, temp
      rcall led_delay
      sbi PORTB, PB0 ; return PB0 to input with pull-up
      cbi PORTB, PB4 ; sink on PB4
      ldi temp, ((1 << PB2) | (1 << PB4))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB1) | (1 << PB4))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB0) | (1 << PB4))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB3) | (1 << PB4))
      out DDRB, temp
      rcall led_delay
      sbi PORTB, PB4 ; return PB4 to input with pull-up
      cbi PORTB, PB3 ; sink on PB3
      ldi temp, ((1 << PB2) | (1 << PB3))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB1) | (1 << PB3))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB0) | (1 << PB3))
      out DDRB, temp
      rcall led_delay
      ldi temp, ((1 << PB4) | (1 << PB3))
      out DDRB, temp
      rcall led_delay
      sbi PORTB, PB3 ; return PB3 to input with pull-up
      ;
      ; fast scan LED rows
      ;
      ldi temp2, 100
      multiplex_loop:
         cbi PORTB, PB2 ; sink on PB2
         ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
         out DDRB, temp
         rcall led_fast_delay
         sbi PORTB, PB2 ; return PB2 to input with pull-up
         cbi PORTB, PB1 ; sink on PB1
         ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
         out DDRB, temp
         rcall led_fast_delay
         sbi PORTB, PB1 ; return PB1 to input with pull-up
         cbi PORTB, PB0 ; sink on PB0
         ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
         out DDRB, temp
         rcall led_fast_delay
         sbi PORTB, PB0 ; return PB0 to input with pull-up
         cbi PORTB, PB4 ; sink on PB4
         ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
         out DDRB, temp
         rcall led_fast_delay
         sbi PORTB, PB4 ; return PB4 to input with pull-up
         cbi PORTB, PB3 ; sink on PB3
         ldi temp, ((1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1) | (1 << PB0))
         out DDRB, temp
         rcall led_fast_delay
         sbi PORTB, PB3 ; return PB3 to input with pull-up
         dec temp2
         breq multiplex_continue
            rjmp multiplex_loop
         multiplex_continue:
         rjmp loop
