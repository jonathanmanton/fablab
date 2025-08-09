;
; hello.LCD.44.asm
; 
; LCD hello-world
;
; Neil Gershenfeld
; CBA MIT 11/8/09
;
; (c) Massachusetts Institute of Technology 2009
; Permission granted for experimental and personal use;
; license for commercial sale available from MIT.
;
.include "tn44def.inc"
;
; definitions
;
.equ DB7 = PA0
.equ DB6 = PA1
.equ DB5 = PA2
.equ DB4 = PA3
.equ E = PA4
.equ RS = PA5
;
; registers
;
.def lcdbyte = R16
.def temp = R18
.def temp1 = R19
.def temp2 = R20
.def temp3 = R21
;
; code segment
;		
.cseg
.org 0
rjmp reset
;
; long_delay
; delay before redraw
;
.equ long_delay_time = 100
long_delay:
   ldi temp1, long_delay_time
   long_delay1:
      ldi temp2, long_delay_time
      long_delay2:
         ldi temp3, long_delay_time
         long_delay3:
            dec temp3
            brne long_delay3
         dec temp2
         brne long_delay2
      dec temp1
      brne long_delay1
   ret
;
; lcd_delay
; delay between commands
;
.equ lcd_delay_time = 100
lcd_delay:
   ldi temp1, lcd_delay_time
   lcd_delay1:
      ldi temp2, lcd_delay_time
      lcd_delay2:
         dec temp2
         brne lcd_delay2
      dec temp1
      brne lcd_delay1
   ret
;
; lcd_putchar
; put character in lcdbyte
;
lcd_putchar:
   ;
   ; set RS for data
   ; 
   sbi PORTA, RS
   ;
   ; output high nibble
   ;
   cbi PORTA, DB7
   sbrc lcdbyte, 7
      sbi PORTA, DB7
   cbi PORTA, DB6
   sbrc lcdbyte, 6
      sbi PORTA, DB6
   cbi PORTA, DB5
   sbrc lcdbyte, 5
      sbi PORTA, DB5
   cbi PORTA, DB4
   sbrc lcdbyte, 4
      sbi PORTA, DB4
   ;
   ; strobe E
   ;
   nop
   sbi PORTA, E
   nop
   cbi PORTA, E
   ;
   ; wait
   ;
   rcall lcd_delay ; can be shorter
   ;
   ; output low nibble
   ;
   cbi PORTA, DB7
   sbrc lcdbyte, 3
      sbi PORTA, DB7
   cbi PORTA, DB6
   sbrc lcdbyte, 2
      sbi PORTA, DB6
   cbi PORTA, DB5
   sbrc lcdbyte, 1
      sbi PORTA, DB5
   cbi PORTA, DB4
   sbrc lcdbyte, 0
      sbi PORTA, DB4
   ;
   ; strobe E
   ;
   nop
   sbi PORTA, E
   nop
   cbi PORTA, E
   ;
   ; wait and return
   ;
   rcall lcd_delay ; can be shorter
   ret
;
; lcd_putcmd
; put command in lcdbyte
;
lcd_putcmd:
   ;
   ; clear RS for command
   ; 
   cbi PORTA, RS
   ;
   ; output command bits
   ;
   out PORTA, lcdbyte
   ;
   ; strobe E
   ;
   nop
   sbi PORTA, E
   nop
   cbi PORTA, E
   ;
   ; wait and return
   ;
   rcall lcd_delay
   ret
;
; lcd_init
; initialize the LCD
;
lcd_init:
   ;
   ; power-up delay
   ;
   rcall lcd_delay
   ;
   ; initialization sequence
   ;
   ldi lcdbyte, (1 << DB5) + (1 << DB4)
   rcall lcd_putcmd
   ldi lcdbyte, (1 << DB5) + (1 << DB4)
   rcall lcd_putcmd
   ldi lcdbyte, (1 << DB5) + (1 << DB4)
   rcall lcd_putcmd
   ;
   ; 4-bit interface
   ;
   ldi lcdbyte, (1 << DB5)
   rcall lcd_putcmd
   ;
   ; two lines, 5x7 font
   ;
   ldi lcdbyte, (1 << DB5)
   rcall lcd_putcmd
   ldi lcdbyte, (1 << DB7)
   rcall lcd_putcmd
   ;
   ; display on
   ;
   clr lcdbyte
   rcall lcd_putcmd
   ldi lcdbyte, (1 << DB7) + (1 << DB6) + (1 << DB5)
   rcall lcd_putcmd
   ;
   ; entry mode
   ;
   clr lcdbyte
   rcall lcd_putcmd
   ldi lcdbyte, (1 << DB6) + (1 << DB5)
   rcall lcd_putcmd
   ret
;
; lcd_print
; print a null-terminated string
;
lcd_print:
   lcd_print_loop:
      lpm
      mov lcdbyte, R0
      cpi lcdbyte, 0
         breq return
      rcall lcd_putchar
      adiw zl, 1
      rjmp lcd_print_loop
   return:
      ret
;
; strings to print
;
line_1:
   .db "Hello to",0
line_2:
   .db "the world!",0
;
; reset routine
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
   ; init I/O pins
   ;
   cbi PORTA, DB7
   sbi DDRA, DB7
   cbi PORTA, DB6
   sbi DDRA, DB6
   cbi PORTA, DB5
   sbi DDRA, DB5
   cbi PORTA, DB4
   sbi DDRA, DB4
   cbi PORTA, E
   sbi DDRA, E
   cbi PORTA, RS
   sbi DDRA, RS
   ;
   ; init LCD
   ;
   rcall lcd_init
   ;
   ; main loop
   ;
   main:
      ;
      ; go to zero position
      ;
      clr lcdbyte
      rcall lcd_putcmd
      ldi lcdbyte, (1 << DB5)
      rcall lcd_putcmd
      ;
      ; print first line
      ;
      ldi zl,low(line_1*2)
      ldi zh,high(line_1*2)
      rcall lcd_print
      ;
      ; move to second line
      ;
      ldi lcdbyte, (1 << DB7) + (1 << DB6)
      rcall lcd_putcmd
      clr lcdbyte
      rcall lcd_putcmd
      ;
      ; print second line
      ;
      ldi zl,low(line_2*2)
      ldi zh,high(line_2*2)
      rcall lcd_print
      ;
      ; pause
      ;
      rcall long_delay
      ;
      ; clear display
      ;
      clr lcdbyte
      rcall lcd_putcmd
      ldi lcdbyte, (1 << DB4)
      rcall lcd_putcmd
      ;
      ; repeat
      ;
      rjmp main
