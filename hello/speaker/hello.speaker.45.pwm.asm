;
; hello.speaker.45.pwm.asm
;
; software PWM speaker hello-world program
;
; Neil Gershenfeld MIT CBA 8/2/07
;
; (c) Massachusetts Institute of Technology 2007
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;

.include "tn45def.inc"

.equ mosfet_pin = PB1 ; MOSFET pin
.equ max_pwm = 20 ; maximum PWM on value
.equ pwm_length = 40 ; PWM loop length

.def temp = R16	; temporary storage
.def temp1 = R17 ; temporary storage
.def pwm = R18 ; PWM value
.def pwm_count = R19 ; PWM counter
.def pwm_cycle = R20 ; PWM cycle count
.def pwm_cycle_count = R21 ; number of PWM cycles per audio cycle
.def cycle_count = R22 ; audio cycle count

.cseg
.org 0
rjmp reset

;
; main program
;
reset:	   
   ;
   ; initialization
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
   ; set MOSFET to output
   ;
   cbi PORTB, mosfet_pin
   sbi DDRB, mosfet_pin
   ;
   ; infinite main loop
   ;
   main_loop:
      ldi pwm_cycle_count, 5
      frequency_loop:
         ldi cycle_count, 255
         cycle_count_loop:
            ldi pwm, max_pwm
            cycle_loop:
               mov pwm_cycle, pwm_cycle_count
               pwm_loop:
                  mov pwm_count, pwm
                  sbi PORTB, mosfet_pin
                  pwm_on_loop:
                     dec pwm_count
                     brne pwm_on_loop
                  ldi pwm_count, pwm_length
                  sub pwm_count, pwm
                  cbi PORTB, mosfet_pin
                  pwm_off_loop:
                     dec pwm_count
                     brne pwm_off_loop
                  dec pwm_cycle
                  brne pwm_loop
               dec pwm
               brne cycle_loop
            dec cycle_count
            brne cycle_count_loop
         dec pwm_cycle_count
         brne frequency_loop
      rjmp main_loop

