
/*
		COPY ~weidu_external/JOining_Party_Select/D/All_In.D~ ~weidu_external/JOining_Party_Select/D/All_In.D~
			REPLACE_TEXTUALLY ~// Original Imoen~ ~~~~~IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT~~~~~
			PRINT ~    %Death_var% extend All_In.D
			~

*/

EXTEND_BOTTOM JOJOINNE 2
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 3
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT
  IF ~Global("JO_JOIN_SWITCHING","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player2,Global("JO_JOIN_Wannabe","LOCALS",0))
	!TriggerOverride(Player2,Global("JO_JOIN_PARTY_MEMBER","LOCALS",1))
		~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",2)
				ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 4
  IF ~Global("JO_JOIN_SWITCHING","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player3,Global("JO_JOIN_Wannabe","LOCALS",0))
	!TriggerOverride(Player3,Global("JO_JOIN_PARTY_MEMBER","LOCALS",1))
		~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",2)
				ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 5
  IF ~Global("JO_JOIN_SWITCHING","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player4,Global("JO_JOIN_Wannabe","LOCALS",0))
	!TriggerOverride(Player4,Global("JO_JOIN_PARTY_MEMBER","LOCALS",1))
		~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",2)
				ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 6
  IF ~Global("JO_JOIN_SWITCHING","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player5,Global("JO_JOIN_Wannabe","LOCALS",0))
	!TriggerOverride(Player5,Global("JO_JOIN_PARTY_MEMBER","LOCALS",1))
		~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",2)
				ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 7
  IF ~Global("JO_JOIN_SWITCHING","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000...discuss with %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player6,Global("JO_JOIN_Wannabe","LOCALS",0))
	!TriggerOverride(Player6,Global("JO_JOIN_PARTY_MEMBER","LOCALS",1))
		~ THEN REPLY ~^0xFF16537e...switch with %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING","GLOBAL",2)
				ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END
