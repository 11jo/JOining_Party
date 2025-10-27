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


### Beta state !


**Installation could last between 10 to 30+ minutes depending of the number of NPCs chosen and the number of mods installed**

- Use the Charname **special ability** to convert NPC to Familiar.
- Keep **one free party slot** to allow NPC switch.
- You can **quickly acces** (5 seconds) to stats and inventory when they switch in party.
- You can **completly reinteger** the Npc in party, use again the same special ability on the chosen NPC and talk to the NPC, they will have **several dialog options**.

- When loading a save the **NPCs have to switch** once before being reliably available for script and dialog.
- When loading a save, familiar will switch **one by one**, it's an important state that need to happen to make them reliably available for script and dialog.


## Overwiew :  
----------------

This mod aims to provide a way to extend the limit of 6 characters in party by using the familiar status, while preserving quests, interjections, and banters in order to enjoy the NPCs as party member.

There is no real limitation as for the number of familiar players can have along side them.


## Instruction :  
----------------

Compatibility : BGEE, SOD, BG2EE and EET.  

- Install JOining Party **AFTER** mods that add any dialog or script options related to NPC.  

Componant :  

- Choose wich NPC will be allowed to become Familiar. (This don't prevent to have them in party as regular member if wanted.)  

  1. Continuous original NPC (Imoen, Edwin, Jaheira, Minsc, Viconia, Dorn, Neera, Rasaad)  
  2. BG1 original NPC (Ajantis, Alora, Branwen, Coran, Dynaheir, Eldoth, Faldorn, Garrick, Kagain, Khalid, Kivan, Montaron, Quayle, Safana, Sharteel, Skie, Tiax, Xan, Xzar,  Yeslick, Baeloth)  
  3. SoD original NPC (Voghiln, Corwin, Mkhiin, Glint)  
  4. BG2EE original NPC (Anomen, Aerie, Cernd, Haerdalis, Hexxat, Jan, Keldorn, Korgan, Mazzy, Nalia, Sarevok, Valygar, Wilson, Yoshimo)  
  5. Mods BG1 NPC ([Ishlilka](https://github.com/The-Gate-Project/Ishlilka_The-Wizard-Slayer))  
  6. Mod BG2 NPC ([Alora BG2](https://github.com/The-Gate-Project/Alora-NPC-for-BG2), [Yeslick BG2](https://github.com/Spellhold-Studios/Yeslick-NPC), [Sandra](https://github.com/11jo/Summon_Bhaalspawn), [Nikita](https://github.com/The-Gate-Project/NikitaRedux), [Kim](https://github.com/11jo/Kim_NPC), [Miriam](https://github.com/The-Gate-Project/VampireTales), [Severian](https://github.com/The-Gate-Project/Severian-de-Demerya), ~[The Undying](https://github.com/11jo/The-Undying)~)  

- **Mandatory** Install componant All-Out, 
  - Replace any InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead... by Familiar reference to make them count as party member and allow quests and interjections to process.  
  - Add new lines to scripts and dialog to make Familiars follow party movement and state.
  
  1.  All-Out 

- **Mandatory** Install componant All-In,
  - Install / Expand scripts, dialogs, items, spells... used to make the familiar situation work.
  
  1.  All-In 


---


In game :

Starting a new game, Charname receive a special ability.
 - **Using the ability**, on a party member selected at installation, will **change it to familiar**.
 - Using the ability on a familiar, will **allow to talk to the familiar** and modify their behavior.
    - Follow (Close or at sight) the party member who initiate the talk.
	- Make the familiar joining the party as regular party member.
	- Make the familiar joining the party just an instant, to deal with statistic, inventory or level, then automatically returning to familiar state.
	- Choose if you want the familier to be deactivate for Cutscenes.
	- Make the familiar completly leave the party, will automatically be added an instant to the group then removed, in order to set leaving dialog.

**Familiar will "switch"** in party some time to time to allow them **to be considered as party member** continually.
  - If a party slot remain empty.
  - Every 20mn.
  - When loading a save (very important !!!).
  - If not in combat or in the process of doing something.
  
**Before** a switch they will move to Charname or a party member and say "Hey", before joining the group.
When returning temporarly in party, statistic, inventory or level are available. (Use Pause to take your time if actions on it are needed.)
**After** the switch is completed they will say "Yeah", after leaving the group.

Familiar can't die, under 3PV they will fall for TWO_TURNS, player can also use healing spell on them. 



## Files Description :
----------------

Files : 

- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_BCS.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each selected NPCs death variable in BCS.
   
- [JOining_Party_Select.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_DLG.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each selected NPCs death variable in DLG.

- [JOining_Party_Select_Myself.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Myself.tph)  
   - Search and replace `InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead...` for each existing Myself in DLG and BCS.

- [JOining_Party_Select_End.tph](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Lib/JOining_Party_Select_Joined.tph)  
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

- [JO_JOINI.BAF](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/Baf/JO_JOINX.BAF)  
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

- Global("JO_JOIN_CAMPAIGN","GLOBAL",0)
   - Set variable corresponding to game campaign to enable relevant override scripts and joining dialog. Used in %JO_JOIN%.tpa (1.2.3.4.5).

---

- Global("JO_Join_InParty_Myself","GLOBAL",0)
   - Special Charname at character creation, to be sure DPLAYER3.BCS is set.

---

- Global("JO_TRAVELER_%Death_var%","GLOBAL",0)
   - Set if the NPC is a familiar, used to deal with LeaveParty()

---

- Global("JO_%Death_var%_LeaveParty","GLOBAL",0)
   - If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog

---

LOCALS :

---

- GlobalTimer("JO_JOIN_JOIN","LOCALS",FOUR_HOURS)
   - Timer for switching Familiar to NPCs regulary.

---

- Global("JO_Myself_AllowDead","LOCALS",0)
- Global("JO_Myself_InParty","LOCALS",0)
- Global("JO_Myself_Valid","LOCALS",0)
   - Same as the GLOBAL %Death_var% above but for Myself.

---

- Global("JO_Myself_LeaveParty","LOCALS",0)
   - If set Familar will automatically be added an instant to the group then removed, in order to set leaving dialog

---

- Global("JO_JOIN_DEADLY_DEAD","LOCALS",0)
   - Used along "IsValid" when familiar are dead but not really.

---

- Global("JO_JOIN_SLEEPING_DEAD","LOCALS",0)
   - Set to 1 when Familiar health is below 5HP.
   - Set to 2 when Familiar health is below 5HP and after spell JOIN648 is applied.
   - Set to 3 when Familiar health is above 4HP and after spell JOIR648 is applied.

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

- Global("JO_JOIN_LINK_PLAYER_ID","LOCALS",X)
   - Through dialog with familiar, used to link a familiar to a specific party member. See All_In.D
   - 0: Player1Fill (default case)
   - 1: Player1
   - ...
   - 6: Player6
   - Other: Player1Fill

---

- Global("JO_JOIN_LINK_TYPE","LOCALS",X)
   - Through dialog with familiar, used to link a familiar to a specific party member. See All_In.D
   - -1: Static, no move or teleport
   - 0: Do anything, no move but teleport if range > 70 (default case)
   - 1: Sight, teleport if > 70, move if range > 50
   - 2: Close, teleport if > 70, move if range > 5

---

- Global("JO_JOIN","LOCALS",0)
   - Used by Charname ability to change NPC to familiar.
   - Used by Charname ability to allow special dialog with familiar.
   - Used in %JO_JOIN%.baf (1.2.3.4.5) to set relevant override scripts and joining dialog.

---

- Global("JO_JOIN_CLEAR","LOCALS",0)
   - Used to deal with familiar XP and keeping assigned script when switching in and out party.

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

- Global("JO_JOIN_IS_JOINING","LOCALS",0)
   - The familiar will go close to Charname or linked party member before switching in party.

---

- Global("JO_JOIN_FEELING","LOCALS",0)
   - Not quite tested yet, DisplayStringHead to notify familiar health statut.
   - Some States are implemented too.

---

- Global("JO_JOIN_XPGT_X","LOCALS",0)
   - Will hopefully add the relevant XP to familiar to be on the same level as party members.

---

- Global("JO_NEVER_JOIN","LOCALS",0)
   - Prevent the familiar to switch, WARNING will not be available for most interactions.

---

- Global("JO_NEVER_CUTSCENE","LOCALS",0)
   - Active or deactive familiar presence in cutscene.
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