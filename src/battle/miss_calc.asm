
MISS_CALC: ;$C282F8
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 22
	TAY
	STY $14
	LDX CURRENT_ATTACKER
	LDA __BSS_START__+14,X
	AND #$00FF
	BNEL @UNKNOWN5
	LDX CURRENT_ATTACKER
	LDA __BSS_START__+15,X
	AND #$00FF
	BNEL @UNKNOWN5
	LDX CURRENT_ATTACKER
	LDA __BSS_START__+16,X
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA CHAR_STRUCT+char_struct::equipment+EQUIPMENT_SLOT::WEAPON,X
	AND #$00FF
	BEQ @UNKNOWN2
	DEC
	STA $02
	TXA
	CLC
	ADC #.LOWORD(CHAR_STRUCT) + char_struct::items
	CLC
	ADC $02
	TAX
	LDA __BSS_START__,X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::special
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	TAX
	STX $12
	BRA @UNKNOWN3
@UNKNOWN2:
	LDX #$0001
	STX $12
@UNKNOWN3:
	LDX CURRENT_ATTACKER
	LDA __BSS_START__+31,X
	AND #$00FF
	CMP #$0002
	BEQ @UNKNOWN4
	LDX CURRENT_ATTACKER
	LDA __BSS_START__+29,X
	AND #$00FF
	CMP #$0004
	BNE @UNKNOWN6
@UNKNOWN4:
	LDX $12
	TXA
	CLC
	ADC #$0008
	TAX
	STX $12
	BRA @UNKNOWN6
@UNKNOWN5:
	LDX CURRENT_ATTACKER
	LDA __BSS_START__,X
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::miss_rate
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	AND #$00FF
	TAX
	STX $12
@UNKNOWN6:
	LDX $12
	BEQ @UNKNOWN9
	LDA #$0010
	JSR RAND_LIMIT
	STA $02
	LDX $12
	TXA
	DEC
	CMP $02
	BCC @UNKNOWN9
	LDY $14
	BEQ @UNKNOWN7
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_KARABURI_UTSU
	BRA @UNKNOWN8
@UNKNOWN7:
	DISPLAY_BATTLE_TEXT_PTR MSG_BTL_KARABURI
@UNKNOWN8:
	LDA #$0001
	BRA @UNKNOWN10
@UNKNOWN9:
	LDA #$0000
@UNKNOWN10:
	PLD
	RTS
