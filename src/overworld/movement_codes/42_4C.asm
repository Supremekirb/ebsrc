
MOVEMENT_CODE_42_4C: ;$C0993D
	LDA [$80],Y
	STA .LOWORD(MOVEMENT_42_LOADED_PTR)
	INY
	INY
	LDA [$80],Y
	INY
	STA .LOWORD(MOVEMENT_42_LOADED_PTR)+2
	STY $94
	LDX $8A
	LDA .LOWORD(UNKNOWN_30X2_TABLE_23),X
	JSL JUMP_TO_LOADED_MOVEMENT_PTR
	LDX $8A
	STA .LOWORD(UNKNOWN_30X2_TABLE_23),X
	LDY $94
	RTS
