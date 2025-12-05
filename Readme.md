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

**Authors** : ***


### Beta state !


**Installation could last between 10 to 30+ minutes depending of the number of NPCs chosen and the number of mods installed**

- Use the Charname **special ability** to convert NPC to Familiar / traveler.
- Keep **one free party slot** to allow NPC switch regulary or not and **let them switch places with party members**.
- You can **quickly acces** (5 seconds) to stats and inventory when they switch in party.
- You can **completly reinteger** any traveler in party, use again the same special ability on the chosen NPC and talk to the NPC, they will have **several dialog options**.

- When loading a save the **NPCs have to switch** once before being reliably available for script and dialog. All party members available and willing to be traveler will temporarly leave the group to allow travelers to switch once then will reinteger the group quickly.
- When loading a save, traveler will switch one by one, it's an *important state that need to happen to make them reliably available for script and dialog*.


## Overwiew :  
----------------

This mod aims to provide a way to extend the limit of 6 characters in party by using the familiar status, while preserving quests, interjections, and banters in order to enjoy the NPCs / travelers as party member.

There is no real limitation as for the number of familiars / travelers that players can have along side them.


## Instruction :  
----------------

Compatibility : BGEE, SOD, BG2EE and EET.  

- Install JOining Party **AFTER** mods that add any dialog or script options related to NPC.
- [More Interjections](https://gibberlings3.github.io/Documentation/readmes/readme-cdtweaks.html#contents_1010), from Tweak Anthology, [componant 1010](https://github.com/Gibberlings3/Tweaks-Anthology/blob/master/cdtweaks/lib/comp_1010.tpa) is completly incompatible with this mod if installed BEFORE JOining Party... But should be okay if installed AFTER... Still need to be investigated !

- **First** select the NPCs that could become travelers in [JOining_Traveler.ini](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Traveler.ini)
  - 0 the NPC is not expanded to become a traveler.
  - 1 Npc will be expended to be traveler (Familiar fully considered as party member.)
  - 2 Npc will be expended to be a real traveler (Familiar fully considered as party member and will expand party blocs ACTIONS for more realisme.) (Warning Option 2, will expend installation time significaly, to use only with few traveler.)


##### Componants :  

- **Install the main componant** "JOining Party !" 
  - Replace any InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead... by traveler references to make them count as party member and allow quests and interjections to process.  
  - Add new lines to scripts and dialog to make travelers follow party movement and state.
  - Install / Expand scripts, dialogs, items, spells... used to make the familiar situation work.

---

- Traveler Switch Timer when a free party member slot is kept
  - Allow to change frequency travelers will come in party for a short moment. (Same purpose as the initial at save loading switch )
  - Redundant with Party Member Switch with Travelers.
  - Can be reinstalled multiple time at any time, if another timer is more suitable.
  - Don't appear in weidu.log

- Banter Switch Timer and Party Member Switch
  - Allow to change frequency travelers will fire their banters dialog.
  - Allow to change frequency travelers will switch their places with party members if a party member is eligible and willing to be traveler.
  - Can be reinstalled multiple time at any time, if another timer is more suitable.
  - Don't appear in weidu.log
  
---

#### In game :

Starting a new game, Charname receive a special ability.
 - **Using the ability**, on a party member selected at installation, will **change it to familiar / travelers**.
 - Using the ability on a travelers, will **allow to dialog** and modify their behavior.
    - Follow (Close or at sight) the party member who initiate the talk.
	- Make the Travelers joining the party as regular party member.
	- Make the Travelers joining the party just an instant, to deal with statistic, inventory or level, then automatically returning to familiar state.
	- Choose if you want the familier to be deactivate for Cutscenes.
	- Make the Travelers completly leave the party, will automatically be added an instant to the group then removed, in order to set leaving dialog.
	
 - **Using the ability**, on Charname, will open a dialog.
	- Allow to give mostly similar directions as above but to all travelers at once.
    - Allow to switch to only one traveler to dialog.
	- Allow to select a party member to dialog with one traveler.
	- Quicker and easier that Using the ability on only one traveler then engage conversation.

**Travelers will "switch"** in party some time to time to allow them **to be considered as party member** continually.
	- If a party slot remain empty.
	- Every custom time.
	- When loading a save (very important !!!).
	- If not in combat or in the process of doing something.

**Travelers will "switch their places with party member"** some time to time **if a party member is eligible and willing** to be traveler.
	- Every custom time.
	- When loading a save (very important !!!).
	- If not in combat or in the process of doing something.

**Travelers will "start their banter dialog"** some time to time to allow them **to be considered as party member** continually
	- The banter dialog will adapt depending of the campaign.
	- If conditions are meets a banter will fire, if not nothing will happen.
	- Every custom time.
	- If not in combat or in the process of doing something.

**Travelers will "always be available"** to **talks, PID, interjects and quests like a party member**.
	- The joining dialogs will adapt depending of the campaign.
	- The override scripts will adapt depending of the campaign.

  
**Before** a switch they will look to Charname or a party member and say "Hey", before joining the group.
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

- Alpha.0.0.6

- Alpha.0.0.8

- Alpha.0.0.9
