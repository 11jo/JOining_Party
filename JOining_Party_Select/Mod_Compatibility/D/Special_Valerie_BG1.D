
/////////////////////////////////////////////////////////////////////////////////////////

// Valerie for SoD / BG2

/////////////////////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM T2VALP 0
IF ~GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",1)~ THEN REPLY ~Yes, you can stay in the Switching room while waiting for the crusade to end.~ DO ~SetGlobal("JO_JOIN_ValSwitching_room","LOCALS",1)~ GOTO Val_GotoSwitching_room
IF ~GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",2)~ THEN REPLY ~Yes, Atkathla is like your home anyway.~  DO ~SetGlobal("JO_JOIN_ValAtkathla","LOCALS",1)~ GOTO Val_GotoAtkathla
END

ADD_STATE_TRIGGER T2VALP 3 ~!Global("JO_JOIN_ValSwitching_room","LOCALS",1) !Global("JO_JOIN_ValAtkathla","LOCALS",1)~

APPEND T2VALP

	IF ~~ THEN BEGIN Val_GotoSwitching_room
	SAY ~<CHARNAME>... Don't let me hanging here forever !~
	IF ~~ THEN DO ~SetGlobal("JO_JOIN_ValSwitching_room","LOCALS",1)
	SetGlobal("T2ValJoined","LOCALS",0)
	EscapeAreaMove("JO2608",880,595,0)
	~ EXIT
	END
	
	IF ~~ THEN BEGIN Val_GotoAtkathla
	SAY ~Alright. I'll be reporting back to the Government District, then. Good luck, <CHARNAME>.~
	IF ~~ THEN DO ~SetGlobal("JO_JOIN_ValAtkathla","LOCALS",1)
	SetGlobal("T2ValJoined","LOCALS",0)
	EscapeAreaMove("AR1000",2889,1041,0)
	~ EXIT
	END
	
	IF ~Global("JO_JOIN_ValSwitching_room","LOCALS",1)~ THEN BEGIN Val_Switching_room
	SAY ~Good to see you again. I'm happy to help if you need me again.~
	IF ~~ THEN REPLY %yes_t2valp% /* ~I do. We leave at once.~ */ DO ~
	SetGlobal("T2ValJoined","LOCALS",1)
		SetGlobal("JO_JOIN_ValSwitching_room","LOCALS",0)
	JoinParty()
	~ EXIT
	IF ~~ THEN REPLY %yes_yes_t2valp% /* ~Welcome back, Valerie.~ */ DO ~
	SetGlobal("T2ValJoined","LOCALS",1)
		SetGlobal("JO_JOIN_ValSwitching_room","LOCALS",0)
	JoinParty()
	~ EXIT
	IF ~~ THEN REPLY %no_t2valp% /* ~Just checking in, unfortunately.~ */ EXIT
	END
	
	IF ~Global("JO_JOIN_ValAtkathla","LOCALS",1)~ THEN BEGIN Val_Atkathla
	SAY ~Good to see you again. Unfortunately, the Cowled Wizards benched me for an undefined period, so I'm happy to help if you need me again.~
	IF ~~ THEN REPLY %yes_t2valp% /* ~I do. We leave at once.~ */ DO ~
	SetGlobal("T2ValJoined","LOCALS",1)
		SetGlobal("JO_JOIN_ValAtkathla","LOCALS",0)
	JoinParty()
	~ EXIT
	IF ~~ THEN REPLY %yes_yes_t2valp% /* ~Welcome back, Valerie.~ */ DO ~
	SetGlobal("T2ValJoined","LOCALS",1)
		SetGlobal("JO_JOIN_ValAtkathla","LOCALS",0)
	JoinParty()
	~ EXIT
	IF ~~ THEN REPLY %no_t2valp% /* ~Just checking in, unfortunately.~ */ EXIT
	END

END

