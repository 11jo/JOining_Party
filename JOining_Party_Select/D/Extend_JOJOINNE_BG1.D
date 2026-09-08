
// Player1
EXTEND_BOTTOM JOJOINNE 4
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^-... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",1))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player1))~ EXIT
END

// Player2
EXTEND_BOTTOM JOJOINNE 7
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",2))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player2))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 10
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player2,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player2,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e... With %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player2,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player2,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

// Player3
EXTEND_BOTTOM JOJOINNE 13
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",3))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player3))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 16
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player3,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player3,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e... With %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player3,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player3,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT

END

// Player4
EXTEND_BOTTOM JOJOINNE 19
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",4))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player4))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 22
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player4,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player4,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e... With %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player4,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player4,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

// Player5
EXTEND_BOTTOM JOJOINNE 25
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",5))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player5))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 28
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player5,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player5,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e... With %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player5,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player5,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END

// Player6
EXTEND_BOTTOM JOJOINNE 31
  IF ~Global("JO_JOIN_SWITCHING_PARTY","GLOBAL",0)
  	OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))~ THEN REPLY ~^0xFF7f6000... With %%Death_var%_name%^- !~
			DO ~ActionOverride("JOJOINNE",DestroySelf())
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_TALK_PLAYER","LOCALS",6))
				ActionOverride("%Death_var%",StartDialogueNoSet(Player6))~ EXIT
END

EXTEND_BOTTOM JOJOINNE 34
  IF ~OR(2)
		!Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
		!TriggerOverride("%Death_var%",Global("JO_JOIN_IS_TRAVELER","LOCALS",0))
	!TriggerOverride("%Death_var%",Global("JO_Myself_Valid","LOCALS",0))
	!TriggerOverride(Player6,Global("JO_JOIN_WANNABE_TRAVELER","LOCALS",0))
	TriggerOverride(Player6,Global("JO_JOIN_PARTY_MEMBER","LOCALS",0))~ THEN REPLY ~^0xFF16537e... With %%Death_var%_name%^- !~
			DO ~SetGlobal("JO_JOIN_SWITCHING_PARTY","GLOBAL",2)
				ActionOverride(Player6,SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",3))
				ActionOverride(Player6,SetGlobal("JO_JOIN","LOCALS",1))
				ActionOverride("%Death_var%",SetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS",2))~ EXIT
END
