
UNKNOWN_C45E96: ;$C45E96
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
@UNKNOWN0:
	LDA .LOWORD(DMA_TRANSFER_FLAG)
	BNE @UNKNOWN0
	LDX #$0000
	BRA @UNKNOWN2
@UNKNOWN1:
	SEP #PROC_FLAGS::ACCUM8
	LDA #$00FF
	STA .LOWORD(UNKNOWN_7E9D23),X
	INX
@UNKNOWN2:
	CPX #$0020
	BCC @UNKNOWN1
	REP #PROC_FLAGS::ACCUM8
	STZ .LOWORD(UNKNOWN_7E9E25)
	STZ .LOWORD(UNKNOWN_7E9E23)
	LDX .LOWORD(UNKNOWN_7E9E27)
	INX
	STX .LOWORD(UNKNOWN_7E9E27)
	CPX #$0030
	BCC @UNKNOWN3
	STZ .LOWORD(UNKNOWN_7E9E27)
@UNKNOWN3:
	STZ .LOWORD(UNKNOWN_7E9E29)
	JSL UNKNOWN_C44E44
	RTL
