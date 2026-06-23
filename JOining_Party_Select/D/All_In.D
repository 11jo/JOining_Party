APPEND ~%joining_dlg%~

	IF WEIGHT #-1
	~Global("JO_JOIN","LOCALS",1)~ THEN BEGIN LEGION
	SAY ~^0xFFffe599Hey ! Who could have foreseen that you would lead such a legion ?^-~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT //
	IF ~~ THEN REPLY ~^GJoin the group properly, please.^-~ DO ~
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",0)
		SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",ONE_DAY)
		SmallWait(1)
		EquipItemEx("JOMINHP1",1)
		SmallWait(1)
		DestroyItem("JOMINHP1")
		SmallWait(2)
		JoinParty()~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~^0xFF7f6000Join the group, just for a minute.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ GOTO JO_JOINYes //

// Indepandance
	IF ~IsGabber(Player1) !Global("JO_JOIN_NEED_INDEPANDANCE","GLOBAL",3)~ THEN REPLY ~^0xFF5b5b5bI am pretty independant, don't follow me when I walk 30 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_Move_Independantly","LOCALS",0) SetGlobal("JO_JOIN_NEED_INDEPANDANCE","LOCALS",3)~ GOTO JO_JOINYes //
	IF ~IsGabber(Player1) !Global("JO_JOIN_NEED_INDEPANDANCE","GLOBAL",5)~ THEN REPLY ~^0xFF5b5b5bI am pretty independant, don't follow me when I walk 50 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_Move_Independantly","LOCALS",0) SetGlobal("JO_JOIN_NEED_INDEPANDANCE","LOCALS",5)~ GOTO JO_JOINYes //
	IF ~IsGabber(Player1) !Global("JO_JOIN_NEED_INDEPANDANCE","GLOBAL",8)~ THEN REPLY ~^0xFF5b5b5bI am pretty independant, don't follow me when I walk 80 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_Move_Independantly","LOCALS",0) SetGlobal("JO_JOIN_NEED_INDEPANDANCE","LOCALS",8)~ GOTO JO_JOINYes //
	IF ~IsGabber(Player1) !Global("JO_JOIN_NEED_INDEPANDANCE","GLOBAL",10)~ THEN REPLY ~^0xFF5b5b5bI am pretty independant, don't follow me when I walk 100 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_Move_Independantly","LOCALS",0) SetGlobal("JO_JOIN_NEED_INDEPANDANCE","LOCALS",10)~ GOTO JO_JOINYes //
	IF ~IsGabber(Player1) GlobalGT("JO_JOIN_NEED_INDEPANDANCE","LOCALS",0)~ THEN REPLY ~^0xFF7f6000Follow me when I walk away from the group, better stick together.^-~ DO ~SetGlobal("JO_JOIN_Move_Independantly","LOCALS",0) SetGlobal("JO_JOIN_NEED_INDEPANDANCE","LOCALS",0)~ GOTO JO_JOINYes //

// Indepandance for traveler // ChangeEnemyAlly
/*
	IF ~Allegiance(Myself,FAMILIAR)~ THEN REPLY ~^0xFF6aa84fIt's better for the group if you are more independent.^-~ DO ~SetGlobal("JO_JOIN_CONTROLLED","LOCALS",1) SetGlobal("JO_JOIN_FAMILIAR","LOCALS",0)
						ChangeEnemyAlly(Myself,CONTROLLED)~ GOTO JO_JOINYes //
*/

	IF ~Allegiance(Myself,CONTROLLED)~ THEN REPLY ~^0xFFffe599I prefer to have a strong bond with you.^-~ DO ~SetGlobal("JO_JOIN_FAMILIAR","LOCALS",1) SetGlobal("JO_JOIN_CONTROLLED","LOCALS",0)
				ChangeEnemyAlly(Myself,FAMILIAR)~ GOTO JO_JOINYes //

// Swithc with a player
	IF ~!IsGabber(Player1) TriggerOverride(LastTalkedToBy,Global("JO_JOIN_Wannabe","LOCALS",1))~ THEN REPLY ~^0xFF5b5b5bSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",1)
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0))
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",4)
		SetGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS",1)~ GOTO JO_JOINYes // TODO : Will not take the same slot as the party member.
// Manage travelers
	IF ~~ THEN REPLY ~^0xFF16537eWe need to adjust our strategy.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2 //
	IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our position.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3 //
	IF ~~ THEN REPLY ~^0xFF16537eWe need to adjust our party.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG4 //
// Cutscenes
	IF ~Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFF5b5b5bI don't want to see you in my dream anymore !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fI did dream about you !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ GOTO JO_JOINYes //
// Temporary : travelers switch
	IF ~Global("JO_JOIN_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFF5b5b5bRemain a fellow traveler but don't join the group anymore, at least for a moment.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fRemain a fellow traveler but join the group when needed.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~Leave the group please !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_Myself_LeaveParty","LOCALS",1)~ GOTO JO_JOINYes //
// Banters
	IF ~Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFF5b5b5bI am exhausted by your conversation, please stop interrupting the group.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fOn second thought, I miss your discussions... Please continue.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)~ GOTO JO_JOINYes //

// Switching party between travelers and party members
	IF ~!Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^0xFF5b5b5bDon't switch with regular party members, be only a traveler.~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^0xFF6aa84fYou can switch with regular party members.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~^0xFF5b5b5bJoin the group properly, please, and don't switch your place with travelers.^-~ DO ~
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",0)
		SmallWait(1)
		EquipItemEx("JOMINHP1",1)
		SmallWait(1)
		DestroyItem("JOMINHP1")
		SmallWait(2)
		JoinParty()~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_Wannabe","LOCALS",1)~ THEN REPLY ~^0xFF16537eJoin the group properly, please, and at beginning don't make room for travelers.^-~ DO ~
		SetGlobal("JO_JOIN_Wannabe","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",0)
		SmallWait(1)
		EquipItemEx("JOMINHP1",1)
		SmallWait(1)
		DestroyItem("JOMINHP1")
		SmallWait(2)
		JoinParty()~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_Wannabe","LOCALS",0)~ THEN REPLY ~^0xFF7f6000Join the group properly, please, and at beginning make room for travelers.^-~ DO ~
		SetGlobal("JO_JOIN_Wannabe","LOCALS",1)
		SmallWait(1)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",0)
		SmallWait(1)
		EquipItemEx("JOMINHP1",1)
		SmallWait(1)
		DestroyItem("JOMINHP1")
		SmallWait(2)
		JoinParty()~ GOTO JO_JOINYes //
// JOJOINNE.D
	IF ~~ THEN REPLY ~^GI prefer to adress everyone...^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		CreateCreatureObject("JOJOINNE",Myself,0,0,0)
		SmallWait(1)
		ActionOverride("JOJOINNE",StartDialogueNoSet(Player1))~ EXIT //
// Corrections
	IF ~~ THEN REPLY ~Something feel wrong, we can settle this now.~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)

		SetGlobal("JO_NOJOIN","GLOBAL",0)
		SetGlobal("JO_NOJOIN_LOCALS","LOCALS",0)
		SetGlobal("JO_JOIN_IS_JOINING","LOCALS",0)
		SetGlobal("JO_JOINI","LOCALS",0)
		SetGlobal("JO_JOIN_TALK","LOCALS",0)
		SetGlobal("JO_JOIN_CLEAR","LOCALS",0)

		SetGlobal("JO_JOIN_LOAD_PARTY","LOCALS",0)
//		SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
//		SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
//		SetGlobal("JO_JOIN_MY_SWITCH","LOCALS",0)

		SetGlobal("JO_JOIN_PRIVACY","LOCALS",0)
		SetGlobal("JO_JOIN_INDEPANDANCE","LOCALS",0)

		SetGlobal("JO_Myself_LeaveParty","LOCALS",0)
		SetGlobal("JO_JOIN_LEAVE_PARTY","LOCALS",0)
		SetGlobal("JO_JOIN_LEAVE_WAIT","LOCALS",0)
		SetGlobal("JO_JOIN_LEAVING_PARTY","GLOBAL",0)

		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)

		SetGlobal("JO_JOIN_IS_Wannabe","LOCALS",0)
		SetGlobalTimer("JO_JOIN_JOIN_TIMER","LOCALS",ONE_TURN)
		SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",ONE_TURN)
		SetGlobal("JO_JOIN_SWITCHING","GLOBAL",0)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS",0)
		SetGlobal("JO_JOIN_QUICK_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_Fill_Party","LOCALS",0)

		SetGlobalTimer("JO_JOIN_BANTER_TIMER","LOCALS",ONE_TURN)
		SetGlobal("JO_JOIN_BANTER_INTERACT","LOCALS",0)
		SetGlobal("JO_JOIN_DREAM_DONE","LOCALS",0)
		SetGlobal("JO_JOIN_DREAM_REST","LOCALS",0)

		SetGlobal("JO_JOIN_Move_Done","LOCALS",0)

		SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)
		SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)
		SetGlobal("JO_JOIN_IS_HIDDEN_BY_CUTSCENE","LOCALS",0)
		Activate(Myself)


		SetGlobal("JO_JOIN_FORCE_LOAD","GLOBAL",0)
		SetGlobal("JO_JOIN_LOADING","GLOBAL",0)
		SetGlobal("JO_JOIN_LOAD","LOCALS",0)
		SetGlobal("JO_JOIN_LOADING_PLAYER","LOCALS",0)
		SetGlobal("JO_JOIN_SWITCHING_ROOM","LOCALS",0)
		SetGlobal("JO_JOIN_LOAD_PARTY_WAIT","GLOBAL",0)

		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",1)
		SetGlobal("JO_Myself_Valid","LOCALS",1)
		SetGlobal("JO_Myself_InParty","LOCALS",1)
		SetGlobal("JO_Myself_AllowDead","LOCALS",1)
		SetGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS",0)

		EquipItemEx("JOMINHP1",0)
		DisplayString(Myself,@103)
		ActionOverride("JOJOINNE",DestroySelf())~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~JO_NOJOIN.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SetGlobal("JO_NOJOIN_LOCALS","LOCALS",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN","LOCALS",0)~ THEN REPLY ~^0xFFFFB4B4I am currently talking to you, so it's fine !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO LEGION
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_LOADING","GLOBAL",0)~ THEN REPLY ~JO_JOIN_LOADING.~ DO ~SetGlobal("JO_JOIN_LOADING","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_CUTSCENE","GLOBAL",0)~ THEN REPLY ~JO_JOIN_CUTSCENE.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)~ EXIT //
	/*IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_SWITCHING_PARTY.~ DO ~SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_TRAVELER_PARTY.~ DO ~SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_MY_SWITCH","LOCALS",0)~ THEN REPLY ~JO_JOIN_MY_SWITCH.~ DO ~SetGlobal("JO_JOIN_MY_SWITCH","LOCALS",0)~ EXIT*/
	IF ~~ THEN REPLY ~^GHow do you feel as traveler.^-~ GOTO JO_JOINStat //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~Show logs.~ DO ~
		SetTokenGlobal("JO_JOIN","LOCALS","JO_JOIN")


		SetTokenGlobal("JO_NOJOIN","GLOBAL","JO_NOJOIN")
		SetTokenGlobal("JO_NOJOIN_LOCALS","LOCALS","JO_NOJOIN_LOCALS")
		SetTokenGlobal("JO_JOIN_IS_JOINING","LOCALS","JO_JOIN_IS_JOINING")
		SetTokenGlobal("JO_JOINI","LOCALS","JO_JOINI")
		SetTokenGlobal("JO_JOIN_TALK","LOCALS","JO_JOIN_TALK")
		SetTokenGlobal("JO_JOIN_CLEAR","LOCALS","JO_JOIN_CLEAR")


		SetTokenGlobal("JO_Myself_LeaveParty","LOCALS","JO_Myself_LeaveParty")
		SetTokenGlobal("JO_JOIN_LEAVE_WAIT","LOCALS","JO_JOIN_LEAVE_WAIT")
		SetTokenGlobal("JO_JOIN_LEAVE_PARTY","LOCALS","JO_JOIN_LEAVE_PARTY")
		SetTokenGlobal("JO_JOIN_LEAVING_PARTY","GLOBAL","JO_JOIN_LEAVING_PARTY")

//		SetTokenGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL","JO_JOIN_PARTY_SWITCH")
//		SetTokenGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL","JO_JOIN_TRAVELER_SWITCH")
//		SetTokenGlobal("JO_JOIN_MY_SWITCH","LOCALS","JO_JOIN_MY_SWITCH")


		SetTokenGlobal("JO_JOIN_NEVER_BANTER","LOCALS","JO_JOIN_NEVER_BANTER")
		SetTokenGlobal("JO_JOIN_NEVER_SWITCH","LOCALS","JO_JOIN_NEVER_SWITCH")
		SetTokenGlobal("JO_JOIN_NEVER_JOIN","LOCALS","JO_JOIN_NEVER_JOIN")


		SetTokenGlobal("JO_JOIN_IS_Wannabe","LOCALS","JO_JOIN_IS_Wannabe")
		SetTokenGlobal("JO_JOIN_JOIN_TIMER","LOCALS","JO_JOIN_JOIN_TIMER")
		SetTokenGlobal("JO_JOIN_SWITCH_TIMER","LOCALS","JO_JOIN_SWITCH_TIMER")
		SetTokenGlobal("JO_JOIN_SWITCHING","GLOBAL","JO_JOIN_SWITCHING")
		SetTokenGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS","JO_JOIN_READY_TO_SWITCH")
		SetTokenGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS","JO_JOIN_SWITCH_WITH_ME")
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


		SetTokenGlobal("JO_JOIN_CAMPAIGN","GLOBAL","JO_JOIN_CAMPAIGN")
		SetTokenGlobal("JO_JOIN_TRAVELER_NumInParty","GLOBAL","JO_JOIN_TRAVELER_NumInParty")


		SetTokenGlobal("JO_JOIN_LOADING","GLOBAL","JO_JOIN_LOADING")
		SetTokenGlobal("JO_JOIN_LOAD","LOCALS","JO_JOIN_LOAD")
		SetTokenGlobal("JO_JOIN_LOADING_PLAYER","LOCALS","JO_JOIN_LOADING_PLAYER")


		SetTokenGlobal("JO_JOIN_IS_TRAVELER","LOCALS","JO_JOIN_IS_TRAVELER")
		SetTokenGlobal("JO_Myself_Valid","LOCALS","JO_Myself_Valid")
		SetTokenGlobal("JO_Myself_InParty","LOCALS","JO_Myself_InParty")
		SetTokenGlobal("JO_Myself_AllowDead","LOCALS","JO_Myself_AllowDead")
		SetTokenGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS","JO_JOIN_SLEEPING_DEAD")
		DisplayString(Myself,@104) ~ GOTO JO_JOINStatEnd
	END

IF ~~ THEN BEGIN JO_JOINYes
	SAY ~Done !~
	IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
END

IF ~~ THEN BEGIN JO_JOINDLG2
	SAY ~^0xFF82E6FFWhat can I do?^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fChange nothing.^-~ DO ~~ GOTO LEGION
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("BDAI_DISABLE_ATTACK","LOCALS",0)
												 SetGlobal("BDAI_ATTACK_MODE","LOCALS",0)
												 SetGlobal("BDAI_DISABLE_ITEMS","LOCALS",0)
												 SetGlobal("BDAI_DISABLE_OFFENSIVE","LOCALS",0)
												 SetGlobal("BDAI_DISABLE_DEFENSIVE","LOCALS",0)
												 SetGlobal("BDAI_DISABLE_SPECIAL","LOCALS",0)
												 SetGlobal("BDAI_SKILL_MODE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_ATTACK_MODE","LOCALS",0)~ THEN REPLY ~Can attack with all weapons.~ DO ~SetGlobal("BDAI_DISABLE_ATTACK","LOCALS",0) SetGlobal("BDAI_ATTACK_MODE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_ATTACK_MODE","LOCALS",1)~ THEN REPLY ~Use melee weapons only.~ DO ~SetGlobal("BDAI_DISABLE_ATTACK","LOCALS",0) SetGlobal("BDAI_ATTACK_MODE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_ATTACK_MODE","LOCALS",2)~ THEN REPLY ~Use range weapons only.~ DO ~SetGlobal("BDAI_DISABLE_ATTACK","LOCALS",0) SetGlobal("BDAI_ATTACK_MODE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~Global("BDAI_DISABLE_ATTACK","LOCALS",0)~ THEN REPLY ~No attack.~ DO ~SetGlobal("BDAI_DISABLE_ATTACK","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_DISABLE_ITEMS","LOCALS",0)~ THEN REPLY ~Can use items.~ DO ~SetGlobal("BDAI_DISABLE_ITEMS","LOCALS",0)~ GOTO JO_JOINYes
	IF ~Global("BDAI_DISABLE_ITEMS","LOCALS",0)~ THEN REPLY ~No items.~ DO ~SetGlobal("BDAI_DISABLE_ITEMS","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_DISABLE_OFFENSIVE","LOCALS",0)~ THEN REPLY ~Enable offensive style.~ DO ~SetGlobal("BDAI_DISABLE_OFFENSIVE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~Global("BDAI_DISABLE_OFFENSIVE","LOCALS",0)~ THEN REPLY ~Disable offensive style.~ DO ~SetGlobal("BDAI_DISABLE_OFFENSIVE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_DISABLE_DEFENSIVE","LOCALS",0)~ THEN REPLY ~Enable defensive style.~ DO ~SetGlobal("BDAI_DISABLE_DEFENSIVE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~Global("BDAI_DISABLE_DEFENSIVE","LOCALS",0)~ THEN REPLY ~Disable defensive style.~ DO ~SetGlobal("BDAI_DISABLE_DEFENSIVE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_DISABLE_SPECIAL","LOCALS",0)~ THEN REPLY ~Use innate spells.~ DO ~SetGlobal("BDAI_DISABLE_SPECIAL","LOCALS",0)~ GOTO JO_JOINYes
	IF ~Global("BDAI_DISABLE_SPECIAL","LOCALS",0)~ THEN REPLY ~Don't use innate spells.~ DO ~SetGlobal("BDAI_DISABLE_SPECIAL","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",0)~ THEN REPLY ~No modale.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",0)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",1) OR(2) CheckStatGT(Myself,0,TRAPS) CheckStatGT(Myself,0,DETECTILLUSIONS)~ THEN REPLY ~Find traps and detect illusions.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",2) OR(2) CheckStatGT(Myself,0,HIDEINSHADOWS) CheckStatGT(Myself,0,STEALTH)~ THEN REPLY ~Stay hidden.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",3) Class(Myself,BARD_ALL)~ THEN REPLY ~Sing.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",3)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",3) Class(Myself,SHAMAN)~ THEN REPLY ~Dance.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",3)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",4) !CheckStat(Myself,0,TURNUNDEADLEVEL)~ THEN REPLY ~Repulse undead.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",4)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINDLG3
	SAY ~^0xFF82E6FFWhat do you need ?^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fChange nothing.^-~ DO ~~ GOTO LEGION
	IF ~~ THEN REPLY ~Do whatever you want.~ DO ~SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",0)
													SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",0)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFFFFB4B4Stay at this location.^-~ DO ~SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",-1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player1)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",1)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player1)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",1)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player2)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",2)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player2)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",2)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player3)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",3)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player3)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",3)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player4)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",4)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player4)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",4)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player5)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",5)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player5)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",5)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~IsGabber(Player6)~
		THEN REPLY ~^0xFFffe599Stay on sight.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",6)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",1)~ GOTO JO_JOINYes
	IF ~IsGabber(Player6)~
		THEN REPLY ~^0xFF7f6000Stay close.^-~
			DO ~SetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS",6)
					SetGlobal("JO_JOIN_LINK_TYPE","LOCALS",2)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINDLG4
	SAY ~^0xFF82E6FFI am in...^-~
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",0)~ THEN GOTO JO_JOINPARTYSLOT0
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",1)~ THEN GOTO JO_JOINPARTYSLOT1
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",2)~ THEN GOTO JO_JOINPARTYSLOT2
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",3)~ THEN GOTO JO_JOINPARTYSLOT3
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",4)~ THEN GOTO JO_JOINPARTYSLOT4
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",5)~ THEN GOTO JO_JOINPARTYSLOT5
	IF ~Global("JO_JOIN_PARTYSLOT","LOCALS",6)~ THEN GOTO JO_JOINPARTYSLOT6
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT0
	SAY ~^0xFF6aa84f...Oh, I don't have any assigned place.^~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT1
	SAY ~^0xFF6aa84f...First... I was the leader !^~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT2
	SAY ~^0xFF6aa84f...Second place.^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT3
	SAY ~^0xFF6aa84f...Third place.^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT4
	SAY ~^0xFF6aa84f...Fourth place.^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT5
	SAY ~^0xFF6aa84f...Fifth place .^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the sixth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",6)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END


IF ~~ THEN BEGIN JO_JOINPARTYSLOT6
	SAY ~^0xFF6aa84f...Sixth place.^-~
	IF ~~ THEN REPLY ~^0xFF6aa84fAlright, good to know.^-~ GOTO LEGION
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the leader place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",1)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the second place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",2)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the third place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",3)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fourth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",4)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fYou will take the fifth place next time.^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",5)~ GOTO JO_JOINYes
	IF ~~ THEN REPLY ~^0xFF6aa84fAny place will do..^-~ DO ~SetGlobal("JO_JOIN_PARTYSLOT","LOCALS",0)~ GOTO JO_JOINYes
END

////////////////////////////////////////////////////

////////////////////////////////////////////////////


IF ~~ THEN BEGIN JO_JOINStat
	SAY ~Hum...~
	IF ~!HasItem("JOMINHP1",Myself)~ THEN REPLY ~I don't have the engagement scroll.~ GOTO JO_JOINStatEnd // Je n'ai pas notre parchemin d'engagement.
//
	IF ~OR(3)
			CheckStat(Myself,0,MINHITPOINTS)
			CheckStat(Myself,0,IGNOREDRAINDEATH)
			CheckStat(Myself,0,IMMUNE_TO_TURN_UNDEAD)~ THEN REPLY ~The engagement scroll isn't active.~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_Myself_InParty","LOCALS",0)~ THEN REPLY ~^-I am not considered like a party member.^-~ GOTO JO_JOINStatEnd
//
	IF ~Allegiance(Myself,FAMILIAR)~ THEN REPLY ~^0xFF6aa84fI am considered like a familiar.^-~ GOTO JO_JOINStatEnd
//
	IF ~Allegiance(Myself,CONTROLLED)~ THEN REPLY ~^0xFF7f6000I am considered like an ally.^-~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_Myself_Valid","LOCALS",0)~ THEN REPLY ~^0xFF5b5b5bI am not considered like ready to talk.^-~ GOTO JO_JOINStatEnd
//
	IF ~OR(4)
			!Global("JO_JOIN_CLEAR","LOCALS",0)
			!Global("JO_JOIN_IS_JOINING","LOCALS",0)
			!Global("JO_JOINI","LOCALS",0)
			!Global("JO_JOIN_TALK","LOCALS",0)~ THEN REPLY ~Il semble que la transition ne soit pas terminée.~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_IS_TRAVELER","LOCALS",0)~ THEN REPLY ~I am not considered like a traveler.~ GOTO JO_JOINStatEnd
//
	IF ~!Global("JO_JOIN_SLEEPING_DEAD","LOCALS",0)~ THEN REPLY ~I am dead...~ GOTO JO_JOINStatEnd
//
	IF ~!GlobalTimerNotExpired("JO_JOIN_JOIN_TIMER","LOCALS") !Global("JO_JOIN_NEVER_JOIN","LOCALS",1)~ THEN REPLY ~^0xFF6aa84fI am ready for a Quick Switch.^-~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_NEVER_JOIN","LOCALS",1)~ THEN REPLY ~^0xFF5b5b5bI don't join the group for a Quick Switch.^-~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_NEVER_BANTER","LOCALS",1)~ THEN REPLY ~^0xFF5b5b5bI don't participate to the conversations.^-~ GOTO JO_JOINStatEnd
//
	IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",1)~ THEN REPLY ~^0xFF7f6000I'm always eager to a little chat.^-~ GOTO JO_JOINStatEnd
//
	IF ~!GlobalTimerNotExpired("JO_JOIN_SWITCH_TIMER","LOCALS") !Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^0xFF6aa84fI am ready to switch with party members.^-~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^0xFF5b5b5bI don't switch with party members.^-~ GOTO JO_JOINStatEnd
//
	IF ~!Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFF5b5b5bNo dream for me.^-~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fAlways here, even in your dream !^-~ GOTO JO_JOINStatEnd
//
END

IF ~~ THEN BEGIN JO_JOINStatEnd
	SAY ~I hope I am fine.~
	IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO LEGION
END

////////////////////////////////////////////////////

////////////////////////////////////////////////////

END // APPEND
