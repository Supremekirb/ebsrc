
BTLACT_PARALYSIS_A: ;$C29FFE
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	JSR a:.LOWORD(FAIL_ATTACK_ON_NPCS)
	CMP #$0000
	BNE @UNKNOWN1
	LDX .LOWORD(CURRENT_TARGET)
	SEP #PROC_FLAGS::ACCUM8
	LDA a:battler::paralysis_resist,X
	JSR a:.LOWORD(SUCCESS_255)
	.A16
	CMP #$0000
	BEQ @UNKNOWN0
	LDY #STATUS_0::PARALYZED
	LDX #STATUS_GROUP::PERSISTENT_EASYHEAL
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(INFLICT_STATUS_BATTLE)
	.A16
	CMP #$0000
	BEQ @UNKNOWN0
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_BECAME_NUMB
	BRA @UNKNOWN1
@UNKNOWN0:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_DIDNT_WORK_ON_X
@UNKNOWN1:
	PLD
	RTL
