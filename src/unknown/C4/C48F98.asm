
UNKNOWN_C48F98: ;$C48F98
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	RESERVE_STACK_SPACE 16
	TAX
	STX $0E
	TXA
	JSL UNKNOWN_C48ECE
	CMP #$0000
	BEQ @UNKNOWN0
	DEC .LOWORD(UNKNOWN_7E9F2A)
	LDX $0E
	TXA
	ASL
	ASL
	TAX
	SEP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9F1A+1),X
	STZ .LOWORD(UNKNOWN_7E9F1D),X
@UNKNOWN0:
	REP #PROC_FLAGS::ACCUM8
	PLD
	RTL
