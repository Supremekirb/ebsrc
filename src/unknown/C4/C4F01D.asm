
UNKNOWN_C4F01D: ;$C4F01D
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LDA UNKNOWN_7EB4F5
	CMP UNKNOWN_7EB4F3
	BEQ @RETURN
	LDA UNKNOWN_7EB4F3
	OPTIMIZED_MULT $04, 9
	CLC
	ADC #.LOWORD(PLAYER_POSITION_BUFFER)
	STA $14
	TAY
	INY
	INY
	INY
	MOVE_INT_YPTRSRC __BSS_START__, $06
	MOVE_INT $06, $0E
	LDA $14
	TAX
	LDY __BSS_START__+7,X
	TAX
	LDA __BSS_START__+1,X
	TAX
	STX $12
	LDA $14
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA __BSS_START__,X
	LDX $12
	JSL PREPARE_VRAM_COPY
	.A16
	LDA UNKNOWN_7EB4F3
	INC
	STA UNKNOWN_7EB4F3
	AND #$007F
	STA UNKNOWN_7EB4F3
@RETURN:
	PLD
	RTL
