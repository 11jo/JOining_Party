# JOining Party

[![Release](https://img.shields.io/github/v/release/11jo/JOining_Party?include_prereleases&color=41788a)](https://github.com/11jo/JOining_Party/releases)
[![Published](https://img.shields.io/github/release-date-pre/11jo/JOining_Party?display_date=published_at&label=published&color=014a69)](https://github.com/11jo/JOining_Party/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/11jo/JOining_Party/total?color=41788a)](https://github.com/11jo/JOining_Party/releases)

[![Language](https://img.shields.io/badge/language-english-014a69)](https://github.com/11jo/JOining_Party/releases)
[![Games](https://img.shields.io/badge/games-BG:EE%20%7C%20BG2:EE%20%7C%20EET-41788a)](https://github.com/11jo/JOining_Party/releases)

<!--

![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2F11jo%2FJOining_Party&countColor=41788a&style=flat)

[![Platform](https://img.shields.io/badge/platform-Windows%20%a0%20macOS%20%a0%20Linux%20%a0%20Project%20Infinity-014a69)](https://github.com/11jo/JOining_Party/releases)
-->

**Author** : ***


### Work In Progress : Only for testing purpose !!!



## Instruction :
----------------

After mods that add any dialog or script options related to NPC.

- Choose available NPC groups to modify
  - Continuous original NPC
  - BG1 original NPC
  - SoD original NPC
  - BG2EE original NPC
  - Mods BG1 NPC
  - Mod BG2 NPC

- Install componant All-Out (**Installation could last between 10 to 20 minutes depending of the number of NPCs chosen**)
  - Add to any InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead... Familiar reference to make it count as party member.

- Install componant All-In
  - Install scripts, dialogs, items, spells... used to make the mod work.


## Description :
----------------

- Use the the special ability to convert NPC to Familiar.
- Keep one free party slot to allow NPC switch.
- You can quickly acces (5 seconds) to stats and inventory when they switch in party.
- You can completly reinteger the Npc in party, use again the same special ability on the chosen NPC and talk to the NPC, they will have several dialog options.
- When loading a save the NPCs have to switch once before being reliably available for script and dialog.

Files : 

- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select.tph)  
   - Search `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each selected NPCs death variable.

- [JOining_Party_Select_Myself.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Myself.tph)  
   - Search `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each existing Myself.

- [JOining_Party_Select_Core.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Core.tph)  
   - Implement scripts and dialogs for each selected NPCs.

- [JOining_Party_Select_End.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_End.tph)  
   - Implement a little script to other (not selected) NPCs.

- [All_In.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/All_In.BAF)  
   - Added to each selected NPCs to deal with Npc to Familiar switch.

- [%JO_JOIN%.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf)  
   -  JO_JOIN1.BAF to JO_JOIN5.BAF are scripts added to Familiar OVERRIDE script, only for a short time, it will set the right dialog and script depending of the NPC.

- [JO_JOINI.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINI.BAF)  
   - Script added to Familiar GENERAL script, will remain, it will deal with switch order and Familiar behavior.

- [Join_ability](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/Join_ability.baf)  
   - Add special ability to Charname, deal with dialog options with familiars and set NPCs files depending of the game (BGEE / BG2EE)

- [tp2](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Party_Select.tp2)  
   - Workaround for EET and else, NPC choice and core installation

- [All_In.D](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/D/All_In.D)  
   - Block dialog added to each NPC dialogJ, Triggering when talking to familiar after using special ability.

- [jominhp1.itm](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Itm)  
   - Lesser copy of MINHP1 to avoid only death

- [jo_join.spl](https://github.com/11jo/JOining_Party/tree/main/JOining_Party_Select/Spl)  
   - Special ability for Charname, will simply set a LOCALS to 1 on the targeted NPC.


## Variables :
----------------

GLOBAL :

---

- Global("JO_%Death_var%_AllowDead","GLOBAL",0)
- Global("JO_%Death_var%_InParty","GLOBAL",0)
- Global("JO_%Death_var%_Valid","GLOBAL",0)
   - Replace regular (InParty, IsValidForPartyDialogue and InPartyAllowDead)

---

- Global("JO_NOJOIN","GLOBAL",0)
   - Prevent two NPC to switch at the same time.

---

- GlobalTimer("JO_JOIN_JOIN","GLOBAL",NINE_ROUNDS)
   - Timer for switching Familiar to NPCs regulary.

---

- Global("JO_JOIN_BGEE_EET","GLOBAL",0)
- Global("JO_JOIN_BG2EE","GLOBAL",0)
- Global("JO_JOIN_ToB","GLOBAL",0)
- Global("%JO_JOIN_BG%","GLOBAL",0)
- Global("JO_JOIN_SoD","GLOBAL",0)
   - Set variable corresponding to game campaign to enable relevant override scripts and joining dialog. Used in %JO_JOIN%.baf (1.2.3.4.5).

---

- Global("JO_Join_InParty_Myself","GLOBAL",0)
   - Special Charname at character creation, to be sure DPLAYER3.BCS is set.

---

LOCALS :

---

- Global("JO_AllowDead_Myself","LOCALS",0)
- Global("JO_InParty_Myself","LOCALS",0)
- Global("JO_Valid_Myself","LOCALS",0)
   - Same as the GLOBAL %Death_var% above but for Myself.

---

- Global("JO_JOIN_DEADLY_DEAD","LOCALS",0)
   - Used along "IsValid" when familiar are dead but not really.

---

- Global("JO_JOIN_SLEEPING_DEAD","LOCALS",0)
   - Set when Familiar health is below 5HP.

---

- Global("JO_JOIN_SLEEPING_DEADLY","LOCALS",0)
   - Same as above but not implemented yet.

---

- Global("JO_JOIN_TALK","LOCALS",0)
   - For first time becoming a familiar and have the relevant text line "We are now fellow travelers."

---

- Global("JO_JOINI","LOCALS",0)
   - Set when familiar switch in party, and enable block to return to familiar state.

---

- Global("JO_%Death_var%_ClearActions","LOCALS",0)
   - Not tested yet, to make familiar rest or clearaction along party members.

---

- Global("JO_%Death_var%_REST","LOCALS",0)
   - Not tested yet, to make familiar rest or clearaction along party members.

---

- Global("JO_JOIN_CLOSE_PlayerX","LOCALS",0)
   - Through dialog with familiar, used to link a familiar to a specific party member. See All_In.D

---

- Global("JO_JOIN_SIGHT_PlayerX","LOCALS",0)
   - Through dialog with familiar, used to link a familiar to a specific party member. See All_In.D

---

- Global("JO_JOIN","LOCALS",0)
   - Used by Charname ability to change NPC to familiar.
   - Used by Charname ability to allow special dialog with familiar.
   - Used in %JO_JOIN%.baf (1.2.3.4.5) to set relevant override scripts and joining dialog.

---

- Global("JO_JOIN_CLEAR","LOCALS",0)
   - Not implemented yet, will be used to keep assigned script when switching in and out party.

---

- Global("JO_JOIN_ACTION","LOCALS",0)
   - Not implemented yet, used along Global("JO_JOIN_CLEAR","LOCALS",0).

---

- Global("JO_FIRST_JOIN_JOIN","LOCALS",0)
   - Not meant to stay after release, it just launch the switch "only one time" quickly after becoming a familiar for the first time, to verify that the switch work for the choosen NPC.

---

- Global("JO_JOIN_SCRIPT_NOMOVE","LOCALS",0)
   - Not implemented yet, Through dialog with familiar, used to make it not follow the group. See All_In.D

---

- Global("JO_JOIN_RANGE","LOCALS",0)
   - The familiar will go close to Charname or linked party member before switching in party.

---

- Global("JO_JOIN_FEELING","LOCALS",0)
   - Not quite tested yet, DisplayStringHead to notify familiar health statut.

---

- Global("JO_JOIN_XPGT_X","LOCALS",0)
   - Not implemented yet, will hopefully add the relevant XP to familiar to be on the same level as party members.

---



## Installation / Uninstallation :
---------------------------------


Double-click the JOining_Party.exe file and install to your main game directory
Once the install program has finished, it will launce the WeiDU installer program. Simply follow the on-screen instructions in the new DOS window. 

Though this mod is made using the WeiDU standard, and *should* be compatible with all other WeiDU-based mods, there is always the possibility for conflicts. 

Uninstalling is simple. Double-click the setup-JOining_Party.exe file and enter the given commands for Uninstallation.
Afterwards, you may delete the following files:

    JOining_Party.exe
    JOining_Party.tp2
    JOining_Party.debug
    and the contents of the "JOining_Party" subfolder 


## Version History :
--------------------

- Alpha.0.0.0

- Alpha.0.0.1

- Alpha.0.0.2