
## Files Description
   
- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select.tph)  
   - DeathVars selection for JOining_Party_Select_Base_BCS.tph and JOining_Party_Select_Base_BCS.tph
   - Real Traveler only.
   
- [JOining_Party_Select_Base.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Base.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for all NPCs death variable in game (DLG and BCS).

- [JOining_Party_Select_Base_BCS.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Base_BCS.tph) 
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for all NPCs death variable or existing Myself in game. 
   - Extend party ACTIONS to real traveler for each selected NPCs death variable in BCS. 
   - Search and replace Cutscenes related actions to avoid unintended behavior and allow traveler deactivation.
   
- [JOining_Party_Select_Base_DLG.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Base_DLG.tph) 
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for all NPCs death variable in game.
   - Extend party actions to real traveler for each selected NPCs death variable in DLG. 
   - Search and replace Cutscenes related actions to avoid unintended behavior and allow traveler deactivation.

- [JOining_Party_Select_Joined.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Joined.tph) 
   - Implement a little script to other (not selected) NPCs. (All_NPC_JOIN.baf)
   - Check for ToB NPC without xxx25.cre to expend xxx25.bcs anyway.

- [JOining_Party_Select_Fix.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Fix.tph)  
   - Special Cases and Workarounds / Corrections for scripts, dialogues and else.
   - Real Traveler only (associated to JOining_Party_Select_BCS and JOining_Party_Select_DLG)

- [JOining_Party_Select_End.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_End.tph)  
   - Special Cases and Workarounds / Corrections for scripts, dialogues and else. 
   - Create All_In.baf for each selected NPCs.
   - Create and expend Charname gestion dialog for each selected NPCs.

- [JOining_Party_Select_Core_Original.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core_Original.tph)  
   - Implement scripts and dialogs for each selected original NPCs. (All_TRAVELER_JOIN, All_In.baf, JO_JOIN, Banter.baf)

- [JOining_Party_Select_Core_Mod_BG1.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core_Mod_BG1.tph)  
   - Implement scripts and dialogs for each selected mod bg1 NPCs. (All_TRAVELER_JOIN, All_In.baf, JO_JOIN, Banter.baf)

- [JOining_Party_Select_Core_Mod_BG2.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core_Mod_BG2.tph)  
   - Implement scripts and dialogs for each selected mod bg2 NPCs. (All_TRAVELER_JOIN, All_In.baf, JO_JOINI, JO_JOIN, Banter.baf)

- [JOining_Party_Select_Core.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core.tph)  
   - Implement scripts and dialogs, (JO_JOINI, JO_JOINX). Extend startings areas scripts, baldur's.bcs and dplayer3.bcs
   - Add items, effects and spells.
   
- [JOining_Traveler.ini](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Traveler.ini)  
   - Select desired Travelers, set to 1 to install or 0 to not install.

- [JOining_Traveler.tpa](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Traveler.tpa)  
   - Read JOining_Traveler.ini to set player NPCs to Traveler selection

- [Always_as_traveler.tpa](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/Always_as_traveler.tpa)  
   - Enable selected travelers installation.
   - Launch JOining_Traveler.tpa.

- [Not_so_Always.tpa](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/Not_so_Always.tpa)  
   - Always block but only for main componant.
   - Workaround for EET and else.
   - Launch Always_as_traveler.tpa.

- [Switch_Timer.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/Switch_Timer.tph)  
   - Install relevant choice for second and third componants (Switch timer and Banter timer).

- [All_In.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/All_In.BAF)  
   - Added to each selected NPCs to deal with Npc to Familiar switch and statut.

- [%JO_JOIN%.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOIN)  
   -  JO_JOIN1.tpa to JO_JOIN5.tpa are specific additions for Familiar, it will set the right dialog and script depending of the campaign and NPC/Familiar.

- [%BANTER%.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf)  
   -  Banter_BG1_BG2_BGSoD_EET.tpa are specific additions for Familiar, it will add a script block to set the right banter dialog to each travelers.

- [JO_JOINI.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINI.BAF)  
   - Script added to Familiar GENERAL script, will remain, it will deal with switch order and Familiar behavior.
   
- [JO_JOINX.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINX.BAF)  
   - Script added to Familiar RACE script for a very short moment, in order to deal with XP and  other settings for Familiar.
   
- [JOJOINNE.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JOJOINNE.BAF)  
   - Script related to the invisible creature allowing Charname travelers options dialog.

- [Join_ability](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/Join_ability.baf)  
   - Add special ability to Charname, deal with dialog options with familiars and set NPCs files depending of the game (BGEE / BG2EE)

- [tp2](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Party_Select.tp2)  
   - Core installation and componants

- [All_In.D](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/D/All_In.D)  
   - Block dialog added to each NPC Joining_dialog, Triggering when talking to familiar after using special ability.

- [JOJOINNE.D](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/D/JOJOINNE.D)  
   - Dialog for invisible creature allowing Charname travelers options dialog.

- [Extend_JOJOINNE.D](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/D/Extend_JOJOINNE.D)  
   - Workaround for invisible creature dialog to retrieve travelers names based on DeathVars.

- [jominhp1.itm](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Itm)  
   - Modified copy of MINHP1 to deal with JO_JOIN_SLEEPING_DEAD situation.

- [jo_vali0.eff](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Eff)  
   - Set Global("JO_Myself_Valid","LOCALS",1).

- [jo_join.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Special ability for Charname, will simply set a LOCALS to 1 on the targeted NPC.
   
- [join647.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Spell associated to jominhp1.itm and JO_JOIN_SLEEPING_DEAD situation.
   
- [JOIN648.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Spell associated to jominhp1.itm and npc fall when sleeping dead.
   
- [JOIR648.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Spell associated to jominhp1.itm and npc wake up after sleeping dead.

- [JOJOINNE.cre](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Cre)  
   - Invisible creature allowing Charname travelers options dialog.


## Variables


| Name | Area | Description | Values |
| --- | --- | --- | --- |
| JO_Myself_AllowDead | L | Replace regular `InPartyAllowDead(Myself)` | 0: False<br>Other: True |
| JO_Myself_InParty | L | Replace regular `InParty(Myself)` | 0: False<br>Other: True |
| JO_Myself_Valid | L | Replace regular `IsValidForPartyDialog(Myself)` | 0: False<br>Other: True |
| JO_NOJOIN | G | Familiars can no longer switch | 0: False<br>Other: True |
| JO_JOIN_CAMPAIGN | G | Set variable corresponding to game campaign to enable relevant override scripts and joining dialog |1: BGEE<br>2: SoD<br>3: BG2EE - SoA<br>4: BG2EE - ToB<br>5: EET<br>Other: not initialized
| JO_JOIN_PLAYER1_INIT | G | Special Charname at character creation, to be sure DPLAYER3.BCS is set | 0: False<br>Other: True |
| JO_JOIN_PLAYER_INIT | L | Special exportable character at creation | 0: False<br>Other: True |
| JO_TRAVELER_%Death_var% | G | Set if the NPC is a familiar, used to deal with LeaveParty() | 0: False<br>Other: True |
| JO_%Death_var%_LeaveParty | G | If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog | 0: False<br>Other: True |
| JO_Myself_LeaveParty | L | If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog | 0: False<br>Other: True |
| JO_JOIN_JOIN | L | Timer for switching Familiar to NPCs regulary | n/a |
| JO_JOIN_SLEEPING_DEAD | L | If familiar is sleeping dead | 0: False<br>Other: True |
| JO_JOIN_TALK | L | For first time becoming a familiar | 0: False<br>Other: True |
| JO_JOINI | L | Set when familiar switch in party, and enable block to return to familiar state | 0: False<br>Other: True |
| JO_JOIN_LINK_PLAYER_ID | L | Used to link a familiar to a specific party member | 1: Player1<br>...<br>6: Player6<br>Other: Player1Fill|
| JO_JOIN_LINK_TYPE | L | Used to indicate the type of link to a specific party member | 1: Teleport if > 70, move if range > 50<br>2: Teleport if > 70, move if range > 5<br>Other: Teleport if range > 70 |
| JO_JOIN | L | Transform to familiar | 1: process of becoming familiar is actived<br>2: process is over<br>Other: normal status |
| JO_JOIN_IS_TRAVELER | L | If the character is traveler regardless of its EA | 0: False<br>Other: True |
| JO_JOIN_CLEAR | L | Used to keep assigned RACE script (JOINX) when switching in and out party | 1: During switch, before JoinParty<br>2: Script needs to be updated<br>3: Script is up to date<br>Other: nothing|
| JO_JOIN_IS_JOINING | L | The familiar will go close to Charname or linked party member before switching in party | 0: False<br>Other: True |
| JO_JOIN_CUTSCENE | G | Cutscene is currently active | 0: False<br>Other: True |
| JO_JOIN_HIDE_DURING_CUTSCENE | L | Active or deactive familiar presence in cutscene | 0: False<br>Other: True |
| JO_JOIN_IS_HIDDEN_BY_CUTSCENE | L | Familiar is currently Deactivate by a cutscene | 0: False<br>Other: True |
| JO_NEVER_JOIN | L | Prevent the familiar to switch, WARNING will not be available for most interactions. | 0: False<br>Other: True |
| JO_JOIN_BD0120 | L | Specific to Korlaz donjon, used to keep familiar along. | 0: False<br>Other: True |
| JO_JOIN_Move_Around | G | Charname general dialog set different number to make all current traveler reaction at once | n/a |
| JO_JOIN_Move_Done | L | Related to JO_JOIN_Move_Around used to make the script apply only once until next command | 0: False<br>1: True<br>
| JO_JOIN_SWITCHING_PARTY | G | Prevent Switching party between traveler and party member when loading a save. | 0: True<br>Other: False |
| JO_JOIN_SWITCH_TIMER | L | Timer for Switching party between traveler and party member. | n/a |
| JO_JOIN_READY_TO_SWITCH | L | Set to 1 when a party member or a traveler is available to switch. | 0: False<br>1: True<br>
2: Switch between traveler and party member in process
| JO_JOIN_SWITCH_WITH_ME | L | Used to choose with Player2 or Player3 or Player4 or Player5 or Player6. | 0: Available<br>2: Player2 chosen<br><br>3: Player3 chosen<br>4: Player4 chosen<br>5: Player5 chosen<br>6: Player6 chosen
2: Switch between traveler and party member in process |
| JO_JOIN_BANTER_TIME | L | Timer for fire banters when traveler. | n/a |
| JO_JOIN_LOAD_SWITCH | L | Party member variable when temporary removed at loading. | 0: Available<br>1: processing<br>
2: party member reintegration in process
| JO_JOIN_LOAD | L |Secure travelers switch when loading a save. | 1: Traveler switch at loading in process<br>2: False |
| JO_JOIN_Wannabe | L | Party member eligible to become traveler. | 0: False<br>1: True<br>

---

### CLUAGLOBAL

CLUAConsole:
	GetGlobal("JO_JOIN_CAMPAIGN","GLOBAL")
	GetGlobal("JO_JOIN_Move_Around","GLOBAL")
	GetGlobal("JO_JOIN_PARTY_SWITCH","GLOBAL") // At loading : Party members awaiting to reintegrate the group
	GetGlobal("JO_JOIN_TRAVELER_SWITCH","GLOBAL") // At loading : Travelers processing switch.
	GetGlobal("JO_NOJOIN","GLOBAL") // A traveler is currently switching
	GetGlobal("JO_JOIN_CUTSCENE","GLOBAL")
	GetGlobal("JO_JOIN_PLAYER1_INIT","GLOBAL") // Baldur.bcs, security set DPLAYER3.bcs to Charname, only once.

### CLUALOCALS (Cursor on the character to return personnal variables)

CLUAConsole:
	GetGlobal("JO_Myself_Valid","LOCALS")
	GetGlobal("JO_Myself_AllowDead","LOCALS")
	GetGlobal("JO_Myself_InParty","LOCALS")

	GetGlobal("JO_JOIN_IS_TRAVELER","LOCALS") // NPC is a traveler
	GetGlobal("JO_JOIN_Wannabe","LOCALS") // Party members are available to leave the groupe at loading
	GetGlobal("JO_JOIN_NEVER_JOIN","LOCALS") // Temporarly prevent travelers to switch or join the group // Reinitialised at loading and when switching
	GetGlobal("JO_JOIN_NEVER_BANTER","LOCALS") // Prevent banter // Reactivate by dialg only
	GetGlobal("JO_JOIN_NEVER_SWITCH","LOCALS") // Prevent JO_JOIN_READY_TO_SWITCH and so Prevent switching place with party members

	GetGlobal("JO_JOIN","LOCALS")
	GetGlobal("JO_JOIN_IS_JOINING","LOCALS")
	GetGlobal("JO_JOINI","LOCALS")
	GetGlobal("JO_JOIN_TALK","LOCALS")
	GetGlobal("JO_JOIN_CLEAR","LOCALS")

	GetGlobal("JO_JOIN_Move_Done","LOCALS")
	GetGlobal("JO_JOIN_SLEEPING_DEAD","LOCALS")
	GetGlobal("JO_Myself_LeaveParty","LOCALS")
	GetGlobal("JO_JOIN_Fill_Party","LOCALS") // Allow traveler to join the group properly if free slots are available
	GetGlobal("JO_JOIN_IS_Wannabe","LOCALS") // First time InParty JO_JOIN_Wannabe is set to 1 only once
	GetGlobal("JO_JOIN_HIDE_DURING_CUTSCENE","LOCALS")
	GetGlobal("JO_JOIN_IS_HIDDEN_BY_CUTSCENE","LOCALS")

	GetGlobal("JO_JOIN_LOAD_TRAVELER","LOCALS") // Travelers switch quickly in party at loading
	GetGlobal("JO_JOIN_LOAD_PARTY","LOCALS") // Party members leave the groupe at loading

	GetGlobal("JO_JOIN_READY_TO_SWITCH","LOCALS") // Travelers and Party members are ready and available to switch their place.
	GetGlobal("JO_JOIN_SWITCH_WITH_ME","LOCALS") // Travelers and Party members are in process of switching place

	GetGlobal("JO_JOIN_JOIN","LOCALS")
	GetGlobal("JO_JOIN_BANTER_TIME","LOCALS")
	GetGlobal("JO_JOIN_SWITCH_TIMER","LOCALS")

	GetGlobal("JO_JOIN_PLAYER_INIT","LOCALS")
	GetGlobal("JO_JOIN_LINK_TYPE","LOCALS")
	GetGlobal("JO_JOIN_LINK_PLAYER_ID","LOCALS")

	GetGlobal("BDAI_DISABLE_ATTACK","LOCALS")
	GetGlobal("BDAI_ATTACK_MODE","LOCALS")
	GetGlobal("BDAI_DISABLE_ITEMS","LOCALS")
	GetGlobal("BDAI_DISABLE_OFFENSIVE","LOCALS")
	GetGlobal("BDAI_DISABLE_DEFENSIVE","LOCALS")
	GetGlobal("BDAI_DISABLE_SPECIAL","LOCALS")
	GetGlobal("BDAI_SKILL_MODE","LOCALS")