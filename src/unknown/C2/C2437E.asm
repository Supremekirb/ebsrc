
UNKNOWN_C2437E: ;$C2437E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNEL @UNKNOWN3
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::npc_id,X
	AND #$00FF
	BNEL @UNKNOWN3
	LDX .LOWORD(CURRENT_ATTACKER)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM)+7,X
	STA $00
	REP #PROC_FLAGS::ACCUM8
	LDA $00
	AND #$00FF
	BEQL @UNKNOWN3
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:.LOWORD(RAM),X
	TAY
	STY $10
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action_argument,X
	AND #$00FF
	STA $0E
	STA $02
	LDA $00
	AND #$00FF
	DEC
	STA $04
	TYA
	DEC
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	CLC
	ADC #.LOWORD(CHAR_STRUCT)+char_struct::items
	CLC
	ADC $04
	TAX
	LDA a:.LOWORD(RAM),X
	AND #$00FF
	CMP $02
	BNE @UNKNOWN3
	LDA $0E
	LDY #.SIZEOF(item)
	JSL MULT168
	CLC
	ADC #item::flags
	TAX
	LDA f:ITEM_CONFIGURATION_TABLE,X
	AND #$00FF
	AND #ITEM_FLAGS::CONSUMED_ON_USE
	BEQ @UNKNOWN3
	LDA $0E
	TAX
	LDY $10
	TYA
	JSL UNKNOWN_C3EE14
	CMP #$0000
	BEQ @UNKNOWN3
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:.LOWORD(RAM)+7,X
	AND #$00FF
	TAX
	STX $0E
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:.LOWORD(RAM),X
	LDX $0E
	JSL REDIRECT_REMOVE_ITEM_FROM_INVENTORY
@UNKNOWN3:
	PLD
	RTL
