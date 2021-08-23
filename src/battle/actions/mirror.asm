
BTLACT_MIRROR: ;$C2B0A1
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 26
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::id,X
	TAX
	STX $18
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN0
	JMP @UNKNOWN2
@UNKNOWN0:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::npc_id,X
	AND #$00FF
	BEQ @UNKNOWN1
	JMP @UNKNOWN2
@UNKNOWN1:
	LDA #100
	JSR a:.LOWORD(RAND_LIMIT)
	STA $16
	LDX $18
	TXA
	LDY #.SIZEOF(enemy_data)
	JSL MULT168
	CLC
	ADC #enemy_data::mirror_success
	TAX
	LDA f:ENEMY_CONFIGURATION_TABLE,X
	AND #$00FF
	STA $02
	LDA $16
	CMP $02
	BCS @UNKNOWN2
	LDX $18
	STX .LOWORD(MIRROR_ENEMY)
	LDA #DEFAULT_MIRROR_TURN_COUNT
	STA .LOWORD(MIRROR_TURN_TIMER)
	LDA .LOWORD(CURRENT_ATTACKER)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDX #.SIZEOF(battler)
	LDA #.LOWORD(UNKNOWN_7EAA14)
	JSL MEMCPY16
	LDA .LOWORD(CURRENT_ATTACKER)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $0E
	LDA .LOWORD(CURRENT_TARGET)
	STA $06
	PHB
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA $08
	STZ $09
	REP #PROC_FLAGS::ACCUM8
	MOVE_INT $06, $12
	JSL COPY_MIRROR_DATA
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_TURNED_INTO_ENEMY
	BRA @UNKNOWN3
@UNKNOWN2:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_DIDNT_TURN_INTO_ENEMY
@UNKNOWN3:
	PLD
	RTL
