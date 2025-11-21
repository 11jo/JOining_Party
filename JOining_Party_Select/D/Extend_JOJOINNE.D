
/*
		COPY ~weidu_external/JOining_Party_Select/D/All_In.D~ ~weidu_external/JOining_Party_Select/D/All_In.D~
			REPLACE_TEXTUALLY ~// Original Imoen~ ~~~~~IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT~~~~~
			PRINT ~    %Death_var% extend All_In.D
			~

*/

EXTEND_BOTTOM JOJOINNE 2
  IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 3
  IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 4
  IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 5
  IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 6
  IF ~OR(2)
			Global("JO_TRAVELER_%Death_var%","GLOBAL",1)
			TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",1))
		TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",1))~ THEN REPLY ~...%%Death_var%_name% !~
			DO ~ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				SmallWait(1) 
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT
END
