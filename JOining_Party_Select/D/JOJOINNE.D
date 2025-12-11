BEGIN ~JOJOINNE~

IF ~True()~ THEN BEGIN 0
	SAY ~Ahem !~
	= ~Fellow travelers !~
	IF ~~ THEN REPLY ~Sorry, I'm just trying to draw some attention...~ EXIT
// Temporary : travelers switch
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFStop switching in party for a while, please.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",3)~ EXIT // Reset when loading a save.
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFYou are free to switch in party when you feel like.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",4)~ EXIT //
// Cutscenes
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFDF00I don't want to see any of you in my dream.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",1)~ EXIT // Accounted for in JO_JOINI
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFDF00I did dream about my dear fellow travelers !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",2)~ EXIT // Accounted for in JO_JOINI
// Banters
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFBF5FI am exhausted by all these conversations, please stop interrupting the group.^-~ DO ~SetGlobal("JO_JOIN_LEGION","GLOBAL",0) SetGlobal("JO_JOIN_Move_Around","GLOBAL",13)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFBF5FOn second thought, I miss our discussions... Let's talk to each others.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",14)~ EXIT //
// Checks
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-A legion ?^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",16)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~To all travelers ! Get lost !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",5)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Everybody say, Youhou !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",6)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^GLet's switch, one by one, quietly and in order.^-~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SmallWait(1) SetGlobal("JO_JOIN_Move_Around","GLOBAL",7)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Do whatever you want.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",8)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Don't be afraid and come closer...^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",9)~ EXIT //
// Free slots in party
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)
		NumInParty(4)
		Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
		!GlobalGT("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
		Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~^0xFFFF00FFThere is room for one traveler to come in party.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",15)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)
		NumInParty(3)
		Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
		!GlobalGT("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
		Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~^0xFFFF00FFThere is room for two travelers to come in party.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",15)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)
		NumInParty(2)
		Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
		!GlobalGT("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
		Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~^0xFFFF00FFThere is room for three travelers to come in party.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",15)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)
		NumInParty(1)
		Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
		!GlobalGT("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
		Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~^0xFFFF00FFThere is room for four travelers to come in party.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",15)~ EXIT //
// Switching party between travelers and party members
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFTravelers stop switching places with party members.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",10)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFTravelers if party members are available you can switch places.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",11)~ EXIT //
	IF ~~ THEN REPLY ~I want to talk with...~ GOTO 1 //
// Player2
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-<PLAYER2> want to discuss with...^-~ GOTO 2 //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-<PLAYER2> become a traveler please...^-~ DO ~ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^-<PLAYER2>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
// Player3
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3> want to discuss with...^-~ GOTO 2 //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3> become a traveler please...^-~ DO ~ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player3,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player3,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player3,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
// Player4
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4> want to discuss with...^-~ GOTO 4 //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4> become a traveler please...^-~ DO ~ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player4,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player4,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player4,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
// Player5
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^G<PLAYER5> want to discuss with...^-~ GOTO 5 //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^G<PLAYER5> become a traveler please...^-~ DO ~ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^G<PLAYER5>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player5,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^G<PLAYER5>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player5,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^G<PLAYER5>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player5,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^G<PLAYER5>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
// Player6
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6> want to discuss with...^-~ GOTO 6 //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6> become a traveler please...^-~ DO ~ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player6,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
// Corrections
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~There's something wrong with travelers, let's settle this now.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",12) ActionOverride("JOJOINNE",DestroySelf())~ EXIT //
	IF ~!Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~JO_NOJOIN.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_CUTSCENE","GLOBAL",0)~ THEN REPLY ~JO_JOIN_CUTSCENE.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_SWITCHING_PARTY.~ DO ~SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_TRAVELER_PARTY.~ DO ~SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ EXIT //
END

IF ~~ THEN BEGIN 1
	SAY ~Heu...~
	IF ~~ THEN REPLY ~Nevermind, let's continue~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT*/
END

IF ~~ THEN BEGIN 2
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER2> we don't have time for this !~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*
	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT*/
END

IF ~~ THEN BEGIN 3
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER3> we don't have time for this !~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*
	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT*/
END

IF ~~ THEN BEGIN 4
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER4> we don't have time for this !~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*
	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT*/
END

IF ~~ THEN BEGIN 5
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER5> we don't have time for this !~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*
	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT*/
END

IF ~~ THEN BEGIN 6
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER6> we don't have time for this !~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*
	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT*/
END

