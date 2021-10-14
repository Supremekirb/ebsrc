
BTLACT_HP_SUCKER: ;$C2A46B
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 24
	JSR a:.LOWORD(SUCCESS_LUCK80)
	CMP #$0000
	BEQL @UNKNOWN3
	LDX .LOWORD(CURRENT_ATTACKER)
	LDA a:battler::hp_target,X
	BEQ @UNKNOWN3
	LDA .LOWORD(CURRENT_TARGET)
	CMP .LOWORD(CURRENT_ATTACKER)
	BNE @UNKNOWN1
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_DRAINED_OWN_HP
	BRA @UNKNOWN4
@UNKNOWN1:
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::hp_max,X
	JSR a:.LOWORD(FIFTY_PERCENT_VARIANCE)
	LSR
	LSR
	LSR
	TAY
	STY $16
	TYX
	LDA .LOWORD(CURRENT_TARGET)
	JSR a:.LOWORD(REDUCE_HP)
	LOADPTR TEXT_BATTLE_DRAINED_HP, $0E
	LDY $16
	TYA
	STA $06
	STZ $08
	BPL @UNKNOWN2
	DEC $08
@UNKNOWN2:
	MOVE_INT $06, $12
	JSL DISPLAY_TEXT_WAIT
	LDX .LOWORD(CURRENT_ATTACKER)
	LDY $16
	TYA
	CLC
	ADC a:battler::hp,X
	TAX
	LDA .LOWORD(CURRENT_ATTACKER)
	JSR a:.LOWORD(SET_HP)
	LDX .LOWORD(CURRENT_TARGET)
	LDA a:battler::hp,X
	BNE @UNKNOWN4
	LDA .LOWORD(CURRENT_TARGET)
	JSL KO_TARGET
	BRA @UNKNOWN4
@UNKNOWN3:
	DISPLAY_BATTLE_TEXT_PTR TEXT_BATTLE_IT_DIDNT_WORK_ON_X
@UNKNOWN4:
	PLD
	RTL
