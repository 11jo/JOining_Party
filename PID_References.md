# Explore dialog options with traveler
--------------------------------------


### PID for travelers

To enable the PID, charname need to use his ability on a traveler, then Charname or any party member can talk to the traveler and acces the PID.

---

- REPLY : _"Oh ! Sorry,everything is fine."_ // **Close the dialog.**
- REPLY : _"Join the group properly, please."_ // **Completely reintegrate the traveler in the group.**
- REPLY : _"Join the group, just for a minute."_ // **A Quick Switch that allow to access inventory and else.**
- REPLY : _"Switch with me."_ // **If a party member (except Charname) use that reply it will change place with the traveler.**

- REPLY : _"We need to adjust our strategy."_ // **Acces to others reply options below. EXPERIMENTAL.**
	- REPLY : _"Change nothing."_ // **Close the dialog.**
	- REPLY : _"Do whatever you want."_ // **Reset the scripts below.**
	- REPLY : _"Can attack with all weapons."_
	- REPLY : _"Use melee weapons only."_
	- REPLY : _"Use range weapons only."_
	- REPLY : _"No attack."_
	- REPLY : _"Can use items."_
	- REPLY : _"No items."_
	- REPLY : _"Enable offensive style."_
	- REPLY : _"Disable offensive style."_
	- REPLY : _"Enable defensive style."_
	- REPLY : _"Disable defensive style."_
	- REPLY : _"Use innate spells."_
	- REPLY : _"Don't use innate spells."_
	- REPLY : _"No modale."_
	- REPLY : _"Find traps and detect illusions."_
	- REPLY : _"Stay hidden."_
	- REPLY : _"Sing."_
	- REPLY : _"Dance."_
	- REPLY : _"Repulse undead."_

- REPLY : _"We need to adjust our position."_ // **The reply options below will be associated to the party member that initiate the talk.**
	- REPLY : _"Change nothing."_ // **Close the dialog.**
	- REPLY : _"Do whatever you want."_ // **Reset the positions below.**
	- REPLY : _"Stay at this location."_ // **Ask the traveler to stay put.** (Don't prevent the traveler to jump near charname)
	- REPLY : _"Stay on sight."_ // **Ask the traveler to stay in the vision field of the party member that initiate the talk.** (Don't prevent the traveler to jump near charname)
	- REPLY : _"Stay close."_ // **Ask the Traveler to stay very close to the party member that initiate the talk.** (Don't prevent the Traveler to jump near charname)

- REPLY : _"I don't want to see you in my dream anymore !"_ // **Deactive the traveler for cutscenes, to not have they hanging around.**
- REPLY : _"I did dream about you !"_ // **Reactive the traveler for cutscenes.**
- REPLY : _"Remain a fellow traveler but don't join the group anymore, at least for a moment."_ // **Prevent the Quick Switch for the traveler** (Don't prevent the **Loading Switch** and the **Switching Party** or any other actions)
- REPLY : _"Remain a fellow traveler but join the group when needed."_ // **Allow the Quick Switch for the traveler**
- REPLY : _"Leave the group please !"_ // **Make the traveler become a party member then leave the group.** (If there is no free slot in party, one of the party member will make room for an instant then reinteger the group)
- REPLY : _"I am exhausted by your conversation, please stop interrupting the group."_ // **Make the traveler stop firing banter.**
- REPLY : _"On second thought, I miss your discussions... Please continue."_ // **Make the traveler start again firing banter when conditions are meet.**
- REPLY : _"Follow me when I walk away from the group, better stick together."_ // **The traveler is allowed to stay with Charname when apart of the party.** (See option below)
- REPLY : _"I am pretty independant, don't follow me when I walk away from the group !"_ // **Deactive the traveler when Charname is not near other party members.** (Allow Charname to explore alone)
- REPLY : _"Don't switch with regular party members, be only a traveler."_ // **Prevent the Switching Party for the traveler** (Don't prevent the **Loading Switch** and the **Quick Switch** or any other actions)
- REPLY : _"You can switch with regular party members."_ // **Allow the Switching Party for the traveler**
- REPLY : _"Join the group properly, please, and don't switch your place with travelers."_ // **Completely reintegrate the traveler in the group and prevent the they to Switching Party with other travelers.** (Reverted by an option in Charname PID below) (Don't prevent the **Loading Switch**)

// The two options below will probably be deleted
- REPLY : _"Join the group properly, please, and at beginning don't make room for travelers."_ // **Completely reintegrate the traveler in the group and prevent they to **Loading Switch** and **Switching Party**. (Use only for party member that need to absolutely stay always in party)
- REPLY : _"Join the group properly, please, and at beginning make room for travelers if needed."_ // **Completely reintegrate the traveler in the group and make sure they is available for the **Loading Switch**.

- REPLY : _"I prefer to adress everyone..."_ // **Jump to Charname PID below.**

// The four options below will probly be masked in the futur
- REPLY : _"Something feel wrong, we can settle this now."_ // **Cancel most variables assigned to the traveler.** (Except "We need to adjust...") (**To use only if problems arise**)
- REPLY : _"JO_NOJOIN."_ // **This variable is set when a transition between party and traveler is processing.** (Should not appear when no one switch)
- REPLY : _"I am currently talking with you !."_ // **JO_JOIN variable is set to make the PID available for the traveler** (Should always appear)
- REPLY : _"JO_JOIN_LOADING_SWITCH."_ // **This variable is set when the Loading Switch process** (Should never appear)

- REPLY : _"How do you feel as traveler."_ // **Ask the traveler to check statut.** (Will be expanded)

	- REPLY : _"I don't have the engagement scroll."_ // **Not good.** (Traveler can die and variables are probably not okay)
	- REPLY : _"The engagement scroll isn't active."_ // **Not good.** (Special item isn't equiped and variables are probably not okay)
	- REPLY : _"I am not considered like a party member."_ // **Not good.** (The variable that simulate InParty() isn't set)
	- REPLY : _"I am not considered like ready to talk."_ // **Not good.** (The variable that simulate InValidForPartyDialog() isn't set)
	- REPLY : _"Il semble que la transition ne soit pas terminée."_ // **Not good.** (One of several transition variables didn't reset)
	- REPLY : _"I am not considered like a traveler."_ // **Not good.** (The variable that check if the NPC is a traveler isn't set.)
	- REPLY : _"I am dead..."_ // **Not good.** (The variable that check if the traveler have less than 2 HP is set.)
	- REPLY : _"I am ready for a quick switch."_ // **Good.** (The traveler is ready to make a Quick Switch and will do it when possible.)
	- REPLY : _"I don't join the group for a Quick Switch."_ // **Player choice.** (The traveler won't come in party for an instant when a slot is free.) (It's not mandatory when the Switching Party is enabled)
	- REPLY : _"I don't participate to the conversations."_ // **Player choice.** (The traveler won't use banters but is still available vor interjections and else)
	- REPLY : _"I'm always eager to a little chat."_ // **Good.** (The traveler will banter when possible.)
	- REPLY : _"I am ready to switch with party members."_ // **Good.** (The traveler will change place with party members.)
	- REPLY : _"I don't switch with party members."_ // **Player choice.** (The traveler won'tchange place with party members.) (Warning : The Switching Party is here to make sure you don't miss NPC contents. (Ex : Dream Talk))
	- REPLY : _"No dream for me."_ // **Good.** (The traveler will be deactivated for cutscenes.)
	- REPLY : _"Always here, even in your dream !" // **Good.** (The traveler will be active for cutscenes.)
	- REPLY : _"TODO"_
	- REPLY : _"TODO"_
	- REPLY : _"TODO"_
	- REPLY : _"TODO"_
	- REPLY : _"TODO"_
	- REPLY : _"TODO"_ ...


- REPLY : _"Show logs."_ **Display most LOCALS variables stats for traveler and some general GLOBAL**

### PID for Charname

To enable the PID, charname need to use his ability onhimself, a dialog will start automatically.

---

- REPLY : _"Sorry, I'm just trying to draw some attention..."_ // **Close the dialog.**

- REPLY : _"Stop the Quick Switch for a while, please."_ // **Prevent the Quick Switch for all travelers.**
- REPLY : _"You are free to Quick Switch when you feel like."_ // **Allow the Quick Switch for all travelers.**
- REPLY : _"Let's switch, one by one, quietly and in order."_ // **Force the Quick Switch for all travelers.** (Except those who are prevented to do so) (Collision with "Stop the Quick Switch for a while, please.")
- REPLY : _"Quick Switch isn't available here."_ // **The Quick Switch is disabled for story reasons, will be reactivated shortly after event or in another area.**

- REPLY : _"I don't want to see any of you in my dream."_ // **Deactive all travelers for cutscenes.**
- REPLY : _"I did dream about my dear fellow travelers !"_ // **Reactive all travelers for cutscenes.*

- REPLY : _"I don't want to see any of you right now !"_ // **Deactive all travelers at will.**
- REPLY : _"Alright you can come back, sorry for dismissed my dear fellow travelers."_ // **Reactive all travelers at will.*

- REPLY : _"I am exhausted by all these conversations, please stop interrupting the group."_ // **Deactive banters for all travelers.**
- REPLY : _"On second thought, I miss our discussions... Let's talk to each others."_ // **Reactive banters for all travelers.**

- REPLY : _"I am an open book, no need for privacy."_ // **Allow all travelers to follow when only Charname is transported in another area, without the group.**
- REPLY : _"I need some privacy, don't follow me in another area."_ // **Deactive all travelers when only Charname is transported in another area, without the group.**

- REPLY : _"I am pretty independant, don't follow me when I walk..."_ // **Deactive all travelers when Charname is not near other party members.** (Allow Charname to explore alone)
	-  30 steps away from the group !
	-  50 steps away from the group !
	-  80 steps away from the group !
	-  100 steps away from the group !
- REPLY : _"Follow me when I walk away from the group, better stick together."_ // **All traveler are allowed to stay with Charname when apart of the party.** (See option above)


- REPLY : _"Do whatever you want."_ // Same as both _"We need to adjust..."_ // **Close the dialog.**

- REPLY : _"There is room for one traveler to come in party."_ // **Make a random traveler reintegrate the group completly.**
- REPLY : _"There is room for two travelers to come in party."_ // **Make a random traveler reintegrate the group completly.**
- REPLY : _"There is room for three travelers to come in party."_ // **Make a random traveler reintegrate the group completly.**
- REPLY : _"Travelers don't come in party when Fill Party."_ // **Prevent travelers to reintegrate the group when above options are used and also prevent them to come automaticaly in party when it include less than three members.** (Apply also to party members)
- REPLY : _"Travelers come in party when Fill Party."_ // **Allow travelers to reintegrate the group when above options are used and also Allow them to come automaticaly in party when it include less than three members.** (Apply also to party members)



- REPLY : _"Travelers stop switching places with party members."_ // **Prevent the Switching Party for all travelers.**
- REPLY : _"Travelers if party members are available you can switch places."_ // **Allow the Switching Party for all travelers.**
- REPLY : _"Travelers you can switch places only with the last three party member !"_ // **Allow the Switching Party only with the last three members portrayed in the UI.**
- REPLY : _"Travelers you can switch places with every party members !"_ // **Allow the Switching Party with every members portrayed in the UI.**
- REPLY : _"Party members stop switching places with travelers."_ // **Prevent the Switching Party for all party members.**
- REPLY : _"Party members if travelers are available you can switch places."_ // **Prevent the Switching Party for all party members.**



- REPLY : _"I like to ..."_ // **Acces to others reply options below.**

	- REPLY : _"Nevermind, let's continue."_ // **Close the dialog.**
	- REPLY : _"On second thought, let's start over."_ // **Return to previous dialog options.**
	- REPLY : _"A legion ?"_ // **Count the number of travelers.** (Allow to verify that everyone is considered)
	- REPLY : _"Stay close to me or your partner !"_ // **Enable the option "Stay close." for all traveler.** (Will depend if the traveler is linked to a party member or not)
	- REPLY : _"To all travelers ! Get lost !"_ // **Make all travelers become a party member then leave the group.** (If there is no free slot in party, one of the party member will make room for an instant then reinteger the group)
	- REPLY : _"Everybody say, Youhou !"_ // **Count the number of travelers.** (Allow to verify that everyone is considered)
	- REPLY : _"Don't be afraid and come closer..."_ // **Make all travelers come near Charname.**
	- REPLY : _"Go to the Switching Room !"_ // **Transport everyone to the special Candelkeep area.** (Can be used at anytime.)
	- REPLY : _"Leave the Switching Room !"_ // **Transport everyone to the previous position.** (Can also return using the Switching Room door way.)

- REPLY : _"PlayerX want to..."_ // **Jump to another party member to manage travelers.**  (All party members are listed in game)
	- REPLY : _"Wait PlayerX, we don't have time for this !"_ // **Close the dialog.**
	- REPLY : _"On second thought, let's start over."_ // **Return to previous dialog options.**
	- REPLY : _"...discuss with _"Traveler Name" !"_ **Make the party member jump to a traveler PID.** (All travelers are listed in game)
- REPLY : _"PlayerX become a traveler please..."_ // **Make the party member become a traveler" (Same as using Charname ability on a party member)
- REPLY : _"PlayerX, you can switch your place with travelers."_ **Enable the Switching Party for the party member**
- REPLY : _"PlayerX, don't switch your place with travelers."_ **Disable the Switching Party for the party member**

- REPLY : _"Let's try a Loading Switch !"_ // **Perform a manual Loading Switch at any time** (Used if regular Loading witch didn't go well or at will)
- REPLY : _"Loading Switch isn't available here."_ // **The Loading Switch is disabled for story reasons, will be reactivated shortly after event or in another area.**

- REPLY : _"There's something wrong with travelers, let's settle this now."_ // **Reset / Cancel most variables assigned to all travelers.** (Except "We need to adjust...") (**To use only if problems arise**)

// The five options below will probly be masked in the futur
- REPLY : _"Let's Blop !"_ **Enable  Loading Switch and Switching Party in every area and situation.**
- REPLY : _"Don't switch if not in a master area or if ennemies are at sight."_ **In these situations the group will be transported in special Candelkeep area for the Loading Switch.** (The Switching Party will wait for better circonstances)
- REPLY : _"JO_NOJOIN."_ // **This variable is set when a transition between party and traveler is processing.** (Should not appear when no one switch)
- REPLY : _"JO_JOIN_LOADING_SWITCH."_ // **This variable is set when the Loading Switch process** (Should never appear)
- REPLY : _"JO_JOIN_CUTSCENE."_ // **This variable is set when a cutscene is processing** (Should never appear)

- REPLY : _"Let's try a Loading Switch !"_ **Force the Loading Switch at anytime.** (To use if something isn't right or for fun...)
- REPLY : _"Show logs."_ **Display most GLOBAL variables stats and some LOCALS for Charname**