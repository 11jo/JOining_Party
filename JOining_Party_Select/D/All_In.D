APPEND %joining_dlg%

	IF WEIGHT #-1
	~Allegiance(Myself,FAMILIAR) Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	IF ~~ THEN REPLY ~Join the group properly, please.~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(2) DestroyItem("JOMINHP1") SmallWait(2) JoinParty()~ EXIT
	END

END
