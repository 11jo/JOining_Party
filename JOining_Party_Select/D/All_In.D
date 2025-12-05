APPEND ~%joining_dlg%~

	IF WEIGHT #-1
	~Global("JO_JOIN","LOCALS",1)~ THEN BEGIN 1
	SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
	IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT //
	IF ~~ THEN REPLY ~^BJoin the group properly, please.^-~ DO ~
		SetGlobal("JO_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",0)
		SetGlobal("JO_JOIN_LOAD_SWITCH","LOCALS",0)
		SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",TWENTY_HOURS)
		SmallWait(1)
		EquipItemEx("JOMINHP1",1) 
		SmallWait(1)
		DestroyItem("JOMINHP1")
		SmallWait(2)
		JoinParty()~ EXIT //
	IF ~~ THEN REPLY ~^BJoin the group, just for a minute.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ EXIT  //
	IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our strategy.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2 //
	IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our position.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3 //
	IF ~Global("JO_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^YRemain a fellow traveler but don't join the group anymore, at least for a moment.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_NEVER_JOIN","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~Global("JO_NEVER_JOIN","LOCALS",1)~ THEN REPLY ~^YRemain a fellow traveler but join the group when needed.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_NEVER_JOIN","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^BI don't want to see you in my dream anymore !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~!Global("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ THEN REPLY ~^BI did dream about you !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~Leave the group please !~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SmallWait(1) SetGlobal("JO_Myself_LeaveParty","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NOBANTER","LOCALS",0)~ THEN REPLY ~^BI am exhausted by your conversation, please stop interrupting the group.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NOBANTER","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NOBANTER","LOCALS",1)~ THEN REPLY ~^BOn second thought, I miss your discussions... Please continue.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NOBANTER","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NOSWITCH","LOCALS",0)~ THEN REPLY ~^YDon't switch with regular party members, be only a traveler.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)~ GOTO JO_JOINYes //
	IF ~Global("JO_JOIN_NOSWITCH","LOCALS",1)~ THEN REPLY ~^YYou can switch with regular party members.^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",1)~ GOTO JO_JOINYes //
	IF ~~ THEN REPLY ~^0xFFFF00FFJoin the group properly, please, and don't switch your place with travelers.^-~ DO ~
		SetGlobal("JO_NEVER_JOIN","LOCALS",0)
		SmallWait(1)
		SetGlobal("JO_JOIN_NOSWITCH","LOCALS",1)
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
	IF ~~ THEN REPLY ~^GI prefer to adress everyone...^-~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		CreateCreatureObject("JOJOINNE",Myself,0,0,0)
		SmallWait(1)
		ActionOverride("JOJOINNE",StartDialogueNoSet(Player1))~ EXIT //
	IF ~~ THEN REPLY ~Something feel wrong, we can settle this now.~ DO ~
		SetGlobal("JO_JOIN_Move_Done","LOCALS",0)
		SetGlobal("JO_JOIN","LOCALS",0)
		SetGlobal("JO_NEVER_JOIN","LOCALS",0)
		SetGlobal("JO_JOIN_IS_JOINING","LOCALS",0)
		SetGlobal("JO_NOJOIN","GLOBAL",0)
		SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)
		SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
		SetGlobal("JO_JOIN_TRAVELER_PARTY","GLOBAL",0)
		SetGlobal("JO_JOIN_NOBANTER","LOCALS",0)
		SetGlobal("JO_JOIN_NOSWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_Fill_Party","LOCALS",0)
		SetGlobal("JO_JOIN_LOAD_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_LOAD","LOCALS",0)
		SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)
		SetGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS",0)~ EXIT //
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
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",2) OR(2) CheckStatGT(Myself,0,HIDEINSHADOWS) CheckStatGT(Myself,0,STEALTH)~ THEN REPLY ~Stay hide.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",2)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",3) Class(Myself,BARD_ALL)~ THEN REPLY ~Sing.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",3)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",3) Class(Myself,SHAMAN)~ THEN REPLY ~Dance.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",3)~ GOTO JO_JOINYes
	IF ~!Global("BDAI_SKILL_MODE","LOCALS",4) !CheckStat(Myself,0,TURNUNDEADLEVEL)~ THEN REPLY ~Repulse undead.~ DO ~SetGlobal("BDAI_SKILL_MODE","LOCALS",4)~ GOTO JO_JOINYes
END


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
