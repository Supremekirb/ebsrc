
UNKNOWN_EFDABD: ;$EFDABD
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	STX $14
	STA $04
	MOVE_INT $24, $06
	LDA #$0000
	STA $02
	LDA #$0040
	JSL SBRK
	TAY
	TYX
	BRA @UNKNOWN1
@UNKNOWN0:
	AND #$00FF
	CLC
	ADC #$2000
	STA __BSS_START__,X
	INC $06
	INX
	INX
	INC $02
	INC $02
@UNKNOWN1:
	LDA [$06]
	AND #$00FF
	BNE @UNKNOWN0
	LDA $14
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC $04
	CLC
	ADC #$7C00
	STA $12
	LDA #$007E
	STA $0E
	LDA $12
	STA $10
	LDX $02
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY_ENTRY_B
	PLD
	RTS
