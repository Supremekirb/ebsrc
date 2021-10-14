
BTLACT_LVL_2_ATK_DIAMONDIZE: ;$C2916E
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	JSR a:.LOWORD(ATK_FAIL_CHK)
	CMP #$0000
	BNEL @UNKNOWN7
	LDA #$0000
	JSR a:.LOWORD(MISS_CALC)
	CMP #$0000
	BNEL @UNKNOWN7
	JSR a:.LOWORD(SMAAAASH)
	CMP #$0000
	BNEL @UNKNOWN7
	JSR a:.LOWORD(DETERMINE_DODGE)
	CMP #$0000
	BNEL @UNKNOWN6
	JSR a:.LOWORD(BTLACT_LEVEL_2_ATK)
	JSR a:.LOWORD(HEAL_STRANGENESS)
	JSR a:.LOWORD(SUCCESS_LUCK80)
	CMP #$0000
	BEQL @UNKNOWN7
	LDY #STATUS_0::DIAMONDIZED
	LDX #STATUS_GROUP::PERSISTENT_EASYHEAL
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(INFLICT_STATUS_BATTLE)
	CMP #$0000
	BEQL @UNKNOWN7
	SEP #PROC_FLAGS::ACCUM8
	LDA #$0000
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::SHIELD,X
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::HOMESICKNESS,X
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::CONCENTRATION,X
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::STRANGENESS,X
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::TEMPORARY,X
	LDX .LOWORD(CURRENT_TARGET)
	STA a:battler::afflictions + STATUS_GROUP::PERSISTENT_HARDHEAL,X
	REP #PROC_FLAGS::ACCUM8
	LDA .LOWORD(CURRENT_TARGET)
	CLC
	ADC #$003F
	TAY
	MOVE_INT_YPTRSRC a:.LOWORD(RAM), $0A
	MOVE_INT .LOWORD(BATTLE_EXP_SCRATCH), $06
	CLC
	ADD_INT_ASSIGN $06, $0A
	MOVE_INT $06, .LOWORD(BATTLE_EXP_SCRATCH)
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::money,X
	CLC
	ADC .LOWORD(BATTLE_MONEY_SCRATCH)
	STA .LOWORD(BATTLE_MONEY_SCRATCH)
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_WAS_DIAMONDIZED
	BRA @UNKNOWN7
@UNKNOWN6:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_DODGED
@UNKNOWN7:
	PLD
	RTL
