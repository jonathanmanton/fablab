;
; hello.H-bridge.44.asm
;
; H-bridge motor control hello-world
;
; Neil Gershenfeld
; CBA MIT 5/19/07
;
; (c) Massachusetts Institute of Technology 2007
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;
.include "tn44def.inc"
;
; definitions
;
.equ GRP = PA0 ; right PMOSFET gate
.equ GRN = PA1 ; right NMOSFET gate
.equ GLN = PA2 ; left NMOSFET gate
.equ GLP = PA3 ; left PMOSFET gate
.equ step_count = 40 ; number of nested PWM loops
.equ on_count = 1 ; number of PWM on cycles
.equ off_count = 10 ; number of PWM off cycles
;
; registers
;
.def temp = R17; temporary storage
.def temp1 = R18; temporary storage
.def count = R19 ; loop counter
;
; code segment
;
.cseg
.org 0
rjmp reset
;
; gate_delay
; delay between switching H-bridge gates
;
.equ gate_delay_count = 10
gate_delay:
   ldi count, gate_delay_count
   gate_delay_loop:
      dec count
      brne gate_delay_loop
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
   ; init H-bridge pins
   ;
   cbi PORTA, GRP
   sbi DDRA, GRP
   cbi PORTA, GLP
   sbi DDRA, GLP
   sbi PORTA, GRN
   sbi DDRA, GRN
   sbi PORTA, GLN
   sbi DDRA, GLN
   ;
   ; main loop
   ;
   main_loop:
      ;
      ; turn right
      ;
      ldi temp, step_count
      step_right_0:
         ldi temp1, step_count
         step_right_1:
            cbi PORTA, GRN
            rcall gate_delay
            sbi PORTA, GRP
            rcall gate_delay
                 ldi count, on_count
            step_right_on:
               dec count
               brne step_right_on
            cbi PORTA, GRP
            rcall gate_delay
            sbi PORTA, GRN
            rcall gate_delay
                 ldi count, off_count
            step_right_off:
               dec count
               brne step_right_off
            dec temp1
            brne step_right_1
         dec temp
         brne step_right_0
      ;
      ; turn left
      ;
      ldi temp, step_count
      step_left_0:
         ldi temp1, step_count
         step_left_1:
            cbi PORTA, GLN
            rcall gate_delay
            sbi PORTA, GLP
            rcall gate_delay
                 ldi count, on_count
            step_left_on:
               dec count
               brne step_left_on
            cbi PORTA, GLP
            rcall gate_delay
            sbi PORTA, GLN
            rcall gate_delay
                 ldi count, off_count
            step_left_off:
               dec count
               brne step_left_off
            dec temp1
            brne step_left_1
         dec temp
         brne step_left_0
      ;
      ; return to main loop
      ;
      rjmp main_loop
