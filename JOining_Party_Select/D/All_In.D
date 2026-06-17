APPEND ~%joining_dlg%~

	IF WEIGHT #-1
	~Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN -~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT //
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
	IF ~~ THEN REPLY ~^BJoin the group, just for a minute.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!IsGabber(Player1) !TriggerOverride(IsGabber(Myself),Global("JO_JOIN_Wannabe","LOCALS",0))~ THEN REPLY ~^BSwitch with me.^-~ DO ~
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",1))
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
		ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_Fill_Party","LOCALS",1)~ GOTO JO_JOINYes //
// Manage travelers
	IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our strategy.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2 //
	IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our position.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3 //
// Cutscenes
	IF ~Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFFFFDF10I don't want to see you in my dream anymore !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFFFFDF10I did dream about you !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ GOTO JO_JOINYes //
// Temporary : travelers switch
	IF ~Global("JO_JOIN_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFFFFB4B4Remain a fellow traveler but don't join the group anymore, at least for a moment.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^FFFFB4B4Remain a fellow traveler but join the group when needed.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~Leave the group please !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_Myself_LeaveParty","LOCALS",1)~ GOTO JO_JOINYes //
// Banters
	IF ~Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFFFFBF5FI am exhausted by your conversation, please stop interrupting the group.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFFFFBF5FOn second thought, I miss your discussions... Please continue.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)~ GOTO JO_JOINYes //

// Indepandance
	IF ~IsGabber(Player1) Global("JO_JOIN_INDEPANDANCE","LOCALS",1)~ THEN REPLY ~^0xFFFFDF10Follow me when I walk away from the group, better stick together.^-~ DO ~SetGlobal("JO_JOIN_INDEPANDANCE","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~IsGabber(Player1) !Global("JO_JOIN_INDEPANDANCE","GLOBAL",1)~ THEN REPLY ~^0xFFFFDF10I am pretty independant, don't follow me when I walk away from the group !^-~ DO ~SetGlobal("JO_JOIN_INDEPANDANCE","LOCALS",1)~ GOTO JO_JOINYes //

// Switching party between travelers and party members
	IF ~!Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^0xFF82E6FFDon't switch with regular party members, be only a traveler.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~^BYou can switch with regular party members.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~^0xFF82E6FFJoin the group properly, please, and don't switch your place with travelers.^-~ DO ~
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
	IF ~Global("JO_JOIN_Wannabe","LOCALS",1)~ THEN REPLY ~^0xFF82E6FFJoin the group properly, please, and at beginning don't make room for travelers.^-~ DO ~
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
	IF ~Global("JO_JOIN_Wannabe","LOCALS",0)~ THEN REPLY ~^BJoin the group properly, please, and at beginning make room for travelers.^-~ DO ~
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

		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_NEVER_JOIN","LOCALS",0)

		SetGlobal("JO_JOIN_IS_Wannabe","LOCALS",0)
		SetGlobalTimer("JO_JOIN_JOIN_TIMER","LOCALS",ONE_TURN)
		SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",ONE_TURN)
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
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~JO_NOJOIN.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN","LOCALS",0)~ THEN REPLY ~JO_JOIN.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_LOADING","GLOBAL",0)~ THEN REPLY ~JO_JOIN_LOADING.~ DO ~SetGlobal("JO_JOIN_LOADING","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_CUTSCENE","GLOBAL",0)~ THEN REPLY ~JO_JOIN_CUTSCENE.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)~ EXIT //
	/*IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_SWITCHING_PARTY.~ DO ~SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_TRAVELER_PARTY.~ DO ~SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ EXIT //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_MY_SWITCH","LOCALS",0)~ THEN REPLY ~JO_JOIN_MY_SWITCH.~ DO ~SetGlobal("JO_JOIN_MY_SWITCH","LOCALS",0)~ EXIT*/
	IF ~~ THEN REPLY ~How do you feel as traveler.~ GOTO JO_JOINStat //
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~Show logs.~ DO ~
		SetTokenGlobal("JO_JOIN","LOCALS","JO_JOIN")


		SetTokenGlobal("JO_NOJOIN","GLOBAL","JO_NOJOIN")
		SetTokenGlobal("JO_JOIN_IS_JOINING","LOCALS","JO_JOIN_IS_JOINING")
		SetTokenGlobal("JO_JOINI","LOCALS","JO_JOINI")
		SetTokenGlobal("JO_JOIN_TALK","LOCALS","JO_JOIN_TALK")
		SetTokenGlobal("JO_JOIN_CLEAR","LOCALS","JO_JOIN_CLEAR")


		SetTokenGlobal("JO_Myself_LeaveParty","LOCALS","JO_Myself_LeaveParty")
//		SetTokenGlobal("","GLOBAL","")
//		SetTokenGlobal("","GLOBAL","")
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
	SAY ~What can I do?~
	IF ~~ THEN REPLY ~Change nothing.~ DO ~~ GOTO JO_JOINYes
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
	SAY ~What do you need ?~
	IF ~~ THEN REPLY ~Change nothing.~ DO ~~ GOTO JO_JOINYes
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
	IF ~Global("JO_Myself_InParty","LOCALS",0)~ THEN REPLY ~I am not considered like a party member.~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_Myself_Valid","LOCALS",0)~ THEN REPLY ~I am not considered like ready to talk.~ GOTO JO_JOINStatEnd
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
	IF ~!GlobalTimerNotExpired("JO_JOIN_JOIN_TIMER","LOCALS")~ THEN REPLY ~I am ready for a quick switch.~ GOTO JO_JOINStatEnd
//
	IF ~!GlobalTimerNotExpired("JO_JOIN_SWITCH_TIMER","LOCALS")~ THEN REPLY ~I am ready to switch with a party member.~ GOTO JO_JOINStatEnd
//
	IF ~!Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~No dream for me.~ GOTO JO_JOINStatEnd
//
	IF ~Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~Always here, even in your dream !~ GOTO JO_JOINStatEnd
//
END

IF ~~ THEN BEGIN JO_JOINStatEnd
	SAY ~I hope I am fine.~
	IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)~  EXIT
END

////////////////////////////////////////////////////

////////////////////////////////////////////////////

END // APPEND
