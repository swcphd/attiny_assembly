.global main ; this is necessary because we're using avr-gcc (GNU C Compiler)
main:
	; define conventional names for some IO registers
	.equ	PORTB, 0x18 ; memory address 0x18 corresponds to Port B, AKA "PB1" (there are PB0, PB1, PB2, PB3...)
 	.equ	DDRB, 0x17 ; memory address 0x17 is for DDRB -- the "data direction register" 
	ldi r16, 0b00000010 ; load-immediately a byte which has bit 1 turned on, into our general use register, r16
	out DDRB, r16 ; push the byte from register 16 into register DDRB, which sets input/output mode of the pins in portB. This will set pin 1 into output mode.
	out PORTB, r16 ; push the byte from register 16 to PORTB, which set the pin state

loop: ; a label. we'll jump back here to run an infinite loop.
    out PORTB, r16 ; push this byte into the PORTB register which determines the high/low state of the output pin. 
    rjmp loop ; jump relative to this position, back to loop