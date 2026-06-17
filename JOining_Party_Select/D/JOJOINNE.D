BEGIN ~JOJOINNE~

IF ~True()~ THEN BEGIN 0
	SAY ~Ahem !~
	= ~Fellow travelers !~
	IF ~~ THEN REPLY ~Sorry, I'm just trying to draw some attention...~ EXIT

// Temporary : travelers switch
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFDF00Stop the Quick Switch for a while, please.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",3)~ EXIT // Reset when loading a save.
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFDF00You are free to Quick Switch when you feel like.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",4)~ EXIT //

// Cutscenes
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFI don't want to see any of you in my dream.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",1)~ EXIT // Accounted for in JO_JOINI
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFI did dream about my dear fellow travelers !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",2)~ EXIT // Accounted for in JO_JOINI

// Banters
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFBF5FI am exhausted by all these conversations, please stop interrupting the group.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",13)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^0xFFFFBF5FOn second thought, I miss our discussions... Let's talk to each others.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",14)~ EXIT //

// Privacy
	IF ~Global("JO_JOIN_NOPRIVACY","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFI am an open book, no need for privacy.^-~ DO ~SetGlobal("JO_JOIN_NOPRIVACY","GLOBAL",1)~ EXIT //
	IF ~!Global("JO_JOIN_NOPRIVACY","GLOBAL",0)~ THEN REPLY ~^0xFF82E6FFI need some privacy, don't follow me in another area.^-~ DO ~SetGlobal("JO_JOIN_NOPRIVACY","GLOBAL",1)~ EXIT //

// Indepandance
	IF ~~ THEN REPLY ~^0xFFFFDF10All of you can follow me when I walk away from the group, better stick together.^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",18)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~^0xFFFFDF10I am pretty independant, none of you should follow me when I walk away from the group !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",19)~ GOTO JO_JOINYes //

// Checks
	IF ~OR(2)
			Global("JO_JOIN_AREA","MYAREA",1)
			Global("JO_JOIN_BLOP","GLOBAL",1)
		NumInPartyLT(6)
		Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^GLet's switch, one by one, quietly and in order.^-~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SmallWait(1) SetGlobal("JO_JOIN_Move_Around","GLOBAL",7)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",8)~ EXIT //

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


	IF ~~ THEN REPLY ~^GI like to ...^-~ GOTO 1 //


// Player2
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-<PLAYER2> want to...^-~ GOTO 2 //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player2,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^-<PLAYER2> become a traveler please...^-~ DO ~ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		OR(2)
			!TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))
			!TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player2,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^-<PLAYER2>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))
		ActionOverride(Player2,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		!TriggerOverride(Player2,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^-<PLAYER2>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
/*
// NEW
// JO_JOIN_DELAY_SWITCH_TIMER see all_in.baf
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for one more day.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for two more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",2))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for three more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",2))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for four more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",4))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for five more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",5))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for six more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",6))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))~ THEN REPLY ~^-<PLAYER2>, stay in party for at least for seven more days.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_DELAY_SWITCH","LOCALS",7))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
*/
// leave the group at loading
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player2,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^-<PLAYER2>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player2,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^-<PLAYER2>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //


// Player3
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3> want to...^-~ GOTO 2 //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3> become a traveler please...^-~ DO ~ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player3,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		!TriggerOverride(Player3,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player3,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player3,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player3,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player3,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFB4B4<PLAYER3>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //


// Player4
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4> want to...^-~ GOTO 4 //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4> become a traveler please...^-~ DO ~ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player4,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		!TriggerOverride(Player4,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player4,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player4,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player4,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player4,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFFBF5F<PLAYER4>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //


// Player5
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF82E6FF<PLAYER5> want to...^-~ GOTO 5 //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFF82E6FF<PLAYER5> become a traveler please...^-~ DO ~ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFF82E6FF<PLAYER5>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player5,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		!TriggerOverride(Player5,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFF82E6FF<PLAYER5>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player5,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player5,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFF82E6FF<PLAYER5>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player5,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player5,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFF82E6FF<PLAYER5>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //


// Player6
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFF00FF<PLAYER6> want to...^-~ GOTO 6 //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6> become a traveler please...^-~ DO ~ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))~ EXIT //
// Switching party between travelers and party members
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, you can switch your place with travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))~ EXIT //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		!TriggerOverride(Player6,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, don't switch your place with travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1))
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))~ EXIT //
// leave the group at loading
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player6,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, at beginning don't make room for travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))
		!TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))
		!TriggerOverride(Player6,Global("JO_JOIN_NOTRAVELER","LOCALS",1))~ THEN REPLY ~^0xFFFF00FF<PLAYER6>, at beginning make room for travelers.^-~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //


// Corrections
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~There's something wrong with travelers, let's settle this now.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",12) ActionOverride("JOJOINNE",DestroySelf())~ EXIT //
	IF ~Global("JO_JOIN_BLOP","GLOBAL",0)~ THEN REPLY ~Let's Blop !~ DO ~SetGlobal("JO_JOIN_BLOP","GLOBAL",1) ActionOverride("JOJOINNE",DestroySelf())~ EXIT //
	IF ~!Global("JO_JOIN_BLOP","GLOBAL",0)~ THEN REPLY ~Don't switch if not in a master area or if ennemies are at sight.~ DO ~SetGlobal("JO_JOIN_BLOP","GLOBAL",0) ActionOverride("JOJOINNE",DestroySelf())~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~JO_NOJOIN.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_LOADING","GLOBAL",0)~ THEN REPLY ~JO_JOIN_LOADING.~ DO ~SetGlobal("JO_JOIN_LOADING","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_CUTSCENE","GLOBAL",0)~ THEN REPLY ~JO_JOIN_CUTSCENE.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)~ EXIT //
	/*IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_SWITCHING_PARTY.~ DO ~SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ EXIT*/
	IF ~Global("JO_JOIN_LOADING","GLOBAL",0)~ THEN REPLY ~Let's try a Loading Switch !~ DO ~SetGlobal("JO_JOIN_FORCE_LOAD","GLOBAL",1)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~Show logs.~ DO ~
		SetTokenGlobal("JO_JOIN","LOCALS","JO_JOIN")


		SetTokenGlobal("JO_NOJOIN","GLOBAL","JO_NOJOIN")
		SetTokenGlobal("JO_JOIN_IS_JOINING","LOCALS","JO_JOIN_IS_JOINING")
		SetTokenGlobal("JO_JOINI","LOCALS","JO_JOINI")
		SetTokenGlobal("JO_JOIN_TALK","LOCALS","JO_JOIN_TALK")
		SetTokenGlobal("JO_JOIN_CLEAR","LOCALS","JO_JOIN_CLEAR")


		SetTokenGlobal("JO_JOIN_PRIVACY","LOCALS","JO_JOIN_PRIVACY")
		SetTokenGlobal("JO_JOIN_INDEPANDANCE","LOCALS","JO_JOIN_INDEPANDANCE")


		SetTokenGlobal("JO_Myself_LeaveParty","LOCALS","JO_Myself_LeaveParty")
		SetTokenGlobal("JO_JOIN_LEAVE_PARTY","LOCALS","JO_JOIN_LEAVE_PARTY")


//		SetTokenGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL","JO_JOIN_PARTY_SWITCH")
//		SetTokenGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL","JO_JOIN_TRAVELER_SWITCH")
//		SetTokenGlobal("JO_JOIN_MY_SWITCH","LOCALS","JO_JOIN_MY_SWITCH")


		SetTokenGlobal("JO_JOIN_NEVER_BANTER","LOCALS","JO_JOIN_NEVER_BANTER")
		SetTokenGlobal("JO_JOIN_NEVER_SWITCH","LOCALS","JO_JOIN_NEVER_SWITCH")
		SetTokenGlobal("JO_JOIN_NEVER_JOIN","LOCALS","JO_JOIN_NEVER_JOIN")


		SetTokenGlobal("JO_JOIN_IS_Wannabe","LOCALS","JO_JOIN_IS_Wannabe")
		SetTokenGlobal("JO_JOIN_JOIN_TIMER","LOCALS","JO_JOIN_JOIN_TIMER")
		SetTokenGlobal("JO_JOIN_SWITCH_TIMER","LOCALS","JO_JOIN_SWITCH_TIMER")
		SetTokenGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS","JO_JOIN_READY_TO_SWITCH")
		SetTokenGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS","JO_JOIN_SWITCH_WITH_ME")
		SetTokenGlobal("JO_JOIN_QUICK_SWITCH","LOCALS","JO_JOIN_QUICK_SWITCH")
		SetTokenGlobal("JO_JOIN_Fill_Party","LOCALS","JO_JOIN_Fill_Party")


		SetTokenGlobal("JO_JOIN_CAMPAIGN_BANTER","GLOBAL","JO_JOIN_CAMPAIGN_BANTER")
		SetTokenGlobal("JO_JOIN_BANTER_TIMER","GLOBAL","JO_JOIN_BANTER_TIMER")
		SetTokenGlobal("JO_JOIN_BANTER_TIMER","LOCALS","JO_JOIN_BANTER_TIMER")
		SetTokenGlobal("JO_JOIN_BANTER_INTERACT","LOCALS","JO_JOIN_BANTER_INTERACT")
		SetTokenGlobal("JO_JOIN_DREAM_DONE","LOCALS","JO_JOIN_DREAM_DONE")
		SetTokenGlobal("JO_JOIN_DREAM_REST","GLOBAL","JO_JOIN_DREAM_REST")


		SetTokenGlobal("JO_JOIN_Move_Around","GLOBAL","JO_JOIN_Move_Around")
		SetTokenGlobal("JO_JOIN_Move_Done","LOCALS","JO_JOIN_Move_Done")


		SetTokenGlobal("JO_JOIN_CUTSCENE","GLOBAL","JO_JOIN_CUTSCENE")
		SetTokenGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS","JO_JOIN_HIDE_DURING_CUTSCENE")
		SetTokenGlobal("JO_JOIN_IS_HIDDEN_BY_CUTSCENE","LOCALS","JO_JOIN_IS_HIDDEN_BY_CUTSCENE")


		SetTokenGlobal("JO_JOIN_DEV_MODE","GLOBAL","JO_JOIN_DEV_MODE")
		SetTokenGlobal("JO_JOIN_BLOP","GLOBAL","JO_JOIN_BLOP")
		SetTokenGlobal("JO_JOIN_CAMPAIGN","GLOBAL","JO_JOIN_CAMPAIGN")
		SetTokenGlobal("JO_JOIN_PLAYER1_INIT","GLOBAL","JO_JOIN_PLAYER1_INIT")
		SetTokenGlobal("JO_JOIN_TRAVELER_NumInParty","GLOBAL","JO_JOIN_TRAVELER_NumInParty")


		SetTokenGlobal("JO_JOIN_FORCE_LOAD","GLOBAL","JO_JOIN_FORCE_LOAD")
		SetTokenGlobal("JO_JOIN_LOADING","GLOBAL","JO_JOIN_LOADING")
		SetTokenGlobal("JO_JOIN_LOAD","LOCALS","JO_JOIN_LOAD")
		SetTokenGlobal("JO_JOIN_LOADING_PLAYER","LOCALS","JO_JOIN_LOADING_PLAYER")
		SetTokenGlobal("JO_JOIN_SWITCHING_ROOM","LOCALS","JO_JOIN_SWITCHING_ROOM")
		SetTokenGlobal("JO_JOIN_LOAD_PARTY_WAIT","GLOBAL","JO_JOIN_LOAD_PARTY_WAIT")


		SetTokenGlobal("JO_JOIN_IS_TRAVELER","LOCALS","JO_JOIN_IS_TRAVELER")
		SetTokenGlobal("JO_Myself_Valid","LOCALS","JO_Myself_Valid")
		SetTokenGlobal("JO_Myself_InParty","LOCALS","JO_Myself_InParty")
		SetTokenGlobal("JO_Myself_AllowDead","LOCALS","JO_Myself_AllowDead")
		SetTokenGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS","JO_JOIN_SLEEPING_DEAD")
		DisplayString(Myself,@104) ~ EXIT
END

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

IF ~~ THEN BEGIN 1
	SAY ~Heu...~
	IF ~~ THEN REPLY ~Nevermind, let's continue.~ EXIT
	IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO 0
//	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-A legion ?^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",16)~ EXIT // Deprecated by the one below see JO_JOINC.BAF
	IF ~!Global("JO_JOIN_TRAVELER_NumInParty","GLOBAL",0)~ THEN REPLY ~^-A legion ?^-~ DO ~ActionOverride(Player1,ChangeAIScript("JO_JOINC",RACE)) ActionOverride(Player1,SetGlobal("JO_JOIN_COUNT_TRAVELER","LOCALS",1))~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Stay close to me or your partner !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",17)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~To all travelers ! Get lost !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",5)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Everybody say, Youhou !^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",6)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~^-Don't be afraid and come closer...^-~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",9)~ EXIT //
	IF ~!AreaCheck("JO2608")~ THEN REPLY ~^GGo to the switching room !^-~ DO ~
		StorePartyLocations()
		CreateVisualEffectObject("JOBG402",Player1)
		Wait(2)
		FadeToColor([15.0],0)
		ActionOverride(Player1,LeaveAreaLUA("JO2608","",[1631.1209],50))
		ActionOverride(Player2,LeaveAreaLUA("JO2608","",[1362.944],50))
		ActionOverride(Player3,LeaveAreaLUA("JO2608","",[1318.1106],50))
		ActionOverride(Player4,LeaveAreaLUA("JO2608","",[1530.955],50))
		ActionOverride(Player5,LeaveAreaLUA("JO2608","",[1398.1172],50))
		ActionOverride(Player6,LeaveAreaLUA("JO2608","",[1251.1065],50))
		MoveViewObject(Player1,INSTANT)
		FadeFromColor([30.0],0)
		Wait(2)
		CreateVisualEffectObject("JOBG402",Player1)~ EXIT //
	IF ~AreaCheck("JO2608")~ THEN REPLY ~^GLeave the switching room !^-~ DO ~
		CreateVisualEffectObject("JOBG402",Player1)
		Wait(2)
		FadeToColor([15.0],0)
		RestorePartyLocations()
		MoveViewObject(Player1,INSTANT)
		FadeFromColor([30.0],0)
		Wait(2)
		CreateVisualEffectObject("JOBG402",Player1)~ EXIT //
/*	IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT*/
END

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

IF ~~ THEN BEGIN 2
	SAY ~Then...~
	IF ~~ THEN REPLY ~Wait <PLAYER2>, we don't have time for this !~ EXIT
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

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

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

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

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

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

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

//
//
//
//
//
//
//
//
//

///////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////////

