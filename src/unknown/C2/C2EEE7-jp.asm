
UNKNOWN_C2EEE7: ;$C2EEE7
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 30
	STZ .LOWORD(UNKNOWN_7EAAB4)
	STZ .LOWORD(UNKNOWN_7EAAB2)
	LOADPTR BTL_ENTRY_PTR_TABLE, $0A
	LDA .LOWORD(CURRENT_BATTLE_GROUP)
	ASL
	ASL
	ASL
	CLC
	ADC $0A
	STA $0A
	DEREFERENCE_PTR_TO $0A, $06
	MOVE_INT $06, $1A
	JMP @UNKNOWN1
@UNKNOWN0:
	LOADPTR ENEMY_CONFIGURATION_TABLE, $06
	MOVE_INT $06, $16
	MOVE_INT $1A, $0A
	INC $0A
	LDA [$0A]
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	STA $14
	CLC
	ADC #enemy_data::battle_sprite
	CLC
	ADC $06
	STA $06
	LDA [$06]
	TAY
	STY $12
	LDA $14
	CLC
	ADC #enemy_data::battle_sprite_palette
	MOVE_INTX $16, $06
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	PHA
	LOADPTR BATTLE_SPRITE_PALETTES, $06
	PLA
	CLC
	ADC $06
	STA $06
	STA $0E
	LDA $08
	STA $10
	LDX #$0020
	LDA .LOWORD(UNKNOWN_7EAAB4)
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC #$0200
	CLC
	ADC #$0100
	JSL MEMCPY16
	LDA .LOWORD(UNKNOWN_7EAAB4)
	ASL
	TAX
	LDA [$0A]
	STA .LOWORD(UNKNOWN_7EAABE),X
	LDY $12
	TYA
	JSR a:.LOWORD(UNKNOWN_C2EAEA)
	MOVE_INT $1A, $06
	LDA #$0003
	CLC
	ADC $06
	STA $06
	STA $1A
	LDA $08
	STA $1C
@UNKNOWN1:
	LDY #$0000
	LDA [$1A],Y
	AND #$00FF
	TAX
	CPX #$00FF
	BEQ @UNKNOWN2
	JMP @UNKNOWN0
@UNKNOWN2:
	LDA .LOWORD(UNKNOWN_7EAAB2)
	CMP #$0010
	BCC @UNKNOWN3
	BEQ @UNKNOWN3
	LDX #$3000
	BRA @UNKNOWN4
@UNKNOWN3:
	LDX #$2000
@UNKNOWN4:
	LOADPTR UNKNOWN_7F0000, $0E
	LDY #$2000
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	JSL PREPARE_VRAM_COPY
	PLD
	RTL
