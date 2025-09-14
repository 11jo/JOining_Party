APPEND %joining_dlg%

	IF WEIGHT #-1
	~Allegiance(Myself,FAMILIAR) Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	IF ~~ THEN REPLY ~Join the group properly, please.~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(2) DestroyItem("JO_JOIN") SmallWait(2) JoinParty()~ EXIT
//	IF ~~ THEN REPLY ~We need to adjust our strategy.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2
//	IF ~~ THEN REPLY ~We need to adjust our position.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3
	END
/*
IF ~~ THEN BEGIN JO_JOINYes
	SAY ~Done !~
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JO_JOINDLG2
	SAY ~What do you need ?~
	IF ~~ THEN REPLY ~Stay out of combat.~ DO ~ChangeAIScript("XXXXX",RACE)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Dive in melee.~ DO ~ChangeAIScript("XXXXX",RACE)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Use projectiles.~ DO ~ChangeAIScript("XXXXX",RACE)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Defensive spell.~ DO ~ChangeAIScript("XXXXX",RACE)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~Offensive spell.~ DO ~ChangeAIScript("XXXXX",RACE)~ GOTO JO_JOINYes
END

IF ~~ THEN BEGIN JO_JOINDLG3
	SAY ~What do you need ?~
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_SCRIPT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),0)~ THEN REPLY ~Stay on sight.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player1","LOCALS",1)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),0)~ THEN REPLY ~Stay at this location.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player1","LOCALS",2)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),0)~ THEN REPLY ~Stay close.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player1","LOCALS",3)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),1)~ THEN REPLY ~Stay on sight.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player2","LOCALS",1)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),1)~ THEN REPLY ~Stay at this location.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player2","LOCALS",2)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),1)~ THEN REPLY ~Stay close.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player2","LOCALS",3)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),2)~ THEN REPLY ~Stay on sight.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player3","LOCALS",1)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),2)~ THEN REPLY ~Stay at this location.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player3","LOCALS",2)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),2)~ THEN REPLY ~Stay close.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player3","LOCALS",3)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),3)~ THEN REPLY ~Stay on sight.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player4","LOCALS",1)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),3)~ THEN REPLY ~Stay at this location.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player4","LOCALS",2)~ GOTO JO_JOINYes
	IF ~InPartySlot(LastTalkedToBy(Myself),3)~ THEN REPLY ~Stay close.~ DO ~SetGlobal("JO_JOIN_SCRIPT_Player4","LOCALS",3)~ GOTO JO_JOINYes
END
*/
END
