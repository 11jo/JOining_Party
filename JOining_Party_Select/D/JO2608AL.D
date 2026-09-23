BEGIN ~JO2608AL~

IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",1)~ THEN JO2608AL0
	SAY ~Hello !~
		IF ~~ THEN REPLY ~Hello !~ EXIT

		IF ~~ THEN REPLY ~Can you gather our allies here ?~ DO ~SetGlobal("JO_JOIN_GATHER_JO2608","MYAREA",1)~ GOTO Of_Course
/*
		IF ~InMyArea("%Death_var%")
		!Dead("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! I need you at my side.~ DO ~
		ActionOverride("%Death_var%",MoveToObject("JO2608AL"))~ EXIT
*/
/*
		IF ~InMyArea("%Death_var%")
		See("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! Please do not stand in the way.~ DO ~
		ActionOverride("%Death_var%",RandomWalk())~ EXIT
*/
/*
		IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffectObject("JOBG402","JO2608AL")
		MoveGlobalObject(("%Death_var%","JO2608AL")~ GOTO Of_Course
*/
END

IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",2)~ THEN JO2608AL1
	SAY ~Hello !~
		IF ~~ THEN REPLY ~Hello !~ EXIT

		IF ~~ THEN REPLY ~Can you gather our allies here ?~ DO ~SetGlobal("JO_JOIN_GATHER_JO2608","MYAREA",1)~ GOTO Of_Course
/*
		IF ~InMyArea("%Death_var%")
		!Dead("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! I need you at my side.~ DO ~
		ActionOverride("%Death_var%",MoveToObject("JO2608AL"))~ EXIT
*/
/*
		IF ~InMyArea("%Death_var%")
		See("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! Please do not stand in the way.~ DO ~
		ActionOverride("%Death_var%",RandomWalk())~ EXIT
*/
/*
		IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_END_OF_BG1","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffectObject("JOBG402","JO2608AL")
		MoveGlobalObject(("%Death_var%","JO2608AL")~ GOTO Of_Course
*/
END

IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",3)~ THEN JO2608AL2
	SAY ~Hello !~
		IF ~~ THEN REPLY ~Hello !~ EXIT

		IF ~~ THEN REPLY ~Can you gather our allies here ?~ DO ~SetGlobal("JO_JOIN_GATHER_JO2608","MYAREA",1)~ GOTO Of_Course
/*
		IF ~InMyArea("%Death_var%")
		!Dead("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! I need you at my side.~ DO ~
		ActionOverride("%Death_var%",MoveToObject("JO2608AL"))~ EXIT
*/
/*
		IF ~InMyArea("%Death_var%")
		See("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! Please do not stand in the way.~ DO ~
		ActionOverride("%Death_var%",RandomWalk())~ EXIT
*/
/*
		IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_END_OF_SOD","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffectObject("JOBG402","JO2608AL")
		MoveGlobalObject(("%Death_var%","JO2608AL")~ GOTO Of_Course
*/
END

IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",4)~ THEN JO2608AL3
	SAY ~Hello !~
		IF ~~ THEN REPLY ~Hello !~ EXIT

		IF ~~ THEN REPLY ~Can you gather our allies here ?~ DO ~SetGlobal("JO_JOIN_GATHER_JO2608","MYAREA",1)~ GOTO Of_Course
/*
		IF ~InMyArea("%Death_var%")
		!Dead("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! I need you at my side.~ DO ~
		ActionOverride("%Death_var%",MoveToObject("JO2608AL"))~ EXIT
*/
/*
		IF ~InMyArea("%Death_var%")
		See("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))~ THEN REPLY ~%%Death_var%_name% ! Please do not stand in the way.~ DO ~
		ActionOverride("%Death_var%",RandomWalk())~ EXIT
*/
/*
		IF ~!InMyArea("%Death_var%")
		!Dead("%Death_var%")
		BeenInParty("%Death_var%")
		TriggerOverride("%Death_var%",Global("JO_Myself_AllowDead","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_END_OF_SOD","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_JOIN_PARTY_TRAVELER","LOCALS",0))~ THEN REPLY ~Can you call %%Death_var%_name% at my side ?~ DO ~
		CreateVisualEffectObject("JOBG402","JO2608AL")
		MoveGlobalObject(("%Death_var%","JO2608AL")~ GOTO Of_Course
*/
END

IF ~~ THEN Of_Course
	SAY ~Of Course.~
		IF ~~ THEN EXIT
END

/////////////////////////////////////////////////////
