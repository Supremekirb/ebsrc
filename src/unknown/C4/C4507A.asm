
UNKNOWN_C4507A: ;$C4507A
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 40
	MOVE_INT $36, $06
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	CMP #$FFFF
	BNE @UNKNOWN0
	JMP a:.LOWORD(@UNKNOWN5)
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(UNKNOWN_7E5E75)
	STA $00
	STZ .LOWORD(UNKNOWN_7E5E75)
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CURRENT_FOCUS_WINDOW)
	ASL
	TAX
	LDA .LOWORD(WINDOW_EXISTENCE_TABLE),X
	LDY #.SIZEOF(window_stats)
	JSL MULT168
	CLC
	ADC #.LOWORD(WINDOW_STATS_TABLE)
	TAY
	STY $26
	MOVE_INT $06, $0E
	JSL UNKNOWN_C10C55
	STA $02
	STA $24
	LDA #$0007
	SEC
	SBC $02
	CLC
	ADC #$895A
	STA $22
	STA $20
	LDY $26
	LDA a:.LOWORD(RAM)+14,Y
	STA $1E
	LDA a:.LOWORD(RAM)+16,Y
	STA $1C
	LDX #$0004
	LDA .LOWORD(UNKNOWN_7E5E6D)
	AND #$00FF
	STA $02
	LOADPTR FONT_PTR_TABLE, $06
	LDA a:.LOWORD(RAM)+21,Y
	OPTIMIZED_MULT $04, 12
	CLC
	ADC $06
	STA $06
	DEREFERENCE_PTR_TO $06, $06
	TXA
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	CLC
	ADC $02
	STA $04
	LDX #$0000
	STX $1A
	BRA @UNKNOWN2
@UNKNOWN1:
	LDA $22
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	CLC
	ADC #$0060
	LDX $1A
	STA $12,X
	REP #PROC_FLAGS::ACCUM8
	LDA $22
	INC
	STA $22
	INX
	STX $1A
@UNKNOWN2:
	LDA $24
	STA $02
	TXA
	CMP $02
	BCC @UNKNOWN1
	TDC
	CLC
	ADC #$0012
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY $26
	LDA a:.LOWORD(RAM)+21,Y
	TAX
	LDA $02
	JSL UNKNOWN_C44FF3
	PHA
	LDA $04
	PLY
	STY $04
	CLC
	ADC $04
	STA $18
	LDA .LOWORD(UNKNOWN_7E5E6D)
	AND #$00FF
	STA $04
	LDA $18
	CLC
	ADC $04
	STA $18
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0001
	STA .LOWORD(UNKNOWN_7E5E71)
	LDY $26
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM)+16,Y
	TAX
	LDA $18
	STA $04
	LDA a:.LOWORD(RAM)+10,Y
	DEC
	ASL
	ASL
	ASL
	SEC
	SBC $04
	JSL UNKNOWN_C43D75
	LDA #$0054
	JSL REDIRECT_C10CB6
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA ($20)
	AND #$00FF
	CLC
	ADC #$0060
	INC $20
	JSL REDIRECT_C10CB6
	LDA $02
	DEC
	STA $02
@UNKNOWN4:
	LDA $02
	BNE @UNKNOWN3
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E5E71)
	LDY $26
	REP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM)+16,Y
	TAX
	LDA a:.LOWORD(RAM)+10,Y
	DEC
	JSL REDIRECT_C438A5
	LDA #$0024
	JSL UNKNOWN_C43F77
	LDX $1C
	LDA $1E
	JSL REDIRECT_C438A5
	SEP #PROC_FLAGS::ACCUM8
	LDA $00
	STA .LOWORD(UNKNOWN_7E5E75)
@UNKNOWN5:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
