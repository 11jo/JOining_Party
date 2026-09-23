
// All
EXTEND_BOTTOM JO2608AL 0 1 2 3
	IF ~InMyArea("%Death_var%")
		!See("%Death_var%")
		!Dead("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! I need you at my side.~ DO ~
		ActionOverride("%Death_var%",MoveToPointNoInterrupt([%x_cooo%.%y_cooo%]))~ EXIT
	IF ~InMyArea("%Death_var%")
	See("%Death_var%")
	TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! Please do not stand in the way.~ DO ~
	ActionOverride("%Death_var%",RandomWalk())~ EXIT
END

// BG1
EXTEND_BOTTOM JO2608AL 0
	IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffect("JOBG402",[%x_cooo%.%y_cooo%])
		Wait(1)
		MoveGlobal("JO2608","%Death_var%",[%x_cooo%.%y_cooo%])~ GOTO 4
END

// SoD
EXTEND_BOTTOM JO2608AL 1
	IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		!TriggerOverride("%Death_var%",Global("JO_JOIN_END_OF_BG1","LOCALS",0)) // No SoD content
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffect("JOBG402",[%x_cooo%.%y_cooo%])
		Wait(1)
		MoveGlobal("JO2608","%Death_var%",[%x_cooo%.%y_cooo%])~ GOTO 4
END

// BG2 / ToB
EXTEND_BOTTOM JO2608AL 2 3
	IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		!TriggerOverride("%Death_var%",Global("JO_JOIN_END_OF_SOD","LOCALS",0)) // No BG2 content
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffect("JOBG402",[%x_cooo%.%y_cooo%])
		Wait(1)
		MoveGlobal("JO2608","%Death_var%",[%x_cooo%.%y_cooo%])~ GOTO 4
END
