
UNKNOWN_C0A360: ;$C0A360
	LDX $88
	LDA .LOWORD(UNKNOWN_30X2_TABLE_41),X
	BMI UNKNOWN_C0A37A_1
	LDA .LOWORD(UNKNOWN_30X2_TABLE_25),X
	AND #$00D0
	BEQ @UNKNOWN0
	JMP .LOWORD(MOVEMENT_CODE_39)
@UNKNOWN0:
	LDX $88
	LDA .LOWORD(ENTITY_COLLIDED_OBJECTS),X
	BMI UNKNOWN_C0A37A_1
	RTS
UNKNOWN_C0A37A: ;$C0A37A
	LDX $88
UNKNOWN_C0A37A_1: ;$C0A37A
	JSR a:.LOWORD(UNKNOWN_C09FAE_ENTRY3)
	JSL UNKNOWN_C0C7DB
	RTS
