
MULT168: ;$C08FF7
	REP #PROC_FLAGS::INDEX8
	XBA
	BEQ @UNKNOWN0
	SEP #PROC_FLAGS::ACCUM8
	XBA
	PHA
	TYA
	REP #PROC_FLAGS::ACCUM8
	STA f:WRMPYA
	NOP
	NOP
	LDA f:RDMPYL
	TAY
	SEP #PROC_FLAGS::ACCUM8
	PLA
	STA f:WRMPYB
	REP #PROC_FLAGS::ACCUM8
	TYA
	XBA
	AND #$FF00
	CLC
	ADC f:RDMPYL
	RTL
@UNKNOWN0:
	SEP #PROC_FLAGS::ACCUM8
	TYA
	REP #PROC_FLAGS::ACCUM8
	STA f:WRMPYA
	NOP
	NOP
	LDA f:RDMPYL
	RTL
