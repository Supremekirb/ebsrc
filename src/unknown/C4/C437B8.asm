
UNKNOWN_C437B8: ;$C437B8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 26
	STA $18
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	STA $16
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA .LOWORD(WINDOW_STATS_TABLE)+53,X
	STA $14
	LDA .LOWORD(WINDOW_STATS_TABLE)+10,X
	ASL
	ASL
	STA $02
	LDA $14
	CLC
	ADC $02
	STA $04
	LDA $14
	STA $02
	LDX $02
	STX $12
	TAY
	STY $14
	LDX #$0000
	STX $10
	BRA @UNKNOWN1
@UNKNOWN0:
	LDY $14
	LDA a:.LOWORD(RAM),Y
	INY
	INY
	STY $14
	JSL UNKNOWN_C44AF7
	LDX $10
	INX
	STX $10
@UNKNOWN1:
	LDA $16
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAX
	LDA .LOWORD(WINDOW_STATS_TABLE)+10,X
	ASL
	STA $02
	LDX $10
	TXA
	CMP $02
	BNE @UNKNOWN0
	LDX #$0000
	STX $14
	BRA @UNKNOWN3
@UNKNOWN2:
	LDX $04
	LDA a:.LOWORD(RAM),X
	LDX $12
	STX $02
	STA a:.LOWORD(RAM),X
	INC $04
	INC $04
	INC $02
	INC $02
	LDA $02
	STA $12
	LDX $14
	INX
	STX $14
@UNKNOWN3:
	LDA $16
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	TAY
	LDA .LOWORD(WINDOW_STATS_TABLE)+12,Y
	STA $0E
	LDA .LOWORD(WINDOW_STATS_TABLE)+10,Y
	TAY
	LDA $0E
	DEC
	DEC
	JSL MULT16
	STA $02
	TXA
	CMP $02
	BNE @UNKNOWN2
	LDA $0E
	LSR
	TAX
	DEX
	LDA $18
	JSL UNKNOWN_C436D7
	PLD
	RTL
