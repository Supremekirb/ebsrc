
MOVEMENT_CODE_16: ;$C09B2C
	LDX $8A
	LDA .LOWORD(UNKNOWN_30X2_TABLE_23),X
	BNE MOVEMENT_CODE_16_UNKNOWN0
MOVEMENT_CODE_16_ENTRY2:
	LDA [$80],Y
	TAY
	LDA .LOWORD(UNKNOWN_7E12E6),X
	SEC
	SBC #$0003
	STA .LOWORD(UNKNOWN_7E12E6),X
	RTS
MOVEMENT_CODE_16_UNKNOWN0:
	INY
	INY
	RTS
