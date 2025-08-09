;
; hello.stepper.44.wave.asm
;
; stepper motor wave step pulse sequence
;
; Neil Gershenfeld
; CBA MIT 11/14/08
;
; (c) Massachusetts Institute of Technology 2008
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;
.include "tn44def.inc"
;
; definitions
;
.equ brown = PA0 ; MOSFET output pins
.equ black = PA1 ; "
.equ yellow = PA2 ; "
.equ orange = PA3 ; "
.equ on_count = 40 ; PWM on count
.equ off_count = 10 ; PWM off count
.equ pulse_count = 200 ; PWM cycles
;
; registers
;
.def temp = R16
.def temp1 = R17
;
; code segment
;
.cseg
.org 0
rjmp reset
;
; yellow PWM pulse
;
pulse_yellow:
   ldi temp, pulse_count
   loop_yellow:
      ldi temp1, on_count
      sbi PORTA, yellow
      on_yellow:
         dec temp1
         brne on_yellow
      ldi temp1, off_count
      cbi PORTA, yellow
      off_yellow:
         dec temp1
         brne off_yellow
      dec temp
      brne loop_yellow
   ret
;
; black PWM pulse
;
pulse_black:
   ldi temp, pulse_count
   loop_black:
      ldi temp1, on_count
      sbi PORTA, black
      on_black:
         dec temp1
         brne on_black
      ldi temp1, off_count
      cbi PORTA, black
      off_black:
         dec temp1
         brne off_black
      dec temp
      brne loop_black
   ret
;
; brown PWM pulse
;
pulse_brown:
   ldi temp, pulse_count
   loop_brown:
      ldi temp1, on_count
      sbi PORTA, brown
      on_brown:
         dec temp1
         brne on_brown
      ldi temp1, off_count
      cbi PORTA, brown
      off_brown:
         dec temp1
         brne off_brown
      dec temp
      brne loop_brown
   ret
;
; orange PWM pulse
;
pulse_orange:
   ldi temp, pulse_count
   loop_orange:
      ldi temp1, on_count
      sbi PORTA, orange
      on_orange:
         dec temp1
         brne on_orange
      ldi temp1, off_count
      cbi PORTA, orange
      off_orange:
         dec temp1
         brne off_orange
      dec temp
      brne loop_orange
   ret
;
; clockwise step
;
step_cw:
   rcall pulse_yellow
   rcall pulse_black
   rcall pulse_orange
   rcall pulse_brown
   ret
;
; counter-clockwise step
;
step_ccw:
   rcall pulse_brown
   rcall pulse_orange
   rcall pulse_black
   rcall pulse_yellow
   ret
;
; main program
;
reset:
   ;
   ; set clock divider to /1
   ;
   ldi temp, (1 << CLKPCE)
   ldi temp1, (0 << CLKPS3) | (0 << CLKPS2) | (0 << CLKPS1) | (0 << CLKPS0)
   out CLKPR, temp
   out CLKPR, temp1
   ;
   ; set stack pointer to top of RAM
   ;
   ldi temp, high(RAMEND)
   out SPH, temp
   ldi temp, low(RAMEND)
   out SPL, temp
   ;
   ; set MOSFET pins
   ;
   cbi PORTA, brown
   sbi DDRA, brown
   cbi PORTA, black
   sbi DDRA, black
   cbi PORTA, yellow
   sbi DDRA, yellow
   cbi PORTA, orange
   sbi DDRA, orange
   ;
   ; main loop
   ;
   loop:
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_cw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rcall step_ccw
      rjmp loop
