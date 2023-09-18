
LOAD_COLLISION_ROW: ;$C00CF3
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 20
	TXA
	STA $12
	LSR
	LSR
	AND #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7EF000)
	STA $02
	LDA $12
	AND #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #.LOWORD(UNKNOWN_7EE000)
	TAX
	STX $10
	LDA $12
	AND #$0003
	ASL
	ASL
	STA $04
	LDY #$0000
	STY $0E
	BRA @UNKNOWN1
@UNKNOWN0:
	LDX $02
	LDA __BSS_START__,X
	ASL
	TAX
	LDA f:TILE_COLLISION_BUFFER,X
	STA $12
	INC $02
	INC $02
	LOADPTR MAP_DATA_TILE_COLLISION_ARRANGEMENT_TABLE, $06
	LDA $12
	CLC
	ADC $04
	CLC
	ADC $06
	STA $06
	STA $0A
	LDA $08
	STA $0C
	LDA [$0A]
	LDX $10
	STA __BSS_START__,X
	LDY #$0002
	LDA [$06],Y
	STA __BSS_START__+2,X
	INX
	INX
	INX
	INX
	STX $10
	LDY $0E
	INY
	STY $0E
@UNKNOWN1:
	CPY #$0010
	BCC @UNKNOWN0
	PLD
	RTS
