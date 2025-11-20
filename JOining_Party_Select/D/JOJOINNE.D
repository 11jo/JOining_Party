BEGIN ~JOJOINNE~

IF ~True()~ THEN BEGIN 0
	SAY ~Ahem !~
	= ~Fellow travelers !~
	IF ~~ THEN REPLY ~Sorry, I'm just trying to draw some attention...~ EXIT
	IF ~~ THEN REPLY ~I don't want to see any of you in my dream.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",2)~ EXIT // Accounted for in JO_JOINI
	IF ~~ THEN REPLY ~I did dream about my dear fellow travelers !~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",3)~ EXIT // Accounted for in JO_JOINI
	IF ~Global("JO_NEVER_JOIN","GLOBAL",0)~ THEN REPLY ~Stop switching in party for a while, please.~ DO ~SetGlobal("JO_NEVER_JOIN","GLOBAL",1)~ EXIT // Reset when loading a save.
	IF ~!Global("JO_NEVER_JOIN","GLOBAL",0)~ THEN REPLY ~You are free to switch in party when you feel like.~ DO ~SetGlobal("JO_NEVER_JOIN","GLOBAL",0)~ EXIT
	IF ~~ THEN REPLY ~I want to talk with...~ GOTO 1
END

IF ~~ THEN BEGIN 1
	SAY ~Heu...~
	IF ~~ THEN REPLY ~Nevermind, let's continue~ EXIT
	IF ~~ THEN REPLY ~On second thought, let's start over.~ GOTO 0
/*	IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT*/
END
