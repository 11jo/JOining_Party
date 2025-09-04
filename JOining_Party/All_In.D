APPEND %joining_dlg%

	IF WEIGHT #-1
	~Allegiance(Myself,FAMILIAR) 
	OR(2)
		PersonalSpaceDistance(Player1,3)
		Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	IF ~~ THEN REPLY ~Join the group properly, please.~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(2) DestroyItem("JOMINHP1") SmallWait(2) JoinParty()~ EXIT
	END

END



/*

Special abbility makefamiliar

Player3.bcs

IF
	Global("JO_JOIN","LOCALS",1)
THEN
	RESPONSE #100
		LeaveParty()
		ChangeEnemyAlly(LastTargetedBy(Myself),FAMILIAR)
		AddFamiliar()
		GiveItemCreate("MINHP1",LastTargetedBy(Myself),0,0,0)
		XEquipItem("MINHP1",LastTargetedBy(Myself),SLOT_RING_LEFT,EQUIP)
		SetGlobal("JO_JOIN","LOCALS",2)
END



AI script

IsValidForPartyDialogue

LeaveAreaLua Player2





*/