
UNKNOWN_C4958E: ;$C4958E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 34
	STY $20
	STX $1E
	STA $1C
	LOADPTR UNKNOWN_7F0000, $06
	LOADPTR UNKNOWN_7F0200, $0E
	LDX #$1000
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL MEMSET24
	STZ $1A
	JMP a:.LOWORD(@UNKNOWN8)
@UNKNOWN0:
	LDA $1A
	STA $18
	JMP a:.LOWORD(@UNKNOWN4)
@UNKNOWN1:
	.A16
	LDA $1E
	AND #$0001
	BEQ @UNKNOWN2
	LDA $18
	ASL
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	STA $02
	BRA @UNKNOWN3
@UNKNOWN2:
	LDA $18
	ASL
	STA $16
	TAY
	LDA ($20),Y
	STA $02
	LDA $16
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA $02
	STA [$0A]
@UNKNOWN3:
	LDA $18
	ASL
	STA $04
	LDY $04
	LDA ($20),Y
	STA $14
	LDY $1C
	LDA $02
	AND #$001F
	TAX
	LDA $14
	AND #$001F
	JSR a:.LOWORD(UNKNOWN_C491EE)
	.A16
	LDX $04
	STA UNKNOWN_7F0200,X
	LDY $1C
	LDA $02
	AND #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA $14
	AND #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR a:.LOWORD(UNKNOWN_C491EE)
	LDX $04
	STA UNKNOWN_7F0400,X
	LDY $1C
	STY $12
	LDY #$0400
	LDA $02
	AND #$7C00
	JSL DIVISION16S_DIVISOR_POSITIVE
	TAX
	LDY #$0400
	LDA $14
	AND #$7C00
	JSL DIVISION16S_DIVISOR_POSITIVE
	LDY $12
	JSR a:.LOWORD(UNKNOWN_C491EE)
	LDX $04
	STA UNKNOWN_7F0600,X
	INC $18
@UNKNOWN4:
	LDA $1A
	CLC
	ADC #$0010
	CMP $18
	BEQ @UNKNOWN5
	BCC @UNKNOWN5
	JMP a:.LOWORD(@UNKNOWN1)
@UNKNOWN5:
	LDA $1A
	STA $16
	BRA @UNKNOWN7
@UNKNOWN6:
	ASL
	STA $02
	CLC
	ADC $20
	TAX
	STX $14
	LDA a:.LOWORD(RAM),X
	AND #$001F
	XBA
	AND #$FF00
	LDX $02
	STA UNKNOWN_7F0800,X
	LDX $14
	LDA a:.LOWORD(RAM),X
	AND #$03E0
	ASL
	ASL
	ASL
	LDX $02
	STA UNKNOWN_7F0A00,X
	LDX $14
	LDA a:.LOWORD(RAM),X
	AND #$7C00
	LSR
	LSR
	LDX $02
	STA UNKNOWN_7F0C00,X
	LDA $16
	INC
	STA $16
@UNKNOWN7:
	LDA $1A
	CLC
	ADC #$0010
	STA $02
	LDA $16
	CMP $02
	BCC @UNKNOWN6
	LDA $1E
	LSR
	STA $1E
	LDA $02
	STA $1A
@UNKNOWN8:
	LDA $1A
	CMP #$0100
	BCS @UNKNOWN9
	BEQ @UNKNOWN9
	JMP a:.LOWORD(@UNKNOWN0)
@UNKNOWN9:
	PLD
	RTS
