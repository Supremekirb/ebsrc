
WAIT_DMA_FINISHED: ;$C08F8B
	SEP #PROC_FLAGS::ACCUM8
	LDA UNKNOWN_7E0000
@UNKNOWN0:
	CMP UNKNOWN_7E0001
	BNE @UNKNOWN0
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8
	RTL
