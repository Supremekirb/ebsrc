
BTLACT_PSI_FREEZE_B: ;$C29650
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDA #FREEZE_BETA_DAMAGE
	JSR PSI_FREEZE_COMMON
	RTL
