
## Files Description

- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_BCS.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each selected NPCs death variable in BCS.
   
- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_DLG.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each selected NPCs death variable in DLG.

- [JOining_Party_Select_Myself.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Myself.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each existing Myself in DLG and BCS.

- [JOining_Party_Select_Joined.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Joined.tph)  
   - Implement a little script to other (not selected) NPCs.

- [JOining_Party_Select_End.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_End.tph)  
   - Workarounds / Corrections for scripts, dialogue and else.

- [JOining_Party_Select_Core.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core.tph)  
   - Implement scripts and dialogs for each selected NPCs.

- [All_In.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/All_In.BAF)  
   - Added to each selected NPCs to deal with Npc to Familiar switch and statut.

- [%JO_JOIN%.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOIN)  
   -  JO_JOIN1.tpa to JO_JOIN5.tpa are specific additions for Familiar, it will set the right dialog and script depending of the campaign and NPC/Familiar.

- [JO_JOINI.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINI.BAF)  
   - Script added to Familiar GENERAL script, will remain, it will deal with switch order and Familiar behavior.

- [JO_JOINX.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINX.BAF)  
   - Script added to Familiar RACE script for a very short moment, in order to deal with XP and  other settings for Familiar.

- [Join_ability](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/Join_ability.baf)  
   - Add special ability to Charname, deal with dialog options with familiars and set NPCs files depending of the game (BGEE / BG2EE)

- [tp2](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Party_Select.tp2)  
   - Workaround for EET and else, NPC choice and core installation

- [All_In.D](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/D/All_In.D)  
   - Block dialog added to each NPC Joining_dialog, Triggering when talking to familiar after using special ability.

- [jominhp1.itm](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Itm)  
   - Lesser copy of MINHP1 to avoid only permanent death

- [jo_join.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Special ability for Charname, will simply set a LOCALS to 1 on the targeted NPC.


## Variables


| Name | Area | Description | Values |
| --- | --- | --- | --- |
| JO_Myself_AllowDead | L | Replace regular `InPartyAllowDead(Myself)` | 0: False<br>Other: True |
| JO_Myself_InParty | G | Replace regular `InParty(Myself)` | 0: False<br>Other: True |
| JO_Myself_Valid | L | Replace regular `IsValidForPartyDialog(Myself)` | 0: False<br>Other: True |
| JO_NOJOIN | G | Familiars can no longer switch | 0: False<br>Other: True |
| JO_JOIN_CAMPAIGN | G | Set variable corresponding to game campaign to enable relevant override scripts and joining dialog |1: BGEE<br>2: SoD<br>3: BG2EE - SoA<br>4: BG2EE - ToB<br>5: EET<br>Other: not initialized
| JO_JOIN_PLAYER1_INIT | G | Special Charname at character creation, to be sure DPLAYER3.BCS is set | 0: False<br>Other: True |
| JO_JOIN_PLAYER_INIT | L | Special exportable character at creation | 0: False<br>Other: True |
| JO_TRAVELER_%Death_var% | G | Set if the NPC is a familiar, used to deal with LeaveParty() | 0: False<br>Other: True |
| JO_%Death_var%_LeaveParty | G | If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog | 0: False<br>Other: True |
| JO_Myself_LeaveParty | L | If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog | 0: False<br>Other: True |
| JO_JOIN_JOIN | L | Timer for switching Familiar to NPCs regulary | n/a |
| JO_JOIN_SLEEPING_DEAD | L | Familiar sleeping state | 1: Familiar health is below 5HP<br>2: Familiar health is below 5HP and after spell JOIN648 is applied<br>3: Familiar health is above 4HP and after spell JOIR648 is applied<br>Other: Normal state |
| JO_JOIN_TALK | L | For first time becoming a familiar | 0: False<br>Other: True |
| JO_JOINI | L | Set when familiar switch in party, and enable block to return to familiar state | 0: False<br>Other: True |
| JO_JOIN_LINK_PLAYER_ID | L | Used to link a familiar to a specific party member | 1: Player1<br>...<br>6: Player6<br>Other: Player1Fill|
| JO_JOIN_LINK_TYPE | L | Used to indicate the type of link to a specific party member | 1: Teleport if > 70, move if range > 50<br>2: Teleport if > 70, move if range > 5<br>Other: Teleport if range > 70 |
| JO_JOIN | L | Transform to familiar | 1: process of becoming familiar is actived<br>2: process is over<br>Other: normal status |
| JO_JOIN_CLEAR | L | Used to keep assigned RACE script (JOINX) when switching in and out party | 1: During switch, before JoinParty<br>2: Script needs to be updated<br>3: Script is up to date<br>Other: nothing|
| JO_JOIN_IS_JOINING | L | The familiar will go close to Charname or linked party member before switching in party | 0: False<br>Other: True |
| JO_JOIN_FEELING | L | Not quite tested yet, DisplayString to notify familiar health percentage statut | 1: 50 ≤ health < 69<br>2: 30 ≤ health < 49<br>3: 15 ≤ health < 29<br>4: 5 ≤ health < 14<br>Other: nothing|
| JO_JOIN_CUTSCENE | G | Cutscene is currently active | 0: False<br>Other: True |
| JO_NEVER_CUTSCENE | L | Active or deactive familiar presence in cutscene | 0: False<br>Other: True |
| JO_NEVER_JOIN | L | Prevent the familiar to switch, WARNING will not be available for most interactions. | 0: False<br>Other: True |
| JO_JOIN_BD0120 | L | Specific to Korlaz donjon, used to keep familiar along. | 0: False<br>Other: True |
| JO_JOIN_SLEEPING_DEADLY | L | Not implemented yet | 
| JO_JOIN_ACTION | L | Not implemented yet | 



