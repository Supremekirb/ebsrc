
DIVISION8: ;$C090CE
	PHA
	STY TEMP_DIVIDEND
	EOR TEMP_DIVIDEND
	STA TEMP_DIVIDEND
	PLA
	JSL DIVISION8S
	.A8
	ROL TEMP_DIVIDEND
	BCC @UNKNOWN0
	EOR #$00FF
	INC
@UNKNOWN0:
	RTL
