
UNKNOWN_C14049: ;$C14049
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	STACK_RESERVE_VARS
	END_STACK_VARS
	LDX UNKNOWN_7E97B8
	DEX
	STX UNKNOWN_7E97B8
	STX @VIRTUAL02
	LDA #$000A
	CLC
	SBC @VIRTUAL02
	BRANCHGTS @UNKNOWN2
	LDA #$0009
	STA UNKNOWN_7E97B8
@UNKNOWN2:
	PLD
	RTS
