
UNKNOWN_C04F60: ;$C04F60
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE_CLOBBER 18
	LDA BATTLE_SWIRL_COUNTDOWN
	BNE @UNKNOWN0
	LDA BATTLE_SWIRL_FLAG
	BNE @UNKNOWN0
	LDA CUR_TEXT_PAL
	STA UNKNOWN_7E5D72
	LDA #$001F
	STA CUR_TEXT_PAL
	SEP #PROC_FLAGS::ACCUM8
	STZ TM_MIRROR
	REP #PROC_FLAGS::ACCUM8
	LDA #$0008
	JSL UNKNOWN_C0856B
	LOADPTR UNKNOWN_C04F47, $0E
	LDA #$0001
	JSL SCHEDULE_OVERWORLD_TASK
@UNKNOWN0:
	PLD
	RTS
