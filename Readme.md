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
	- You can use the **special ability** on an traveler then talk to the traveler to acces a PID and manage the traveler.
	- You can use the **special ability** **on Charname** to launch a dialog to manage travelers.

- **Loading Switch :**
	- **When loading a save the Travelers have to switch once before being reliably available for script and dialog.**
	- When loading a save, one or two party members available and willing to be traveler will temporarly leave the group to allow all travelers to reintegrate the group very quickly, it's an **very important state** that need to happen to make them reliably available for scripts and dialogs*.

- **Switching Party :**
	- Party members and travelers will switch regulary to make sure no interaction is lost. (Only for party members eligible to be a traveler)
	- The Switching Party allow traveler to be in the group long enough to fire whatever interaction that could be missed by the JOining_Party scripts. (Ex : NPC Dream Talk when party is resting)

- **Quick Switch :**
	- If a free slot is available traveler will regulary reintegrate the party for a short instant.


## Overwiew :  
----------------

This mod aims to provide a way to extend the limit of 6 characters in party by using the familiar status, while preserving quests, interjections, and banters in order to enjoy the NPCs / travelers as party member.

There is no real limitation as for the number of familiars / travelers that players can have along side them. However, to prevent the scripts from being overwhelmed, it’s advisable not to have more than five or six travelers.


## Instruction :  
----------------

Compatibility : BGEE, SOD, BG2EE and EET.  

- Install JOining Party **AFTER** mods that add any dialog or script options related to NPC.
- [More Interjections](https://gibberlings3.github.io/Documentation/readmes/readme-cdtweaks.html#contents_1010), from Tweak Anthology, [componant 1010](https://github.com/Gibberlings3/Tweaks-Anthology/blob/master/cdtweaks/lib/comp_1010.tpa) is completly incompatible with this mod if installed BEFORE JOining Party... But should be okay if installed AFTER... Still need to be investigated !
- Joining_Party use script slots permanently or temporarly : 
  - SCRIPT_OVERRIDE for Charname (permanent)
  - SCRIPT_GENERAL for traveler (permanent)
  - SCRIPT_RACE for Travelers (temporarly and regulary) // Each time a traveler come and go to and from party, only the time to run.
  - SCRIPT_RACE for Charname (Only if asked by dialog to count traveler) // Mostly unecessary.

**Before installing the mod** select the NPCs that could become travelers in [JOining_Traveler.ini](https://github.com/11jo/JOining_Party/blob/main/JOining_Party_Select/JOining_Traveler.ini)
- 0 the NPC is not expanded to become a traveler.
- 1 Npc will be expended to be traveler (Familiar fully considered as party member.)
	- By default all NPC integrated to the mod will be set to 1. (Except for Continuous original game NPC)
- 2 Npc will be expended to be a real traveler :
	- By default all Continuous original game NPC, will be set to 2. (Imoen, Edwin, Jaheira, Minsc, Viconia, Dorn, Neera and Rasaad)
	- (Familiar fully considered as party member and will expand party blocs ACTIONS for more realisme.)
	- (It expand blocks that concern Player2 to Player6 for traveler to follow the group movement in some case, so add only few of them)
	- (Warning Option 2 is Experimental and will expend installation time significaly, to use only with few traveler.)

You can check [PID options and what they do here](https://github.com/11jo/JOining_Party/blob/main/PID_References.md).


##### Componants :  

- **Install the main componant** "JOining Party !" 
  - Replace any InParty, !InParty, IsValidForPartyDialog, !IfValidForPartyDialogue, InpartyAllowDead... by traveler references to make them count as party member and allow quests and interjections to process.  
  - Add new lines to scripts and dialog to make travelers follow party movement and state.
  - Install / Expand scripts, dialogs, items, spells... used to make the familiar situation work.

---

- **Quick Switch Timer** when a free party member slot is kept or free
  - Allow to change frequency travelers will come in party for a short moment. (Same purpose as the initial Loading Switch )
  - Related random timers will use random time between player choice and the double of player choice.
  - Redundant with the Switching Party but still can be usefull.
  - Can be reinstalled multiple time at any time, if another timer is more suitable.
  - Don't appear in weidu.log

- **Banter Timer**
  - Allow to change frequency travelers will try to fire banters.
  - Try to fire banters, will launch the banter related dialog, but it will fire only if the banter dialog conditions are meet.
  - Can be reinstalled multiple time at any time, if another timer is more suitable.
  - Don't appear in weidu.log

- **Switching Party Timer**
  - Allow to change frequency travelers will switch their places with party members if a party member is eligible and willing to be traveler.
  - Related random timers will use random time between player choice and the double of player choice.
  - Can be reinstalled multiple time at any time, if another timer is more suitable.
  - Don't appear in weidu.log
  
---

#### In game :

Starting a new game, Charname receive a special ability the "Engagement.

- **Using the ability**, on a party member selected to be a traveler at installation, will **change it to a familiar / travelers**.
- Using the ability on a travelers, will [allow to dialog](https://github.com/11jo/JOining_Party/blob/main/PID_References.md#pid-for-traveler) and modify their behavior.
	- Any party member can start the PID with a traveler after using Charname ability on it.
	- Follow (Close or at sight) the party member who initiate the talk.
	- Make the Travelers joining the party as regular party member.
	- Make the Travelers joining the party just an instant, to deal with statistic, inventory or level, then automatically returning to familiar state.
	- Choose if you want the familier to be deactivate for Cutscenes.
	- Make the Travelers completly leave the party, will automatically be added an instant to the group then removed, in order to set leaving dialog.

 - **Using the ability**, on Charname, will [open a dialog](https://github.com/11jo/JOining_Party/blob/main/PID_References.md#pid-for-charname).
	- Allow to give mostly similar directions as above but to all travelers at once.
    - Allow to switch to only one traveler to dialog.
	- Allow to select a party member to dialog with one traveler.
	- Quicker and easier that Using the ability on only one traveler then engage conversation.

**Travelers will "fill"** unless the option is deactivated in PID travelers will reinteger the party when it include less than three members.

**Travelers will "switch"** in party some time to time to allow them **to be considered as party member** continually.
	- If a party slot remain empty.
	- Every custom time.
	- When loading a save (very important !!!).
	- If not in combat or in the process of doing something.

**Travelers will "always be available"** to **talks, PID, interjects and quests like a party member**.
	- The Joining dialogs will adapt depending of the campaign.
	- The Banter dialogs will adapt depending of the campaign.
	- The Dream talk scripts will adapt depending of the campaign.

**Travelers will "switch their places with party member"** some time to time **if a party member is eligible and willing** to be traveler.
	- Every custom time.
	- If not in combat or in the process of doing something.

**Travelers will "start their Banter dialog"** some time to time.
	- The banter dialog will adapt depending of the campaign.
	- If conditions are meets a banter will fire, if not nothing will happen.
	- Every custom time.
	- If not in combat or in the process of doing something.

**Travelers will "start their Dream talk scripts"** some time to time. (**Experimental**)
	- The dream talk script will adapt depending of the campaign.
	- If conditions are meets a banter will dream talk, if not nothing will happen.
	- When the party try to rest.
	- If not in combat or in the process of doing something.

  
**Before** a switch they will look to Charname or a party member and say "Hey", before joining the group.
When returning temporarly in party, statistic, inventory or level are available. (Use Pause to take your time if actions on it are needed.)
**After** the switch is completed they will say "Yeah", after leaving the group.

At the moment **several indication texts will appear in dialog box** to inform the player about what is currently processing.

**Travelers can't die**, under 3PV they will fall for TWO_TURNS, player can also use healing spell on them. 



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


## Credits / Remerciements :
---------------------------------

- Rivvers / @RiwsPy (Co author)
 
- @Darpaek (Beta testing)


## Version History :
--------------------

- Beta v1.3
	- Big rework for the Loading Switch
	- Rework Leave Party
	- Clean up
	- Add infos in scripts files
	- Many others things... 

- Early Beta v1.2
	- Not released
	- Many reviews, test, corrections, failures and else

- Early Beta v1.1
	- Add Kale npc
	- Move LeaveParty for travelers blocks before Security blocks
	- Change Charname script from DPLAYER3 in slot DEFAULT to JO_JOINP in slot OVERRIDE
	- Add JO_JOIN_FORCE_LOAD (will lauch the loading switch at will)
	- Attempt to make the SwitchingParty less picky
	- Rework JO_JOIN_CAMPAIGN to deal with banter and dream talk and correct files assignement for EET

- Early Beta v1.0.0
	- This is very much an early beta.
	- Transition between game could not really work.
	- Banters works, but dream talks are wonky and experimental.
	- Quest and interjections should work as intended and without issue.

- Alpha.0...
