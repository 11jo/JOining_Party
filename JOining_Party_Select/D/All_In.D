APPEND ~%joining_dlg%~

	IF WEIGHT #-1
	~Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	IF ~~ THEN REPLY ~Join the group properly, please.~ DO ~SetGlobal("JO_NEVER_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN","LOCALS",0) SmallWait(2) JoinParty()~ EXIT //  SmallWait(2) DestroyItem("JO_JOIN")
	IF ~~ THEN REPLY ~Join the group, just for a minute.~ DO ~SetGlobal("JO_NEVER_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ EXIT 
//	IF ~~ THEN REPLY ~We need to adjust our strategy.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2
	IF ~~ THEN REPLY ~We need to adjust our position.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3
	IF ~~ THEN REPLY ~Remain a fellow traveler but don't join the group anymore.~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_NEVER_JOIN","LOCALS",1)~ GOTO JO_JOINYes
	IF ~Global("JO_NEVER_CUTSCENE","LOCALS",0)~ THEN REPLY ~I don't want to see you in my dream anymore !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_NEVER_CUTSCENE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~Global("JO_NEVER_CUTSCENE","LOCALS",1)~ THEN REPLY ~I did dream about you !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_NEVER_CUTSCENE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Leave the group please !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_Myself_LeaveParty","LOCALS",1)~ GOTO JO_JOINYes
	END
IF ~~ THEN BEGIN JO_JOINYes
	SAY ~Done !~
	IF ~~ THEN EXIT
END

/*
IF ~~ THEN BEGIN JO_JOINDLG2
	SAY ~What do you need ?~
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_ACTION","LOCALS",0)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Stay out of combat.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Dive in melee.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Use projectiles.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Defensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Offensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Stay out of combat and Defensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Dive in melee and Defensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",7)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Stay out of combat and Offensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",8)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Dive in melee and Offensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",9)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Use projectiles and Defensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",10)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Use projectiles and Offensive spell.~ DO ~ChangeAIScript("XXXXX",RACE) 
												SetGlobal("JO_JOIN_ACTION","LOCALS",11)~ GOTO JO_JOINYes
END

*/

IF ~~ THEN BEGIN JO_JOINDLG3
	SAY ~What do you need ?~
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",0)
													SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",0)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Stay at this location.~ DO ~SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",-1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player1)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",1)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player1)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",1)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player2)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",2)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player2)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",2)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player3)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",3)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player3)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",3)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player4)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",4)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player4)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",4)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player5)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",5)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player5)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",5)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player6)~
		THEN REPLY ~Stay on sight.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",6)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player6)~
		THEN REPLY ~Stay close.~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",6)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
END
END

////////////////////////////////////////////////////

////////////////////////////////////////////////////
