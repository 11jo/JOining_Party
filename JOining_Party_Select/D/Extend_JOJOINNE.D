
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
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 3
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...switch with %%Death_var%_name% !~
			DO ~ActionOverride(Player2,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
				ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_Fill_Party","LOCALS",1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 4
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...switch with %%Death_var%_name% !~
			DO ~ActionOverride(Player3,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
				ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_Fill_Party","LOCALS",1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 5
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...switch with %%Death_var%_name% !~
			DO ~ActionOverride(Player4,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
				ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_Fill_Party","LOCALS",1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 6
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...switch with %%Death_var%_name% !~
			DO ~ActionOverride(Player5,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
				ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_Fill_Party","LOCALS",1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 7
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...discuss with %%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT
  IF ~OR(2)
			!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
			!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
		!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~...switch with %%Death_var%_name% !~
			DO ~ActionOverride(Player6,SetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS",0))
				ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_Fill_Party","LOCALS",1))~ EXIT
END
