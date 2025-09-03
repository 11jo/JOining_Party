APPEND %joining_dlg%

	IF WEIGHT #-1
	~Allegiance(Myself,FAMILIAR)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ EXIT
	IF ~~ THEN REPLY ~Join the group properly, please.~ DO ~DestroyItem("MINHP1") JoinParty()~ EXIT
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