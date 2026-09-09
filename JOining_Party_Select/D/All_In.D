APPEND ~%joining_dlg%~


////////////////////////////////////////////////////
	// Gabber
////////////////////////////////////////////////////

	IF WEIGHT #-1 ~Global("JO_JOIN","LOCALS",1) !Global("JO_JOIN_IS_TRAVELER","LOCALS",0)~ THEN BEGIN LEGIONPlayerX
		SAY ~Who dare speaking to me ?~

// Player1
			IF ~!TriggerOverride(Player1,Global("JO_Myself_Valid","LOCALS",0))
				TriggerOverride(Player1,Gender(Myself,FEMALE))
				OR(2)
					GlobalGT("CHAPTER","GLOBAL",6)
					GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",1)~ THEN REPLY ~I am <CHARNAME> Daughter of Bhaal, for god sake !~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",1)
StartDialogueNoSet(Player1)~ EXIT
			IF ~!TriggerOverride(Player1,Global("JO_Myself_Valid","LOCALS",0))
				!TriggerOverride(Player1,Gender(Myself,FEMALE))
				OR(2)
					GlobalGT("CHAPTER","GLOBAL",6)
					GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",1)~ THEN REPLY ~I am <CHARNAME> the Son of Bhaal, for god sake !~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",1)
StartDialogueNoSet(Player1)~ EXIT

			IF ~!TriggerOverride(Player1,Global("JO_Myself_Valid","LOCALS",0))
				!GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",1)
				GlobalLT("CHAPTER","GLOBAL",4)~ THEN REPLY ~I am <CHARNAME> and I am completely at loss, for god sake !~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",1)
StartDialogueNoSet(Player1)~ EXIT

			IF ~!TriggerOverride(Player1,Global("JO_Myself_Valid","LOCALS",0))
				!GlobalGT("JO_JOIN_CAMPAIGN","GLOBAL",1)
				GlobalGT("CHAPTER","GLOBAL",3)
				GlobalLT("CHAPTER","GLOBAL",7)~ THEN REPLY ~I am <CHARNAME> pupille of Gorion, for god sake !~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",1)
StartDialogueNoSet(Player1)~ EXIT

// Player2
			IF ~!TriggerOverride(Player2,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFF00FFIt's me <PLAYER2>, sorry to interrupt...^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",2)
StartDialogueNoSet(Player2)~ EXIT

// Player3
			IF ~!TriggerOverride(Player3,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFFFFDF10<PLAYER3>, my dear.^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",3)
StartDialogueNoSet(Player3)~ EXIT

// Player4
			IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
				TriggerOverride(Player4,Gender(Myself,FEMALE))~ THEN REPLY ~^0xFF82E6FFSilence ! It's <PLAYER4> speaking !^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",4)
StartDialogueNoSet(Player4)~ EXIT

			IF ~!TriggerOverride(Player4,Global("JO_Myself_Valid","LOCALS",0))
				!TriggerOverride(Player4,Gender(Myself,FEMALE))~ THEN REPLY ~^0xFF82E6FFSilence it's <PLAYER4> speaking !^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",4)
StartDialogueNoSet(Player4)~ EXIT

// Player5
			IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
				OR(2)
					TimeOfDay(DAY)
					TimeOfDay(MORNING)~ THEN REPLY ~^0xFFf4ccccfI <PLAYER5>, found you particulary beautiful today.^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",5)
StartDialogueNoSet(Player5)~ EXIT

			IF ~!TriggerOverride(Player5,Global("JO_Myself_Valid","LOCALS",0))
				OR(2)
					TimeOfDay(NIGHT)
					TimeOfDay(DUSK)~ THEN REPLY ~^0xFFf4ccccfI <PLAYER5>, found you particulary beautiful tonight.^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",5)
StartDialogueNoSet(Player5)~ EXIT

// Player6
			IF ~!TriggerOverride(Player6,Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF660000Entering <PLAYER6>.^-~ DO ~
SetGlobal("JO_JOIN","LOCALS",0)
SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",6)
StartDialogueNoSet(Player6)~ EXIT

			IF ~~ THEN REPLY ~I'm already bored.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	END

// Playerx initiate

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",1)~ THEN BEGIN LEGIONPlayer1
		SAY ~Hey ! Who could have foreseen that you would lead such a legion ?~
			IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",2)~ THEN BEGIN LEGIONPlayer2
		SAY ~What do you want little <GABBER> ?~
			IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",3)~ THEN BEGIN LEGIONPlayer3
		SAY ~Oh my ! It's you <GABBER> !~
			IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",4) Gender(Player4,FEMALE)~ THEN BEGIN LEGIONPlayer4F
		SAY ~Sorry Mistress <GABBER>.~
				IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",4) !Gender(Player4,FEMALE)~ THEN BEGIN LEGIONPlayer4M
		SAY ~Sorry Master <GABBER>.~
				IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",5)~ THEN BEGIN LEGIONPlayer5
		SAY ~Arw! You make me blush <GABBER>.~
			IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END

	IF WEIGHT #-1 ~Global("JO_JOIN_TALK_PLAYER","LOCALS",6)~ THEN BEGIN LEGIONPlayer6
		SAY ~Wow <GABBER> !~
			IF ~~ THEN DO ~SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",0)~ GOTO LEGION
	END


////////////////////////////////////////////////////
	// Regular PID
////////////////////////////////////////////////////

	IF ~~ THEN BEGIN LEGION
	SAY ~...~
		IF ~~ THEN REPLY ~Oh ! Sorry,everything is fine.~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT

		IF ~Global("JO_JOIN_IS_JOINING","LOCALS",0)
			NumInPartyLT(6)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			OR(2)
				TriggerOverride(LastTalkedToBy,Global("JO_JOIN_READY_TO_SWITCH","LOCALS",1))
				TriggerOverride(LastTalkedToBy,GlobalTimerNotExpired("JO_JOIN_SWITCH_TIMER","LOCALS"))
		~ THEN REPLY ~^0xFFFFDF10Join the group, just for a minute.^-~ DO ~SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",ONE_TURN) SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0) SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ GOTO JO_JOINYes

		IF ~Global("JO_JOIN_IS_JOINING","LOCALS",0)
			NumInPartyLT(6)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			TriggerOverride(LastTalkedToBy,Global("JO_JOIN_READY_TO_SWITCH","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,GlobalTimerNotExpired("JO_JOIN_SWITCH_TIMER","LOCALS"))
		~ THEN REPLY ~^0xFFFFDF10Join the group, just for a minute.^-~ DO ~SetGlobal("JO_JOIN_IS_JOINING","LOCALS",1)~ GOTO JO_JOINYes

		IF ~Global("JO_JOIN_FORCE_FILL_PARTY","LOCALS",0)
			NumInPartyLT(6)
		~ THEN REPLY ~^0xFF6aa84fJoin the group properly, please.^-~ DO ~SetGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS",1)~ GOTO JO_JOINYes

		IF ~Global("JO_JOIN_NEVER_SWITCH","LOCALS",0) Global("JO_JOIN_FORCE_FILL_PARTY","LOCALS",0) NumInPartyLT(6)~ THEN REPLY ~^0xFF6aa84fJoin the group properly, please, and don't switch your place with travelers.^-~ DO ~
			SetGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS",1)
			SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0) Global("JO_JOIN_FORCE_FILL_PARTY","LOCALS",0) NumInPartyLT(6)~ THEN REPLY ~^0xFF6aa84fJoin the group properly, please, and at beginning don't make room for travelers.^-~ DO ~
			SetGlobal("JO_JOIN_WANNABE_TRAVELER","LOCALS",0)
			SetGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS",1)~ GOTO JO_JOINYes

		IF ~Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0) Global("JO_JOIN_FORCE_FILL_PARTY","LOCALS",0) NumInPartyLT(6)~ THEN REPLY ~^0xFF6aa84fJoin the group properly, please, and at beginning make room for travelers.^-~ DO ~
			SetGlobal("JO_JOIN_WANNABE_TRAVELER","LOCALS",1)
			SetGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS",1)~ GOTO JO_JOINYes

		IF ~Global("JO_Myself_LeaveParty","LOCALS",0)~ THEN REPLY ~Leave the group please !~ DO ~SetGlobal("JO_Myself_LeaveParty","LOCALS",1)~ GOTO JO_JOINYes

// Indepandance
		IF ~IsGabber(Player1)~ THEN REPLY ~^0xFF82E6FFIndependance behavior.^-~ GOTO INDEPENDANCE

// Switch with a player
		IF ~!IsGabber(Player1)
			IsGabber(PartySlot1)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",1)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~!IsGabber(Player1)
			IsGabber(PartySlot2)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",2)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~!IsGabber(Player1)
			IsGabber(PartySlot3)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",3)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~!IsGabber(Player1)
			IsGabber(PartySlot4)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",4)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~!IsGabber(Player1)
			IsGabber(PartySlot5)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",5)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~!IsGabber(Player1)
			IsGabber(PartySlot6)
			Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			!TriggerOverride(LastTalkedToBy,Global("JO_Myself_Valid","LOCALS",0))
			!TriggerOverride(LastTalkedToBy,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
			GlobalLT("JO_JOIN_PS_SAFE_SLOT","GLOBAL",6)~ THEN REPLY ~^0xFFf4ccccSwitch with me.^-~ DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(LastTalkedToBy,SetGlobal("JO_JOIN","LOCALS",1))
				SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2)
			~ GOTO JO_JOINYes

		IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our strategy.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG2

		IF ~~ THEN REPLY ~^0xFFFF00FFWe need to adjust our position.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG3

/*
		IF ~~ THEN REPLY ~^0xFF2968A6We need to adjust our party.^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO JO_JOINDLG4
*/

// Cutscenes
		IF ~Global("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFFf4ccccI don't want to see you in my dream anymore !^-~ DO ~SetGlobal("JO_JOIN_HIDE_CUTSCENE","LOCALS",1)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fI did dream about you !^-~ DO ~SetGlobal("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)~ GOTO JO_JOINYes

// Temporary : travelers switch
		IF ~Global("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFFf4ccccRemain a fellow traveler but don't join the group anymore, at least for a moment.^-~ DO ~SetGlobal("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",1)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fRemain a fellow traveler but join the group when needed.^-~ DO ~SetGlobal("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)~ GOTO JO_JOINYes

// Banters
		IF ~Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFFf4ccccI am exhausted by your conversation, please stop interrupting the group.^-~ DO ~
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",1)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fOn second thought, I miss your discussions... Please continue.^-~ DO ~
		SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)~ GOTO JO_JOINYes


// Free slots in party // Fill party
		IF ~Global("JO_JOIN_NEVER_FILL","LOCALS",0)~ THEN REPLY ~^0xFFf4ccccDon't come in party when Fill Party^-~ DO ~SetGlobal("JO_JOIN_NEVER_FILL","LOCALS",1)~ EXIT

		IF ~!Global("JO_JOIN_NEVER_FILL","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fCome in party when Fill Party.^-~ DO ~SetGlobal("JO_JOIN_NEVER_FILL","LOCALS",0)~ EXIT

// Switching party between travelers and party members
		IF ~Global("JO_JOIN_NEVER_SWITCH","LOCALS",0)~ THEN REPLY ~^0xFFf4ccccDon't switch with regular party members, be only a traveler.~ DO ~
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",1) SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEVER_SWITCH","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fYou can switch with regular party members.^-~ DO ~
		SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)~ GOTO JO_JOINYes

// JOJOINNE.D
		IF ~~ THEN REPLY ~I prefer to adress everyone...~ DO ~
		SetGlobal("JO_JOIN","LOCALS",0)
		CreateCreatureObject("JOJOINNE",Myself,0,0,0)
		SmallWait(1)
		ActionOverride("JOJOINNE",StartDialogueNoSet(Player1))~ EXIT

// Inventory management
/*
		IF ~IsGabber(Player1)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player1,BACKPACK))~ EXIT

		IF ~IsGabber(Player2)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player2,BACKPACK))~ EXIT

		IF ~IsGabber(Player3)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player3,BACKPACK))~ EXIT

		IF ~IsGabber(Player4)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player4,BACKPACK))~ EXIT

		IF ~IsGabber(Player5)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player5,BACKPACK))~ EXIT

		IF ~IsGabber(Player6)~ THEN REPLY ~^0xFF82E6FFCarry my items please.^-~ DO ~ActionOverride(Myself,TakeCreatureItems(Player6,BACKPACK))~ EXIT

		IF ~~ THEN REPLY ~Hand over...~ GOTO JO_JOINnaked

		IF ~~ THEN REPLY ~^-Let's take a look at your equipment.^-~ GOTO JO_JOINequip
*/

// Corrections
		IF ~Global("JO_JOIN_SET_JOINM","LOCALS",0)~ THEN REPLY ~^0xFF2968A6So, we need a little adjustment ?^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0) SetGlobal("JO_JOIN_SET_JOINM","LOCALS",1)~ EXIT

		IF ~~ THEN REPLY ~^0xFF2968A6How do you feel as traveler.^-~ GOTO JO_JOINStat

// Dev
		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_NOJOIN","GLOBAL",0)~ THEN REPLY ~JO_NOJOIN.~ DO ~SetGlobal("JO_NOJOIN","GLOBAL",0) SetGlobal("JO_NOJOIN_LOCALS","LOCALS",0)~ EXIT

		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN","LOCALS",0)~ THEN REPLY ~^0xFFFFB4B4I am currently talking to you, so it's fine !^-~ DO ~SetGlobal("JO_JOIN","LOCALS",0)~ GOTO LEGION
		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_LOADING_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_LOADING_SWITCH.~ DO ~SetGlobal("JO_JOIN_LOADING_SWITCH","GLOBAL",0)~ EXIT

		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_CUTSCENE","GLOBAL",0)~ THEN REPLY ~JO_JOIN_CUTSCENE.~ DO ~SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)~ EXIT

		IF ~IsGabber(Player1)~ THEN REPLY ~^0xFF2968A6It's nothing, a little fever at worst.^-~ DO ~ActionOverride(Player1,SetGlobal("JO_JOIN","LOCALS",0))
		ActionOverride(Player1,ChangeAIScript("JO_JOINP",OVERRIDE))
		SetGlobal("JO_JOIN_Move_Around","GLOBAL",0)
		ActionOverride("JOJOINNE",DestroySelf())~ EXIT

		/*IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_SWITCHING_PARTY.~ DO ~SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)~ EXIT

		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ THEN REPLY ~JO_JOIN_TRAVELER_PARTY.~ DO ~SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)~ EXIT

		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0) !Global("JO_JOIN_MY_SWITCH","LOCALS",0)~ THEN REPLY ~JO_JOIN_MY_SWITCH.~ DO ~SetGlobal("JO_JOIN_MY_SWITCH","LOCALS",0)~ EXIT*/

		IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ DO ~
			SetTokenGlobal("JO_JOIN","LOCALS","JO_JOIN")
			SetTokenGlobal("JO_JOIN_DEV_MODE","GLOBAL","JO_JOIN_DEV_MODE")
			SetTokenGlobal("JO_JOIN_BLOP","GLOBAL","JO_JOIN_BLOP")


			SetTokenGlobal("JO_NOJOIN","GLOBAL","JO_NOJOIN")
			SetTokenGlobal("JO_NOJOIN_LOCALS","LOCALS","JO_NOJOIN_LOCALS")
			SetTokenGlobal("JO_JOIN_IS_JOINING","LOCALS","JO_JOIN_IS_JOINING")
			SetTokenGlobal("JO_JOINI","LOCALS","JO_JOINI")
			SetTokenGlobal("JO_JOIN_TALK","LOCALS","JO_JOIN_TALK")
			SetTokenGlobal("JO_JOIN_SET_JOINX","LOCALS","JO_JOIN_SET_JOINX")


			SetTokenGlobal("JO_JOIN_PRIVACY","LOCALS","JO_JOIN_PRIVACY")
			SetTokenGlobal("JO_JOIN_INDEPANDANCE","LOCALS","JO_JOIN_INDEPANDANCE")


			SetTokenGlobal("JO_Myself_LeaveParty","LOCALS","JO_Myself_LeaveParty")


//			SetTokenGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL","JO_JOIN_PARTY_SWITCH")
//			SetTokenGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL","JO_JOIN_TRAVELER_SWITCH")
//			SetTokenGlobal("JO_JOIN_MY_SWITCH","LOCALS","JO_JOIN_MY_SWITCH")


			SetTokenGlobal("JO_JOIN_NEVER_BANTER","LOCALS","JO_JOIN_NEVER_BANTER")
			SetTokenGlobal("JO_JOIN_NEVER_SWITCH","LOCALS","JO_JOIN_NEVER_SWITCH")
			SetTokenGlobal("JO_JOIN_NEVER_FILL","LOCALS","JO_JOIN_NEVER_FILL")
			SetTokenGlobal("JO_JOIN_QUICK_NEVER_JOIN","LOCALS","JO_JOIN_QUICK_NEVER_JOIN")


			SetTokenGlobal("JO_JOIN_WANNABE_INIT","LOCALS","JO_JOIN_WANNABE_INIT")


			SetTokenGlobal("JO_JOIN_NO_SWITCH_PARTY","GLOBAL","JO_JOIN_NO_SWITCH_PARTY")
			SetTokenGlobal("JO_JOIN_SWITCH_TIMER","LOCALS","JO_JOIN_SWITCH_TIMER")
			SetTokenGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL","JO_JOIN_SWITCHING_PARTY")
			SetTokenGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS","JO_JOIN_READY_TO_SWITCH")
			SetTokenGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS","JO_JOIN_SWITCH_WITH_ME")


			SetTokenGlobal("JO_JOIN_NO_QUICK_SWITCH","GLOBAL","JO_JOIN_NO_QUICK_SWITCH")
			SetTokenGlobal("JO_JOIN_QUICK_JOIN_TIMER","LOCALS","JO_JOIN_QUICK_JOIN_TIMER")
			SetTokenGlobal("JO_JOIN_QUICK_SWITCH","LOCALS","JO_JOIN_QUICK_SWITCH")


			SetTokenGlobal("JO_JOIN_NO_FILL_PARTY","GLOBAL","JO_JOIN_NO_FILL_PARTY")
			SetTokenGlobal("JO_JOIN_FILL_PARTY","LOCALS","JO_JOIN_FILL_PARTY")
			SetTokenGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS","JO_JOIN_FORCE_FILL_PARTY")


			SetTokenGlobal("JO_JOIN_CAMPAIGN_BANTER","GLOBAL","JO_JOIN_CAMPAIGN_BANTER")
			SetTokenGlobal("JO_JOIN_BANTER_TIMER","GLOBAL","JO_JOIN_BANTER_TIMER_G")
			SetTokenGlobal("JO_JOIN_BANTER_TIMER","LOCALS","JO_JOIN_BANTER_TIMER_L")
			SetTokenGlobal("JO_JOIN_BANTER_INTERACT","LOCALS","JO_JOIN_BANTER_INTERACT")
			SetTokenGlobal("JO_JOIN_BANTER_BLOCK","GLOBAL","JO_JOIN_BANTER_BLOCK")
			SetTokenGlobal("JO_JOIN_DREAM_DONE","LOCALS","JO_JOIN_DREAM_DONE")
			SetTokenGlobal("JO_JOIN_DREAM_REST","GLOBAL","JO_JOIN_DREAM_REST")


			SetTokenGlobal("JO_JOIN_Move_Around","GLOBAL","JO_JOIN_Move_Around")
			SetTokenGlobal("JO_JOIN_Move_Done","LOCALS","JO_JOIN_Move_Done")


			SetTokenGlobal("JO_JOIN_FORCE_HIDE","GLOBAL","JO_JOIN_FORCE_HIDE")
			SetTokenGlobal("JO_JOIN_CUTSCENE","GLOBAL","JO_JOIN_CUTSCENE")
			SetTokenGlobal("JO_JOIN_HIDE_CUTSCENE","LOCALS","JO_JOIN_HIDE_CUTSCENE")
			SetTokenGlobal("JO_JOIN_IS_HIDDEN","LOCALS","JO_JOIN_IS_HIDDEN")


			SetTokenGlobal("JO_JOIN_CAMPAIGN_EET","GLOBAL","JO_JOIN_CAMPAIGN_EET")
			SetTokenGlobal("JO_JOIN_CAMPAIGN","GLOBAL","JO_JOIN_CAMPAIGN")
			SetTokenGlobal("JO_JOIN_PLAYER1_INIT","GLOBAL","JO_JOIN_PLAYER1_INIT")
			SetTokenGlobal("JO_JOIN_TRAVELER_NUM","GLOBAL","JO_JOIN_TRAVELER_NUM")


			SetTokenGlobal("JO_JOIN_TALK_TRANSITION","LOCALS","JO_JOIN_TALK_TRANSITION")
			SetTokenGlobal("JO_JOIN_END_OF_WATCH","LOCALS","JO_JOIN_END_OF_WATCH")
			SetTokenGlobal("JO_JOIN_END_OF_SOD","LOCALS","JO_JOIN_END_OF_SOD")
			SetTokenGlobal("JO_JOIN_END_OF_BG1","LOCALS","JO_JOIN_END_OF_BG1")


			SetTokenGlobal("JO_JOIN_FORCE_LOAD","GLOBAL","JO_JOIN_FORCE_LOAD")
			SetTokenGlobal("JO_JOIN_LOADING_SWITCH","GLOBAL","JO_JOIN_LOADING_SWITCH")
			SetTokenGlobal("JO_JOIN_LOAD","LOCALS","JO_JOIN_LOAD")
			SetTokenGlobal("JO_JOIN_LOADING_PLAYER","LOCALS","JO_JOIN_LOADING_PLAYER")
			SetTokenGlobal("JO_JOIN_LOADING_MAX","LOCALS","JO_JOIN_LOADING_MAX")
			SetTokenGlobal("JO_JOIN_LOAD_PARTY_WAIT","GLOBAL","JO_JOIN_LOAD_PARTY_WAIT")


//			SetTokenGlobal("JO_TRAVELER_%Death_var%","GLOBAL","JO_TRAVELER_%Death_var%")
			SetTokenGlobal("JO_TRAVELER_Myself","LOCALS","JO_TRAVELER_Myself")
			SetTokenGlobal("JO_JOIN_IS_TRAVELER","LOCALS","JO_JOIN_IS_TRAVELER")
			SetTokenGlobal("JO_Myself_Valid","LOCALS","JO_Myself_Valid")
			SetTokenGlobal("JO_Myself_InParty","LOCALS","JO_Myself_InParty")
			SetTokenGlobal("JO_Myself_AllowDead","LOCALS","JO_Myself_AllowDead")
			SetTokenGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS","JO_JOIN_SLEEPING_DEAD")


			SetTokenGlobal("JO_JOIN_PROTAGONIST","GLOBAL","JO_JOIN_PROTAGONIST")
			SetTokenGlobal("JO_JOIN_PARTYSLOT","LOCALS","JO_JOIN_PARTYSLOT")

			DisplayString(Myself,@104) ~ EXIT

		IF ~~ THEN REPLY ~^0xFF2968A6Something feel wrong, we can settle this now.^-~ DO ~
			SetGlobal("JO_JOIN","LOCALS",0)

			SetGlobal("JO_NOJOIN","GLOBAL",0)
			SetGlobal("JO_NOJOIN_LOCALS","LOCALS",0)
			SetGlobal("JO_JOIN_IS_JOINING","LOCALS",0)
			SetGlobal("JO_JOINI","LOCALS",0)
			SetGlobal("JO_JOIN_TALK","LOCALS",0)
			SetGlobal("JO_JOIN_SET_JOINX","LOCALS",0)

//			SetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL",0)
//			SetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL",0)
//			SetGlobal("JO_JOIN_MY_SWITCH","LOCALS",0)

			SetGlobal("JO_JOIN_PRIVACY","LOCALS",0)
			SetGlobal("JO_JOIN_INDEPANDANCE","LOCALS",0)

			SetGlobal("JO_Myself_LeaveParty","LOCALS",0)

			SetGlobal("JO_JOIN_NEVER_BANTER","LOCALS",0)
			SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0)
			SetGlobal("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)

			SetGlobal("JO_JOIN_WANNABE_INIT","LOCALS",0)
			SetGlobalTimer("JO_JOIN_QUICK_JOIN_TIMER","LOCALS",ONE_TURN)
			SetGlobalTimer("JO_JOIN_SWITCH_TIMER","LOCALS",ONE_TURN)
			SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
			SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",0)
			SetGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS",0)
			SetGlobal("JO_JOIN_QUICK_SWITCH","LOCALS",0)
			SetGlobal("JO_JOIN_FILL_PARTY","LOCALS",0)

			SetGlobalTimer("JO_JOIN_BANTER_TIMER","LOCALS",ONE_TURN)
			SetGlobal("JO_JOIN_BANTER_INTERACT","LOCALS",0)
			SetGlobal("JO_JOIN_DREAM_DONE","LOCALS",0)
			SetGlobal("JO_JOIN_DREAM_REST","LOCALS",0)
	
			SetGlobal("JO_JOIN_Move_Done","LOCALS",0)
	
			SetGlobal("JO_JOIN_CUTSCENE","GLOBAL",0)
			SetGlobal("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)
			SetGlobal("JO_JOIN_IS_HIDDEN","LOCALS",0)
			Activate(Myself)


			SetGlobal("JO_JOIN_FORCE_LOAD","GLOBAL",0)
			SetGlobal("JO_JOIN_LOADING_SWITCH","GLOBAL",0)
			SetGlobal("JO_JOIN_LOAD","LOCALS",0)
			SetGlobal("JO_JOIN_LOADING_PLAYER","LOCALS",0)
			SetGlobal("JO_JOIN_LOADING_MAX","LOCALS",0)
			SetGlobal("JO_JOIN_LOAD_PARTY_WAIT","GLOBAL",0)
	
			SetGlobal("JO_JOIN_IS_TRAVELER","LOCALS",1)
			SetGlobal("JO_Myself_Valid","LOCALS",1)
			SetGlobal("JO_Myself_InParty","LOCALS",1)
			SetGlobal("JO_Myself_AllowDead","LOCALS",1)
			SetGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS",0)

			EquipItemEx("JOMINHP1",0)
			DisplayString(Myself,@103)
			ActionOverride("JOJOINNE",DestroySelf())~ EXIT

	END // LEGION


////////////////////////////////////////////////////
	// Oh Yeah !
////////////////////////////////////////////////////

	IF ~~ THEN BEGIN JO_JOINYes
		SAY ~Done !~
		IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	END // JO_JOINYes


////////////////////////////////////////////////////
	// We need to adjust our strategy.
////////////////////////////////////////////////////

	IF ~~ THEN BEGIN JO_JOINDLG2
		SAY ~What can I do?~

		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ DO ~~ GOTO LEGION

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

	END // JO_JOINDLG2


////////////////////////////////////////////////////
	// We need to adjust our position.
////////////////////////////////////////////////////


	IF ~~ THEN BEGIN JO_JOINDLG3
		SAY ~What do you need ?~
		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ DO ~~ GOTO LEGION
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
	END // JO_JOINDLG3


////////////////////////////////////////////////////
	// How do you feel as traveler.
////////////////////////////////////////////////////

	IF ~~ THEN BEGIN JO_JOINStat
		SAY ~Hum...~
		IF ~!HasItem("JOMINHP1",Myself)~ THEN REPLY ~I don't have the engagement scroll.~ GOTO JO_JOINStatEnd // Je n'ai pas notre parchemin d'engagement.

		IF ~NumItemsGT("JOMINHP1",Myself,1)~ THEN REPLY ~I engage myself too much...~ GOTO JO_JOINStatEnd

	//	IF ~HasItemSlot("JOMINHP1",xxxxx)~ THEN REPLY ~....~ GOTO JO_JOINStatEnd

		IF ~OR(3)
				CheckStat(Myself,0,MINHITPOINTS)
				CheckStat(Myself,0,IGNOREDRAINDEATH)
				CheckStat(Myself,0,IMMUNE_TO_TURN_UNDEAD)~ THEN REPLY ~The engagement scroll isn't active.~ GOTO JO_JOINStatEnd

		IF ~Global("JO_Myself_InParty","LOCALS",0)~ THEN REPLY ~I am not considered like a party member.^-~ GOTO JO_JOINStatEnd

		IF ~Allegiance(Myself,FAMILIAR)~ THEN REPLY ~^0xFF6aa84fI am considered like a familiar.^-~ GOTO JO_JOINStatEnd

		IF ~Global("JO_Myself_Valid","LOCALS",0)~ THEN REPLY ~I am not considered like ready to talk.~ GOTO JO_JOINStatEnd

		IF ~OR(4)
				!Global("JO_JOIN_SET_JOINX","LOCALS",0)
				!Global("JO_JOIN_IS_JOINING","LOCALS",0)
				!Global("JO_JOINI","LOCALS",0)
				!Global("JO_JOIN_TALK","LOCALS",0)~ THEN REPLY ~Il semble que la transition ne soit pas terminée.~ GOTO JO_JOINStatEnd

		IF ~Global("JO_JOIN_IS_TRAVELER","LOCALS",0)~ THEN REPLY ~I am not considered like a traveler.~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_SLEEPING_DEAD","LOCALS",0)~ THEN REPLY ~I am dead...~ GOTO JO_JOINStatEnd

		IF ~!GlobalTimerNotExpired("JO_JOIN_QUICK_JOIN_TIMER","LOCALS") Global("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~^0xFF6aa84fI am ready for a Quick Switch.^-~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_QUICK_NEVER_JOIN","LOCALS",0)~ THEN REPLY ~I don't join the group for a Quick Switch.~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~I don't participate to the conversations.~ GOTO JO_JOINStatEnd

		IF ~Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~I'm always eager to a little chat.~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_NEVER_BANTER","LOCALS",0)~ THEN REPLY ~I don't participate to the conversations.~ GOTO JO_JOINStatEnd

		IF ~!GlobalTimerNotExpired("JO_JOIN_SWITCH_TIMER","LOCALS") !Global("JO_JOIN_NEVER_SWITCH","LOCALS",1)~ THEN REPLY ~I am ready to switch with party members.~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_NEVER_SWITCH","LOCALS",0)~ THEN REPLY ~I don't switch with party members.~ GOTO JO_JOINStatEnd

		IF ~!Global("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)~ THEN REPLY ~No dream for me.~ GOTO JO_JOINStatEnd

		IF ~Global("JO_JOIN_HIDE_CUTSCENE","LOCALS",0)~ THEN REPLY ~Always here, even in your dream !~ GOTO JO_JOINStatEnd

		IF ~Global("JO_JOIN_INDEPANDANCE","LOCALS",3)~ THEN REPLY ~^0xFFFFDF10I don't follow when you walk 30 steps away from the group.^-~ GOTO JO_JOINStatEnd
		IF ~Global("JO_JOIN_INDEPANDANCE","LOCALS",5)~ THEN REPLY ~^0xFFFFDF10I don't follow when you walk 50 steps away from the group.^-~ GOTO JO_JOINStatEnd
		IF ~Global("JO_JOIN_INDEPANDANCE","LOCALS",8)~ THEN REPLY ~^0xFFFFDF10I don't follow when you walk 80 steps away from the group.^-~ GOTO JO_JOINStatEnd
		IF ~Global("JO_JOIN_INDEPANDANCE","LOCALS",10)~ THEN REPLY ~^0xFFFFDF10I don't follow when you walk 100 steps away from the group.^-~ GOTO JO_JOINStatEnd
		IF ~Global("JO_JOIN_INDEPANDANCE","LOCALS",0)~ THEN REPLY ~^0xFFFFDF10I follow you or another party member when you walk away from the group.^-~ GOTO JO_JOINStatEnd

	END // JO_JOINStat

	IF ~~ THEN BEGIN JO_JOINStatEnd
		SAY ~I hope I am fine.~
		IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)~ EXIT
	END // JO_JOINStatEnd


////////////////////////////////////////////////////
	// Indepandance
////////////////////////////////////////////////////

	IF ~~ THEN BEGIN INDEPENDANCE
		SAY ~More independance with <GABBER>~

		IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO LEGION
		IF ~!Global("JO_JOIN_NEED_INDEPANDANT","LOCALS",0)~ THEN REPLY ~Follow me when I walk away from the group, better stick together.~ DO ~SetGlobal("JO_JOIN_NEED_INDEPANDANT","LOCALS",0)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEED_INDEPANDANT","LOCALS",3)~ THEN REPLY ~I am pretty independant, don't follow me when I walk ^0xFF82E6FF30 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_NEED_INDEPANDANT","LOCALS",3)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEED_INDEPANDANT","LOCALS",5)~ THEN REPLY ~I am pretty independant, don't follow me when I walk ^0xFF82E6FF50 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_NEED_INDEPANDANT","LOCALS",5)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEED_INDEPANDANT","LOCALS",8)~ THEN REPLY ~I am pretty independant, don't follow me when I walk ^0xFF82E6FF80 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_NEED_INDEPANDANT","LOCALS",8)~ GOTO JO_JOINYes

		IF ~!Global("JO_JOIN_NEED_INDEPANDANT","LOCALS",10)~ THEN REPLY ~I am pretty independant, don't follow me when I walk ^0xFF82E6FF100 steps away from the group !^-~ DO ~SetGlobal("JO_JOIN_NEED_INDEPANDANT","LOCALS",10)~ GOTO JO_JOINYes

	END // INDEPENDANCE


////////////////////////////////////////////////////
	// Inventory management
////////////////////////////////////////////////////
/*
// Equip items
	IF ~~ THEN BEGIN JO_JOINequip
		SAY ~Hey, don't undress me with your eyes...~
			IF ~~ THEN REPLY ~^GOn second thought, let's start over.^-~ GOTO LEGION
			IF ~!HasItemSlot(Myself,SLOT_AMULET) !HasItemCategory(Myself,AMULET,FALSE)~ THEN REPLY ~Wear the amulet in you inventory.~ DO ~FillSlot(SLOT_AMULET)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_AMULET)~ THEN REPLY ~I already wear an amulet.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_BELT) !HasItemCategory(Myself,BELT,FALSE)~ THEN REPLY ~Wear the belt in you inventory.~ DO ~FillSlot(SLOT_BELT)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_BELT)~ THEN REPLY ~I already wear a belt.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_BOOTS) !HasItemCategory(Myself,BOOT,FALSE)~ THEN REPLY ~Wear the boots in you inventory.~ DO ~FillSlot(SLOT_BOOTS)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_BOOTS)~ THEN REPLY ~I already wear boots.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_CLOAK) !HasItemCategory(Myself,CLOAK,FALSE)~ THEN REPLY ~Wear the amulet in you inventory.~ DO ~FillSlot(SLOT_CLOAK)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_CLOAK)~ THEN REPLY ~I already wear an cloak.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_GAUNTLETS) !HasItemCategory(Myself,RING,FALSE)~ THEN REPLY ~Wear the gauntlets in you inventory.~ DO ~FillSlot(SLOT_GAUNTLETS)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_GAUNTLETS)~ THEN REPLY ~I already wear gauntlets.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_RING_LEFT) !HasItemCategory(Myself,RING,FALSE)~ THEN REPLY ~Wear the ring in you inventory.~ DO ~FillSlot(SLOT_RING_LEFT)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_RING_LEFT)~ THEN REPLY ~I already have a ring on my right hand.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_SHIELD) !HasItemCategory(Myself,SHIELD,FALSE)~ THEN REPLY ~Equip the shield in you inventory.~ DO ~FillSlot(SLOT_SHIELD)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_SHIELD)~ THEN REPLY ~I already carry a shield.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_HELMET) !HasItemCategory(Myself,HELMET,FALSE)~ THEN REPLY ~Equip the helm in you inventory.~ DO ~FillSlot(SLOT_HELMET)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_HELMET)~ THEN REPLY ~I already wear a helm.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_ARMOR) !HasItemCategory(Myself,ARMOR,FALSE)~ THEN REPLY ~Equip the armor in you inventory.~ DO ~FillSlot(SLOT_ARMOR)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_ARMOR)~ THEN REPLY ~I already wear an armor.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_WEAPON)~ THEN REPLY ~Equip one of the weapon in you inventory.~ DO ~FillSlot(SLOT_WEAPON)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_WEAPON)~ THEN REPLY ~I already have a weapon.~ GOTO JO_JOINequip

			IF ~!HasItemSlot(Myself,SLOT_AMMO) 
			OR(3)
				!HasItemCategory(Myself,BULLET,FALSE)
				!HasItemCategory(Myself,ARROW,FALSE)
				!HasItemCategory(Myself,BOLT,FALSE)~ THEN REPLY ~Use the projectiles in you inventory.~ DO ~FillSlot(SLOT_AMMO)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_AMMO)~ THEN REPLY ~I already use projectiles.~ GOTO JO_JOINequip


			IF ~!HasItemSlot(Myself,SLOT_MISC0)~ THEN REPLY ~Be ready to use one of the combat items in you inventory.~ DO ~FillSlot(SLOT_MISC0)~ GOTO JO_JOINequip
			IF ~!HasItemSlot(Myself,SLOT_MISC1)~ THEN REPLY ~Be ready to use one of the combat items in you inventory.~ DO ~FillSlot(SLOT_MISC1)~ GOTO JO_JOINequip
			IF ~!HasItemSlot(Myself,SLOT_MISC2)~ THEN REPLY ~Be ready to use one of the combat items in you inventory.~ DO ~FillSlot(SLOT_MISC2)~ GOTO JO_JOINequip
			IF ~HasItemSlot(Myself,SLOT_MISC2) HasItemSlot(Myself,SLOT_MISC1) HasItemSlot(Myself,SLOT_MISC0)~ THEN REPLY ~I cannot use more combat items.~ GOTO JO_JOINequip
	END // JO_JOINequip

// Hand over items
	IF ~~ THEN BEGIN JO_JOINnaked
		SAY ~Hey, don't strip me down !~
			IF ~IsGabber(Player1)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player1,TakeCreatureItems(Myself,WEAPONS))~ EXIT

			IF ~IsGabber(Player2)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player2,TakeCreatureItems(Myself,WEAPONS))~ EXIT

			IF ~IsGabber(Player3)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player3,TakeCreatureItems(Myself,WEAPONS))~ EXIT

			IF ~IsGabber(Player4)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player4,TakeCreatureItems(Myself,WEAPONS))~ EXIT

			IF ~IsGabber(Player5)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player5,TakeCreatureItems(Myself,WEAPONS))~ EXIT

			IF ~IsGabber(Player6)~ THEN REPLY ~... You're weapons.~ DO ~ActionOverride(Player6,TakeCreatureItems(Myself,WEAPONS))~ EXIT //


			IF ~IsGabber(Player1)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player1,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT

			IF ~IsGabber(Player2)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player2,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT

			IF ~IsGabber(Player3)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player3,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT

			IF ~IsGabber(Player4)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player4,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT

			IF ~IsGabber(Player5)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player5,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT

			IF ~IsGabber(Player6)~ THEN REPLY ~... Combat items.~ DO ~ActionOverride(Player6,TakeCreatureItems(Myself,QUICKITEMS))~ EXIT


			IF ~IsGabber(Player1)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player1,TakeCreatureItems(Myself,EQUIPPED))~ EXIT

			IF ~IsGabber(Player2)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player2,TakeCreatureItems(Myself,EQUIPPED))~ EXIT

			IF ~IsGabber(Player3)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player3,TakeCreatureItems(Myself,EQUIPPED))~ EXIT

			IF ~IsGabber(Player4)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player4,TakeCreatureItems(Myself,EQUIPPED))~ EXIT

			IF ~IsGabber(Player5)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player5,TakeCreatureItems(Myself,EQUIPPED))~ EXIT

			IF ~IsGabber(Player6)~ THEN REPLY ~... The items you're wearing.~ DO ~ActionOverride(Player6,TakeCreatureItems(Myself,EQUIPPED))~ EXIT


			IF ~IsGabber(Player1)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player1,TakeCreatureItems(Myself,BACKPACK))~ EXIT

			IF ~IsGabber(Player2)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player2,TakeCreatureItems(Myself,BACKPACK))~ EXIT

			IF ~IsGabber(Player3)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player3,TakeCreatureItems(Myself,BACKPACK))~ EXIT

			IF ~IsGabber(Player4)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player4,TakeCreatureItems(Myself,BACKPACK))~ EXIT

			IF ~IsGabber(Player5)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player5,TakeCreatureItems(Myself,BACKPACK))~ EXIT

			IF ~IsGabber(Player6)~ THEN REPLY ~... The items you're carrying.~ DO ~ActionOverride(Player6,TakeCreatureItems(Myself,BACKPACK))~ EXIT


			IF ~IsGabber(Player1)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player1,TakeCreatureItems(Myself,ALL))~ EXIT

			IF ~IsGabber(Player2)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player2,TakeCreatureItems(Myself,ALL))~ EXIT

			IF ~IsGabber(Player3)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player3,TakeCreatureItems(Myself,ALL))~ EXIT

			IF ~IsGabber(Player4)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player4,TakeCreatureItems(Myself,ALL))~ EXIT

			IF ~IsGabber(Player5)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player5,TakeCreatureItems(Myself,ALL))~ EXIT

			IF ~IsGabber(Player6)~ THEN REPLY ~... Everything you got.~ DO ~ActionOverride(Player6,TakeCreatureItems(Myself,ALL))~ EXIT

	END // JO_JOINnaked
*/

////////////////////////////////////////////////////
// Party member Log
////////////////////////////////////////////////////

	IF WEIGHT #-1~Global("JO_JOIN","LOCALS",1) Global("JO_JOIN_IS_TRAVELER","LOCALS",0)~ THEN BEGIN JO_JOINShow_us
		SAY ~Right away !~

		IF ~~ THEN DO ~SetGlobal("JO_JOIN","LOCALS",0)

			SetTokenGlobal("JO_JOIN","LOCALS","JO_JOIN")
			SetTokenGlobal("JO_JOIN_DEV_MODE","GLOBAL","JO_JOIN_DEV_MODE")
			SetTokenGlobal("JO_JOIN_BLOP","GLOBAL","JO_JOIN_BLOP")

			SetTokenGlobal("JO_NOJOIN","GLOBAL","JO_NOJOIN")
			SetTokenGlobal("JO_NOJOIN_LOCALS","LOCALS","JO_NOJOIN_LOCALS")
			SetTokenGlobal("JO_JOIN_IS_JOINING","LOCALS","JO_JOIN_IS_JOINING")
			SetTokenGlobal("JO_JOINI","LOCALS","JO_JOINI")
			SetTokenGlobal("JO_JOIN_TALK","LOCALS","JO_JOIN_TALK")
			SetTokenGlobal("JO_JOIN_SET_JOINX","LOCALS","JO_JOIN_SET_JOINX")


			SetTokenGlobal("JO_JOIN_PRIVACY","LOCALS","JO_JOIN_PRIVACY")
			SetTokenGlobal("JO_JOIN_INDEPANDANCE","LOCALS","JO_JOIN_INDEPANDANCE")


			SetTokenGlobal("JO_Myself_LeaveParty","LOCALS","JO_Myself_LeaveParty")


	//		SetTokenGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL","JO_JOIN_PARTY_SWITCH")
	//		SetTokenGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL","JO_JOIN_TRAVELER_SWITCH")
	//		SetTokenGlobal("JO_JOIN_MY_SWITCH","LOCALS","JO_JOIN_MY_SWITCH")


			SetTokenGlobal("JO_JOIN_NEVER_BANTER","LOCALS","JO_JOIN_NEVER_BANTER")
			SetTokenGlobal("JO_JOIN_NEVER_SWITCH","LOCALS","JO_JOIN_NEVER_SWITCH")
			SetTokenGlobal("JO_JOIN_NEVER_FILL","LOCALS","JO_JOIN_NEVER_FILL")
			SetTokenGlobal("JO_JOIN_QUICK_NEVER_JOIN","LOCALS","JO_JOIN_QUICK_NEVER_JOIN")


			SetTokenGlobal("JO_JOIN_WANNABE_INIT","LOCALS","JO_JOIN_WANNABE_INIT")


			SetTokenGlobal("JO_JOIN_NO_SWITCH_PARTY","GLOBAL","JO_JOIN_NO_SWITCH_PARTY")
			SetTokenGlobal("JO_JOIN_SWITCH_TIMER","LOCALS","JO_JOIN_SWITCH_TIMER")
			SetTokenGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL","JO_JOIN_SWITCHING_PARTY")
			SetTokenGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS","JO_JOIN_READY_TO_SWITCH")
			SetTokenGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS","JO_JOIN_SWITCH_WITH_ME")


			SetTokenGlobal("JO_JOIN_NO_QUICK_SWITCH","GLOBAL","JO_JOIN_NO_QUICK_SWITCH")
			SetTokenGlobal("JO_JOIN_QUICK_JOIN_TIMER","LOCALS","JO_JOIN_QUICK_JOIN_TIMER")
			SetTokenGlobal("JO_JOIN_QUICK_SWITCH","LOCALS","JO_JOIN_QUICK_SWITCH")


			SetTokenGlobal("JO_JOIN_NO_FILL_PARTY","GLOBAL","JO_JOIN_NO_FILL_PARTY")
			SetTokenGlobal("JO_JOIN_FILL_PARTY","LOCALS","JO_JOIN_FILL_PARTY")
			SetTokenGlobal("JO_JOIN_FORCE_FILL_PARTY","LOCALS","JO_JOIN_FORCE_FILL_PARTY")


			SetTokenGlobal("JO_JOIN_CAMPAIGN_BANTER","GLOBAL","JO_JOIN_CAMPAIGN_BANTER")
			SetTokenGlobal("JO_JOIN_BANTER_TIMER","GLOBAL","JO_JOIN_BANTER_TIMER_G")
			SetTokenGlobal("JO_JOIN_BANTER_TIMER","LOCALS","JO_JOIN_BANTER_TIMER_L")
			SetTokenGlobal("JO_JOIN_BANTER_INTERACT","LOCALS","JO_JOIN_BANTER_INTERACT")
			SetTokenGlobal("JO_JOIN_BANTER_BLOCK","GLOBAL","JO_JOIN_BANTER_BLOCK")
			SetTokenGlobal("JO_JOIN_DREAM_DONE","LOCALS","JO_JOIN_DREAM_DONE")
			SetTokenGlobal("JO_JOIN_DREAM_REST","GLOBAL","JO_JOIN_DREAM_REST")


			SetTokenGlobal("JO_JOIN_Move_Around","GLOBAL","JO_JOIN_Move_Around")
			SetTokenGlobal("JO_JOIN_Move_Done","LOCALS","JO_JOIN_Move_Done")


			SetTokenGlobal("JO_JOIN_FORCE_HIDE","GLOBAL","JO_JOIN_FORCE_HIDE")
			SetTokenGlobal("JO_JOIN_CUTSCENE","GLOBAL","JO_JOIN_CUTSCENE")
			SetTokenGlobal("JO_JOIN_HIDE_CUTSCENE","LOCALS","JO_JOIN_HIDE_CUTSCENE")
			SetTokenGlobal("JO_JOIN_IS_HIDDEN","LOCALS","JO_JOIN_IS_HIDDEN")


			SetTokenGlobal("JO_JOIN_CAMPAIGN_EET","GLOBAL","JO_JOIN_CAMPAIGN_EET")
			SetTokenGlobal("JO_JOIN_CAMPAIGN","GLOBAL","JO_JOIN_CAMPAIGN")
			SetTokenGlobal("JO_JOIN_PLAYER1_INIT","GLOBAL","JO_JOIN_PLAYER1_INIT")
			SetTokenGlobal("JO_JOIN_TRAVELER_NUM","GLOBAL","JO_JOIN_TRAVELER_NUM")


			SetTokenGlobal("JO_JOIN_TALK_TRANSITION","LOCALS","JO_JOIN_TALK_TRANSITION")
			SetTokenGlobal("JO_JOIN_END_OF_WATCH","LOCALS","JO_JOIN_END_OF_WATCH")
			SetTokenGlobal("JO_JOIN_END_OF_SOD","LOCALS","JO_JOIN_END_OF_SOD")
			SetTokenGlobal("JO_JOIN_END_OF_BG1","LOCALS","JO_JOIN_END_OF_BG1")


			SetTokenGlobal("JO_JOIN_FORCE_LOAD","GLOBAL","JO_JOIN_FORCE_LOAD")
			SetTokenGlobal("JO_JOIN_LOADING_SWITCH","GLOBAL","JO_JOIN_LOADING_SWITCH")
			SetTokenGlobal("JO_JOIN_LOAD","LOCALS","JO_JOIN_LOAD")
			SetTokenGlobal("JO_JOIN_LOADING_PLAYER","LOCALS","JO_JOIN_LOADING_PLAYER")
			SetTokenGlobal("JO_JOIN_LOADING_MAX","LOCALS","JO_JOIN_LOADING_MAX")
			SetTokenGlobal("JO_JOIN_LOAD_PARTY_WAIT","GLOBAL","JO_JOIN_LOAD_PARTY_WAIT")


	//		SetTokenGlobal("JO_TRAVELER_%Death_var%","GLOBAL","JO_TRAVELER_%Death_var%")
			SetTokenGlobal("JO_TRAVELER_Myself","LOCALS","JO_TRAVELER_Myself")
			SetTokenGlobal("JO_JOIN_IS_TRAVELER","LOCALS","JO_JOIN_IS_TRAVELER")
			SetTokenGlobal("JO_Myself_Valid","LOCALS","JO_Myself_Valid")
			SetTokenGlobal("JO_Myself_InParty","LOCALS","JO_Myself_InParty")
			SetTokenGlobal("JO_Myself_AllowDead","LOCALS","JO_Myself_AllowDead")
			SetTokenGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS","JO_JOIN_SLEEPING_DEAD")


			SetTokenGlobal("JO_JOIN_PROTAGONIST","GLOBAL","JO_JOIN_PROTAGONIST")
			SetTokenGlobal("JO_JOIN_PARTYSLOT","LOCALS","JO_JOIN_PARTYSLOT")

			DisplayString(Myself,@104)~ EXIT
	END


END // JO_JOINShow_us












/*
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
*/
