
MOVEMENT_CODE_1A: ;$C09658
	LDA [$80],Y
	STA $90
	INY
	INY
	TYA
	LDX $8A
	LDY UNKNOWN_7E12E6,X
	STA ($84),Y
	INY
	INY
	TYA
	STA UNKNOWN_7E12E6,X
	LDY $90
	RTS
