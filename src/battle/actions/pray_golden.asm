
BTLACT_PRAY_GOLDEN: ;$C2AC51
	REP #PROC_FLAGS::ACCUM8 | PROC_FLAGS::INDEX8 | PROC_FLAGS::CARRY
	LDX CURRENT_TARGET
	LDA a:battler::hp_max,X
	LDX CURRENT_ATTACKER
	SEC
	SBC a:battler::hp_target,X
	TAX
	LDA CURRENT_TARGET
	JSR RECOVER_HP
	RTL
