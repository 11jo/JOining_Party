BEGIN ~JO2608AL~

IF ~True()~ THEN 0
	SAY ~Hello !~
		IF ~~ THEN REPLY ~Hello !~ EXIT

		IF ~~ THEN REPLY ~Can you gather our allies here ?~ DO ~SetGlobal("JO_JOIN_GATHER_JO2608","MYAREA",1)~ GOTO Of_Course1

		IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",1)~ THEN REPLY ~Can you bring a former traveler at my side ?~ GOTO call_traveler2

		IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",2)~ THEN REPLY ~Can you bring a former traveler at my side ?~ GOTO call_traveler3

		IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",3)~ THEN REPLY ~Can you bring a former traveler at my side ?~ GOTO call_traveler4

		IF ~Global("JO_JOIN_CAMPAIGN","GLOBAL",4)~ THEN REPLY ~Can you bring a former traveler at my side ?~ GOTO call_traveler5
END

IF ~~ THEN Of_Course1
	SAY ~Of Course.~
		IF ~~ THEN EXIT
END

IF ~~ THEN call_traveler2
	SAY ~Speak the name !~ 
		IF ~~ THEN REPLY ~We don't have time for this !~ EXIT
		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO 0
END

IF ~~ THEN call_traveler3
	SAY ~Speak the name !~ 
		IF ~~ THEN REPLY ~We don't have time for this !~ EXIT
		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO 0
END

IF ~~ THEN call_traveler4
	SAY ~Speak the name !~ 
		IF ~~ THEN REPLY ~We don't have time for this !~ EXIT
		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO 0
END

IF ~~ THEN call_traveler5
	SAY ~Speak the name !~ 
		IF ~~ THEN REPLY ~We don't have time for this !~ EXIT
		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO 0
END

IF ~~ THEN Incomming6
	SAY ~Incomming !~
		IF ~~ THEN EXIT
END

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
