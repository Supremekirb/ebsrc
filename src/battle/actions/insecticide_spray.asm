
BTLACT_INSECTICIDE_SPRAY: ;$C2AA0C
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #$0064
	JSR INSECT_SPRAY_COMMON
	RTL
