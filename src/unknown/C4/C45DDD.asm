
UNKNOWN_C45DDD: ;$C45DDD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TAX
	DEC
	STA $14
	LDA UNKNOWN_7E9E27
	DEC
	STA $12
@UNKNOWN0:
	INC $14
	LDA $14
	CMP #$0007
	BLTEQ @UNKNOWN1
	STZ $14
@UNKNOWN1:
	INC $12
	LDA $12
	CMP #$0030
	BCC @UNKNOWN2
	STZ $12
@UNKNOWN2:
	LDA $12
	AND #$000F
	ASL
	ASL
	ASL
	STA $02
	LDA $12
	AND #$00F0
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $02
	CLC
	ADC #$7900
	STA $04
	LDA $14
	ASL
	ASL
	ASL
	ASL
	ASL
	STA $02
	CLC
	ADC #.LOWORD(UNKNOWN_7E9D23)
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDY $04
	LDX #$0010
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	.A16
	LDA $02
	CLC
	ADC #.LOWORD(UNKNOWN_7E9D23) + 16
	PROMOTENEARPTRA $06
	REP #PROC_FLAGS::ACCUM8
	COPY_TO_VRAM1OFFSET $06, $04, $10, $0080, $00
	.A16
	LDA UNKNOWN_7E9E25
	CMP $14
	BNEL @UNKNOWN0
	LDA $12
	STA UNKNOWN_7E9E27
	LDA #$0001
	STA DMA_TRANSFER_FLAG
	PLD
	RTL
