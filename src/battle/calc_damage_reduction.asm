
CALC_RESIST_DAMAGE: ;$C28125
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 18
	TXY
	STA $02
	LDA #$0000
	CLC
	SBC $02
	BRANCHLTEQS @UNKNOWN2
	LDA #$0000
	STA $02
@UNKNOWN2:
	CPY #$00FF
	BCS @UNKNOWN3
	LDX $02
	TYA
	SEP #PROC_FLAGS::ACCUM8
	JSR a:.LOWORD(TRUNCATE_16_TO_8)
	STA $02
@UNKNOWN3:
	.A16
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::consciousness,X
	AND #$00FF
	CMP #$0001
	BEQ @UNKNOWN4
	JMP @UNKNOWN20
@UNKNOWN4:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::afflictions + STATUS_GROUP::PERSISTENT_EASYHEAL,X
	AND #$00FF
	CMP #STATUS_0::UNCONSCIOUS
	BNE @UNKNOWN5
	JMP @UNKNOWN20
@UNKNOWN5:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::guarding,X
	AND #$00FF
	CMP #$0001
	BNE @UNKNOWN6
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action,X
	JSR a:.LOWORD(GET_BATTLE_ACTION_TYPE)
	CMP #ACTION_TYPE::PHYSICAL
	BNE @UNKNOWN6
	SEP #PROC_FLAGS::INDEX8
	LDY #$0001
	LDA $02
	JSL ASR16
	STA $02
@UNKNOWN6:
	REP #PROC_FLAGS::INDEX8
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::current_action,X
	JSR a:.LOWORD(GET_BATTLE_ACTION_TYPE)
	CMP #ACTION_TYPE::PHYSICAL
	BNE @UNKNOWN9
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::afflictions + STATUS_GROUP::SHIELD,X
	AND #$00FF
	CMP #STATUS_6::SHIELD_POWER
	BEQ @UNKNOWN8
	CMP #STATUS_6::SHIELD
	BNE @UNKNOWN9
@UNKNOWN8:
	SEP #PROC_FLAGS::INDEX8
	LDY #$0001
	LDA $02
	JSL ASR16
	STA $02
@UNKNOWN9:
	LDA $02
	BNE @UNKNOWN10
	LDA #$0001
	STA $02
@UNKNOWN10:
	REP #PROC_FLAGS::INDEX8
	LDX $02
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(CALC_DAMAGE)
	CMP #$0000
	BEQ @UNKNOWN11
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::hp,X
	BNE @UNKNOWN11
	LDA .LOWORD(CURRENT_TARGET)
	JSL KO_TARGET
@UNKNOWN11:
	LDA $02
	BNE @UNKNOWN12
	LDA #$0001
	STA $02
@UNKNOWN12:
	LDA .LOWORD(UNKNOWN_7EAA94)
	BEQ @UNKNOWN13
	JMP @SHIELDS_DONE
@UNKNOWN13:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::afflictions + STATUS_GROUP::SHIELD,X
	AND #$00FF
	CMP #STATUS_6::SHIELD_POWER
	BEQ @UNKNOWN14
	CMP #STATUS_6::SHIELD
	BEQ @WEAKEN_SHIELD
	BRA @SHIELDS_DONE
@UNKNOWN14:
	LDA .LOWORD(UNKNOWN_7EAA90)
	BNE @WEAKEN_SHIELD
	SEP #PROC_FLAGS::INDEX8
	LDY #$0001
	LDA $02
	JSL ASR16
	STA $02
	CMP #$0000
	BNE @DAMAGE_ABOVE_ZERO_AFTER_SHIELD
	LDA #$0001
	STA $02
@DAMAGE_ABOVE_ZERO_AFTER_SHIELD:
	.A16
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_POWER_SHIELD_DEFLECTED
	JSR a:.LOWORD(SWAP_ATTACKER_WITH_TARGET)
	LDX $02
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(CALC_DAMAGE)
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::hp,X
	BNE @STILL_HAS_HP_AFTER_REFLECT
	LDA .LOWORD(CURRENT_TARGET)
	JSL KO_TARGET
@STILL_HAS_HP_AFTER_REFLECT:
	JSR a:.LOWORD(SWAP_ATTACKER_WITH_TARGET)
@WEAKEN_SHIELD:
	LDA .LOWORD(CURRENT_TARGET)
	CLC
	ADC #battler::shield_hp
	TAX
	SEP #PROC_FLAGS::ACCUM8
	LDA a:.LOWORD(RAM),X
	DEC
	STA a:.LOWORD(RAM),X
	REP #PROC_FLAGS::ACCUM8
	AND #$00FF
	BNE @SHIELDS_DONE
	LDX .LOWORD(CURRENT_TARGET)
	SEP #PROC_FLAGS::ACCUM8
	STZ a:battler::afflictions + STATUS_GROUP::SHIELD,X
	REP #PROC_FLAGS::ACCUM8
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_SHIELD_DISAPPEARED
@SHIELDS_DONE:
	.I16
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::ally_or_enemy,X
	AND #$00FF
	BNE @UNKNOWN19
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::npc_id,X
	AND #$00FF
	BNE @UNKNOWN19
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::row,X
	AND #$00FF
	LDY #.SIZEOF(char_struct)
	JSL MULT168
	TAX
	LDA .LOWORD(CHAR_STRUCT)+char_struct::current_hp,X
	BEQ @UNKNOWN20
@UNKNOWN19:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::afflictions + STATUS_GROUP::TEMPORARY,X
	AND #$00FF
	CMP #STATUS_2::ASLEEP
	BNE @UNKNOWN20
	SEP #PROC_FLAGS::ACCUM8
	LDA #CHANCE_OF_WAKING_UP_WHEN_ATTACKED
	JSR a:.LOWORD(SUCCESS_255)
	.A16
	CMP #$0000
	BEQ @UNKNOWN20
	LDX .LOWORD(CURRENT_TARGET)
	STZ a:battler::current_action,X
	LDX .LOWORD(CURRENT_TARGET)
	SEP #PROC_FLAGS::ACCUM8
	STZ a:battler::afflictions + STATUS_GROUP::TEMPORARY,X
	REP #PROC_FLAGS::ACCUM8
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_WOKE_UP
@UNKNOWN20:
	LDA $02
	PLD
	RTS
