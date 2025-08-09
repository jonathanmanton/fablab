;
; hello.RGB.45.asm
;
; RGB LED PWM hello-world
;
; Neil Gershenfeld
; CBA MIT 11/6/09
;
; (c) Massachusetts Institute of Technology 2009
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;

.include "tn45def.inc"
;
; definitions
;
.equ red = PB0; red pin
.equ green = PB1; green pin
.equ blue = PB2; blue pin
;
; registers
;
.def temp = R16; temporary storage
.def temp1 = R17; temporary storage
.def count = R17; loop counter
.def pwm = R18; PWM counter
;
; code segment
;
.cseg
.org 0
rjmp reset
;
; main program
;
reset:
   ;
   ; set clock divider to /8
   ;
   ;ldi temp, (1 << CLKPCE)
   ;ldi temp1, (0 << CLKPS3) | (0 << CLKPS2) | (1 << CLKPS1) | (1 << CLKPS0)
   ;out CLKPR, temp
   ;out CLKPR, temp1
   ;
   ; set stack pointer to top of RAM
   ;
   ldi temp, high(RAMEND)
   out SPH, temp
   ldi temp, low(RAMEND)
   out SPL, temp
   ;
   ; init LED pins for output
   ;
   sbi PORTB, red
   sbi DDRB, red
   sbi PORTB, green
   sbi DDRB, green
   sbi PORTB, blue
   sbi DDRB, blue
   ;
   ; main loop
   ;
   main_loop:
      ldi count, 255
      off_red_loop:
         mov pwm, count
         sbi PORTB, red
         off_red_loop_off:
            dec pwm
            brne off_red_loop_off
         mov pwm, count
         cbi PORTB, red
         off_red_loop_on:
            inc pwm
            brne off_red_loop_on
         dec count
         brne off_red_loop
      ldi count, 255
      red_green_loop:
         mov pwm, count
         cbi PORTB, red
         sbi PORTB, green
         red_green_loop_off:
            dec pwm
            brne red_green_loop_off
         mov pwm, count
         sbi PORTB, red
         cbi PORTB, green
         red_green_loop_on:
            inc pwm
            brne red_green_loop_on
         dec count
	      brne red_green_loop
      green_blue_loop:
         mov pwm, count
         cbi PORTB, green
         sbi PORTB, blue
         green_blue_loop_off:
            dec pwm
            brne green_blue_loop_off
         mov pwm, count
         sbi PORTB, green
         cbi PORTB, blue
         green_blue_loop_on:
            inc pwm
            brne green_blue_loop_on
         dec count
         brne green_blue_loop
      blue_on_loop:
         mov pwm, count
         sbi PORTB, red
         sbi PORTB, green
         blue_on_loop_off:
            dec pwm
            brne blue_on_loop_off
         mov pwm, count
         cbi PORTB, red
         cbi PORTB, green
         blue_on_loop_on:
            inc pwm
            brne blue_on_loop_on
         dec count
         brne blue_on_loop
      on_off_loop:
         mov pwm, count
         cbi PORTB, red
         cbi PORTB, green
         cbi PORTB, blue
         on_off_loop_off:
            dec pwm
            brne on_off_loop_off
         mov pwm, count
         sbi PORTB, red
         sbi PORTB, green
         sbi PORTB, blue
         on_off_loop_on:
            inc pwm
            brne on_off_loop_on
         dec count
         brne on_off_loop
      rjmp main_loop
