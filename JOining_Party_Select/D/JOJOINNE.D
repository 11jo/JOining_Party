BEGIN ~JOJOINNE~

IF ~True()~ THEN BEGIN 0
	SAY ~Ahem !~
	= ~Fellow travelers !~
	IF ~~ THEN REPLY ~Sorry, I'm just trying to draw some attention...~ EXIT
	IF ~~ THEN REPLY ~I don't want to see any of you in my dream.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",1)~ EXIT // Accounted for in JO_JOINI
	IF ~~ THEN REPLY ~I did dream about my dear fellow travelers !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",2)~ EXIT // Accounted for in JO_JOINI
	IF ~~ THEN REPLY ~Stop switching in party for a while, please.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",3)~ EXIT // Reset when loading a save.
	IF ~~ THEN REPLY ~You are free to switch in party when you feel like.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",4)~ EXIT
	IF ~~ THEN REPLY ~To all travelers ! Get lost !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",5)~ EXIT
	IF ~~ THEN REPLY ~Everybody say, Youhou !~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",6)~ EXIT
	IF ~~ THEN REPLY ~Let's switch, one by one, quietly and in order.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SmallWait(1) SetGlobal("JO_JOIN_Move_Around","GLOBAL",7)~ EXIT
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_Move_Around","GLOBAL",8)~ EXIT
	IF ~~ THEN REPLY ~I want to talk with...~ GOTO 1
	IF ~TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER2> want to discuss with...~ GOTO 2
	IF ~TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER3> want to discuss with...~ GOTO 3
	IF ~TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER4> want to discuss with...~ GOTO 4
	IF ~TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER5> want to discuss with...~ GOTO 5
	IF ~TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~<PLAYER6> want to discuss with...~ GOTO 6
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

