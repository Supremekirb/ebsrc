
BTLACT_TELEPORT_BOX: ;$C2AB71
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 22
	LDX .LOWORD(GAME_STATE)+game_state::leader_y_coord
	LDA .LOWORD(GAME_STATE)+game_state::leader_x_coord
	JSL LOAD_SECTOR_ATTRS
	AND #$0080
	BNEL @TELEPORT_BOX_UNUSABLE
	LDA .LOWORD(BATTLE_MODE_FLAG)
	BEQ @UNKNOWN1
	LDA #$0064
	JSR a:.LOWORD(RAND_LIMIT)
	STA $14
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action_argument,X
	AND #$00FF
	OPTIMIZED_MULT $04, .SIZEOF(item)
	CLC
	ADC #item::strength
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA f:ITEM_CONFIGURATION_TABLE,X
	REP #PROC_FLAGS::ACCUM8
	SEC
	AND #$00FF
	SBC #$0080
	EOR #$FF80
	STA $02
	LDA $14
	CMP $02
	BCS @TELEPORT_BOX_FAILURE
	JSR a:.LOWORD(BOSS_BATTLE_CHECK)
	CMP #$0000
	BEQ @TELEPORT_BOX_FAILURE
@UNKNOWN1:
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::unknown07,X
	AND #$00FF
	TAX
	STX $12
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::id,X
	LDX $12
	JSL REDIRECT_REMOVE_ITEM_FROM_INVENTORY
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_TELEPORT_BOX_EXPLODED
	SEP #PROC_FLAGS::ACCUM8
	LDA #TELEPORT_STYLE::INSTANT
	STA $0E
	LDA .LOWORD(GAME_STATE) + game_state::unknownC3
	JSL SET_TELEPORT_STATE
	.A16
	LDA #$0001
	STA .LOWORD(UNKNOWN_7EAA0E)
	BRA @RETURN
@TELEPORT_BOX_FAILURE:
	.A16
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_TELEPORT_BOX_FAILED
	BRA @RETURN
@TELEPORT_BOX_UNUSABLE:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_TELEPORT_BOX_CANNOT_BE_USED_HERE
@RETURN:
	PLD
	RTL
