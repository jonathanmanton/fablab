;
; hello.array.44.asm
;
; Charlieplex LED array hello-world
;
; Neil Gershenfeld
; CBA MIT 11/16/08
;
; (c) Massachusetts Institute of Technology 2008
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;
.include "tn44def.inc"
;
; definitions
;
.equ A = PA1 ; row 1
.equ B = PA2 ; row 2
.equ C = PA3 ; row 3
.equ D = PA4 ; row 4
.equ E = PA5 ; row 5
;
; registers
;
.def temp0 = R16 ; temporary variable
.def temp1 = R17 ; temporary variable
.def temp2 = R18 ; temporary variable
.def loop_count = R19 ; loop counter
.def delay0 = R20 ; delay for loop 0
.def delay1 = R21 ; delay for loop 1
.def delay2 = R22 ; delay for loop 2
;
; macros
;
.macro on
   ;
   ; source @0, sink @1
   ;
   sbi PORTA, @0
   cbi PORTA, @1
   sbi DDRA, @0
   sbi DDRA, @1
   .endmacro
.macro off
   ;
   ; tri-state @0, @1
   ;
   cbi DDRA, @0
   cbi DDRA, @1
   .endmacro
.macro flash
   ;
   ; flash from @0 to @1
   ;
   on @0,@1
   rcall led_delay
   off @0,@1
   .endmacro
.macro delay
   ;
   ; set delays
   ;
   ldi delay0, @0
   ldi delay1, @1
   ldi delay2, @2
   .endmacro
.macro led_loop
   ;
   ; loop through LEDs
   ;
   ldi loop_count,@0
   led_loop_loop:
      rcall led_cycle
      dec loop_count
      brne led_loop_loop
   .endmacro
;
; code segment
;
.cseg
.org 0
rjmp reset
;
; led_delay
; LED multiplex delay
;
led_delay:
   mov temp0, delay0
   delay_loop0:
      mov temp1, delay1
      delay_loop1:
         mov temp2, delay2
         delay_loop2:
            dec temp2
            brne delay_loop2
         dec temp1
         brne delay_loop1
      dec temp0
      brne delay_loop0
   ret
;
; led_cycle
; cycle through LEDs
;
led_cycle:
   flash B,A
   flash C,A
   flash D,A
   flash E,A
   flash A,B
   flash C,B
   flash D,B
   flash E,B
   flash A,C
   flash B,C
   flash D,C
   flash E,C
   flash A,D
   flash B,D
   flash C,D
   flash E,D
   flash A,E
   flash B,E
   flash C,E
   flash D,E
   ret
;
; main program
;
reset:
   ;
   ; set clock divider to /1
   ;
   ldi temp0, (1 << CLKPCE)
   ldi temp1, (0 << CLKPS3) | (0 << CLKPS2) | (0 << CLKPS1) | (0 << CLKPS0)
   out CLKPR, temp0
   out CLKPR, temp1
   ;
   ; set stack pointer to top of RAM
   ;
   ldi temp0, high(RAMEND)
   out SPH, temp0
   ldi temp0, low(RAMEND)
   out SPL, temp0
   ;
   ; start main loop
   ;
   loop:
      delay 100,100,10
      led_loop 1
      delay 100,100,1
      led_loop 10
      delay 100,10,1
      led_loop 100
      rjmp loop
