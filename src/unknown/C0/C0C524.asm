
UNKNOWN_C0C524: ;$C0C524
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 20
	LDA .LOWORD(CURRENT_ENTITY_SLOT)
	ASL
	TAX
	LDA .LOWORD(ENTITY_TPT_ENTRIES),X
	AND #$7FFF
	STA $12
	LOADPTR BTL_ENTRY_PTR_TABLE, $06
	LDA $12
	ASL
	ASL
	ASL
	TAX
	STX $10
	TXA
	INC
	INC
	INC
	INC
	MOVE_INTX $06, $0A
	CLC
	ADC $0A
	STA $0A
	LDA [$0A]
	BEQ @UNKNOWN0
	JSL GET_EVENT_FLAG
	STA $0E
	LDX $10
	TXA
	CLC
	ADC #$0006
	CLC
	ADC $06
	STA $06
	LDA [$06]
	AND #$00FF
	STA $02
	LDA $0E
	CMP $02
	BNE @UNKNOWN0
	LDA #$0001
	JMP @UNKNOWN4
@UNKNOWN0:
	JSL UNKNOWN_C0546B
	TAY
	STY $0E
	LDA .LOWORD(CURRENT_ENTITY_SLOT)
	ASL
	TAX
	STX $12
	LDA .LOWORD(ENTITY_ENEMY_ID),X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::level
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	AND #$00FF
	STA $10
	STA $04
	ASL
	ASL
	ADC $04
	ASL
	STA $02
	LDY $0E
	TYA
	CMP $02
	BLTEQ @UNKNOWN1
	LDA #$0001
	BRA @UNKNOWN4
@UNKNOWN1:
	LDA $10
	ASL
	ASL
	ASL
	STA $02
	TYA
	CMP $02
	BLTEQ @UNKNOWN2
	LDX $12
	LDA .LOWORD(UNKNOWN_7E3186),X
	CMP #$00C0
	BCS @UNKNOWN2
	LDA #$0001
	BRA @UNKNOWN4
@UNKNOWN2:
	LDA $10
	STA $04
	ASL
	ADC $04
	ASL
	STA $02
	TYA
	CMP $02
	BLTEQ @UNKNOWN3
	LDA .LOWORD(CURRENT_ENTITY_SLOT)
	ASL
	TAX
	LDA .LOWORD(UNKNOWN_7E3186),X
	CMP #$0080
	BCS @UNKNOWN3
	LDA #$0001
	BRA @UNKNOWN4
@UNKNOWN3:
	LDA #$0000
@UNKNOWN4:
	PLD
	RTL
