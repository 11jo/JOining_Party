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