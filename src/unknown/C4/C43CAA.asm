
UNKNOWN_C43CAA: ;$C43CAA
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA .LOWORD(UNKNOWN_7E9E25)
	INC
	STA .LOWORD(UNKNOWN_7E9E25)
	CMP #$0033
	BLTEQ @UNKNOWN0
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	BRA @UNKNOWN1
@UNKNOWN0:
	ASL
	ASL
	ASL
	STA .LOWORD(UNKNOWN_7E9E23)
@UNKNOWN1:
	STZ .LOWORD(UNKNOWN_7E9654)
	LDA .LOWORD(UNKNOWN_7E9E23)
	STA .LOWORD(UNKNOWN_7E9652)
	RTL
