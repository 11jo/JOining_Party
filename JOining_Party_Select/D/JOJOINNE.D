BEGIN ~JOJOINNE~

IF ~True()~ THEN BEGIN 0
	SAY ~Ahem !~
	= ~Fellow travelers !~
	IF ~~ THEN REPLY ~Sorry, I'm just trying to draw some attention...~ EXIT
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~I don't want to see any of you in my dream.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",1)~ EXIT // Accounted for in JO_JOINI
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~I did dream about my dear fellow travelers !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",2)~ EXIT // Accounted for in JO_JOINI
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Stop switching in party for a while, please.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",3)~ EXIT // Reset when loading a save.
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~You are free to switch in party when you feel like.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",4)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~To all travelers ! Get lost !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",5)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Everybody say, Youhou !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",6)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Let's switch, one by one, quietly and in order.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SmallWait(1) SetGlobal("JO_JOIN_Move_Around","GLOBAL",7)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",8)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Don't be afraid and come closer...~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",9)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~I am exhausted by all these conversations, please stop interrupting the group.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",13)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~On second thought, I miss our discussions... Let's talk to each others.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",14)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Travelers stop switching places with party members.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",10)~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~Travelers if party members are available you can switch places.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",11)~ EXIT //
	IF ~~ THEN REPLY ~I want to talk with...~ GOTO 1 //
	IF ~TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER2> want to discuss with...~ GOTO 2 //
	IF ~TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player2,Global("JO_JOIN_NOSWITCH","LOCALS",1))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~<PLAYER2>, you can switch your place with travelers.~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
	IF ~TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player2,Global("JO_JOIN_NOSWITCH","LOCALS",0))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~<PLAYER2>, don't switch your place with travelers.~ DO ~
		ActionOverride(Player2,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER3> want to discuss with...~ GOTO 2 //
	IF ~TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player3,Global("JO_JOIN_NOSWITCH","LOCALS",1))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~<PLAYER3>, you can switch your place with travelers.~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
	IF ~TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player3,Global("JO_JOIN_NOSWITCH","LOCALS",0))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~<PLAYER3>, don't switch your place with travelers.~ DO ~
		ActionOverride(Player3,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER4> want to discuss with...~ GOTO 4 //
	IF ~TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player4,Global("JO_JOIN_NOSWITCH","LOCALS",1))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~<PLAYER4>, you can switch your place with travelers.~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
	IF ~TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player4,Global("JO_JOIN_NOSWITCH","LOCALS",0))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~<PLAYER4>, don't switch your place with travelers.~ DO ~
		ActionOverride(Player4,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER5> want to discuss with...~ GOTO 5 //
	IF ~TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player5,Global("JO_JOIN_NOSWITCH","LOCALS",1))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~<PLAYER5>, you can switch your place with travelers.~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
	IF ~TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player5,Global("JO_JOIN_NOSWITCH","LOCALS",0))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~<PLAYER5>, don't switch your place with travelers.~ DO ~
		ActionOverride(Player5,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER6> want to discuss with...~ GOTO 6 //
	IF ~TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player6,Global("JO_JOIN_NOSWITCH","LOCALS",1))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~<PLAYER6>, you can switch your place with travelers.~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",1))~ EXIT //
	IF ~TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",1))
		OR(2)
			TriggerOverride(Player6,Global("JO_JOIN_NOSWITCH","LOCALS",0))
			TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~<PLAYER6>, don't switch your place with travelers.~ DO ~
		ActionOverride(Player6,SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
		SmallWait(1)
		ActionOverride(Player6,SetGlobal("JO_JOIN_Wannabe","LOCALS",0))~ EXIT //
	IF ~Global("JO_JOIN_Move_Around","GLOBAL",0)~ THEN REPLY ~There's something wrong with travelers, let's settle this now.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",12)~ EXIT //
END

IF ~~ THEN BEGIN 1
	SAY ~Heu...~
	IF ~~ THEN REPLY ~Nevermind, let's continue~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*	IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
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
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
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
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
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
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
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
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
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
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%Death_var% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT*/
END

