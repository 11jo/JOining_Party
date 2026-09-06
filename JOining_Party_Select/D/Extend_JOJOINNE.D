
/*
		COPY ~weidu_external/JOining_Party_Select/D/All_In.D~ ~weidu_external/JOining_Party_Select/D/All_In.D~
			REPLACE_TEXTUALLY ~// Original Imoen~ ~~~~~IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT~~~~~
			PRINT ~    %Death_var% extend All_In.D
			~

*/

EXTEND_BOTTOM JOJOINNE 2
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 3
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player2,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player2,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ GOTO JO_JOINShow_us
END

EXTEND_BOTTOM JOJOINNE 4
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player3,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player3,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ GOTO JO_JOINShow_us
END

EXTEND_BOTTOM JOJOINNE 5
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player4,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player4,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ GOTO JO_JOINShow_us
END

EXTEND_BOTTOM JOJOINNE 6
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player5,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player5,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ GOTO JO_JOINShow_us
END

EXTEND_BOTTOM JOJOINNE 7
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player6,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player6,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
	IF ~!Global("JO_JOIN_DEV_MODE","GLOBAL",0)~ THEN REPLY ~^0xFF2968A6Show us what you got.^-~ GOTO JO_JOINShow_us
END

APPEND JOJOINNE

IF ~~ THEN BEGIN JO_JOINShow_us
	SAY @104
		IF ~~ THEN DO ~
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
			SetTokenGlobal("JO_JOIN_PARTYSLOT","LOCALS","JO_JOIN_PARTYSLOT")~ EXIT
	END
END
