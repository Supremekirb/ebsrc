
UNKNOWN_C05E82: ;$C05E82
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDX CURRENT_ENTITY_SLOT
	STX $10
	TXA
	JSR UNKNOWN_C05E3B
	STA $0E
	CMP #$FF00
	BNE @UNKNOWN0
	LDA #$0000
	BRA @UNKNOWN2
@UNKNOWN0:
	CMP #$0000
	BEQ @UNKNOWN1
	LDA #$0000
	BRA @UNKNOWN2
@UNKNOWN1:
	LDX $10
	TXA
	ASL
	TAY
	CLC
	ADC #.LOWORD(ENTITY_OBSTACLE_FLAGS)
	STA $02
	LDA ENTITY_ENEMY_ID,Y
	TAY
	LDA $0E
	JSL UNKNOWN_C05DE7
	STA $04
	LDX $02
	LDA __BSS_START__,X
	ORA $04
	LDX $02
	STA __BSS_START__,X
@UNKNOWN2:
	PLD
	RTL
