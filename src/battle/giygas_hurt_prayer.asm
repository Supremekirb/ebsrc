
GIYGAS_HURT_PRAYER: ;$C2C3E2
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAX
	STX $0E
	LDA #1*SECOND
	JSR WAIT
	LDA #.LOWORD(BATTLERS_TABLE) + (.SIZEOF(battler) * 8)
	STA CURRENT_TARGET
	JSL FIX_TARGET_NAME
	LDA #1*SECOND
	STA GREEN_FLASH_DURATION
	LDA #$0001
	STA UNKNOWN_7EAA8E
	LDX $0E
	TXA
	JSR TWENTY_FIVE_PERCENT_VARIANCE
	LDX #$00FF
	JSR CALC_RESIST_DAMAGE
	LDA #1*SECOND
	JSR WAIT
	PLD
	RTS
