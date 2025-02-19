
UNKNOWN_C4F46F: ;$C4F46F
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 36
	STA $22
	LOADPTR PHOTOGRAPHER_CFG_TABLE, $06
	LDA $22
	LDY #.SIZEOF(photographer_config_entry)
	JSL MULT168
	CLC
	ADC $06
	STA $06
	STA $1E
	LDA $08
	STA $20
	LDX #$0100
	SEP #PROC_FLAGS::ACCUM8
	LDY #photographer_config_entry::slide_direction
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	LDY #$0400
	JSL MULT16
	JSL UNKNOWN_C41FFF
	MOVE_INT $06, $0A
	MOVE_INT $0A, $06
	MOVE_INT $06, $0E
	MOVE_INT $1E, $06
	SEP #PROC_FLAGS::ACCUM8
	LDY #photographer_config_entry::slide_distance
	LDA [$06],Y
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	XBA
	AND #$FF00
	LDY #$0100
	JSL DIVISION16
	STA $22
	LDA $10
	STA $1C
	LDA $0E
	STA $1A
	LDA BG1_X_POS
	STA $18
	LDA BG1_Y_POS
	STA $16
	LDA #$0000
	STA $04
	STA $02
	TAY
	STY $14
	BRA @UNKNOWN1
@UNKNOWN0:
	LDA $02
	CLC
	ADC $1C
	STA $02
	LDA $04
	CLC
	ADC $1A
	STA $04
	LDY #$0100
	LDA $02
	JSL DIVISION16
	TAX
	CLC
	ADC $18
	STA BG1_X_POS
	LDY #$0100
	LDA $04
	JSL DIVISION16
	STA $12
	CLC
	ADC $16
	STA BG1_Y_POS
	STX BG2_X_POS
	LDA $12
	STA BG2_Y_POS
	JSL UNKNOWN_C4F01D
	JSL UNKNOWN_C1004E
	LDY $14
	INY
	STY $14
@UNKNOWN1:
	CPY $22
	BCC @UNKNOWN0
	PLD
	RTL
