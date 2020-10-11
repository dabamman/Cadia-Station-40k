/*
Bartender
*/
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/bar
	default_headset = /obj/item/device/radio/headset/headset_srv

	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue, access_mineral_storeroom)
	minimal_access = list(access_bar, access_mineral_storeroom)

/datum/job/bartender/equip_backpack(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	switch(H.backbag)
		if(1) //No backpack or satchel

			var/obj/item/weapon/storage/box/box = new default_storagebox(H)
			new /obj/item/ammo_casing/shotgun/beanbag(box)
			new /obj/item/ammo_casing/shotgun/beanbag(box)
			new /obj/item/ammo_casing/shotgun/beanbag(box)
			new /obj/item/ammo_casing/shotgun/beanbag(box)
			H.equip_to_slot_or_del(box, slot_r_hand)

		if(2) // Backpack
			var/obj/item/weapon/storage/backpack/BPK = new default_backpack(H)
			new default_storagebox(BPK)
			H.equip_to_slot_or_del(BPK, slot_back,1)
		if(3) //Satchel
			var/obj/item/weapon/storage/backpack/BPK = new default_satchel(H)
			new default_storagebox(BPK)
			H.equip_to_slot_or_del(BPK, slot_back,1)

/datum/job/bartender/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/bartender(H), slot_w_uniform)

	if(H.backbag != 1)
		H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/ammo_casing/shotgun/beanbag(H), slot_in_backpack)
	H << "\blue Keep the crew happy by providing fine imperial liquor to their needy souls." // Job Explanation
/*
Chef
*/
/datum/job/chef
	title = "Chef"
	flag = CHEF
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/chef
	default_headset = /obj/item/device/radio/headset/headset_srv

	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue)
	minimal_access = list(access_kitchen, access_morgue)

/datum/job/chef/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chef(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/chef(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/chefhat(H), slot_head)
	H << "\blue Make food for the crew. Experiment with different recipes." // Job Explanation
/*
Botanist
*/
/datum/job/hydro
	title = "Farmer"
	flag = BOTANIST
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/botanist
	default_headset = /obj/item/device/radio/headset/headset_srv

	access = list(access_hydroponics, access_bar, access_kitchen, access_morgue) // Removed tox and chem access because STOP PISSING OFF THE CHEMIST GUYS // //Removed medical access because WHAT THE FUCK YOU AREN'T A DOCTOR YOU GROW WHEAT //Given Morgue access because they have a viable means of cloning.
	minimal_access = list(access_hydroponics, access_morgue) // Removed tox and chem access because STOP PISSING OFF THE CHEMIST GUYS // //Removed medical access because WHAT THE FUCK YOU AREN'T A DOCTOR YOU GROW WHEAT //Given Morgue access because they have a viable means of cloning.

/datum/job/hydro/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/hydroponics(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/botanic_leather(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/apron(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/device/analyzer/plant_analyzer(H), slot_s_store)
	H << "\blue Ensure that natural resources are present on station, keep food growing, and export exotic plants through the Munitorum." // Job Explanation
/*
Quartermaster
*/
/datum/job/qm
	title = "Munitorum Priest"
	flag = QUARTERMASTER
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Sector Munitorium and the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/quartermaster
	default_headset = /obj/item/device/radio/headset/headset_cargo

	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station)

/datum/job/qm/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/cargo(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/brown(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/fingerless(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/weapon/clipboard(H), slot_l_hand)
	H << "\blue Approve or deny order requests, and wrangle your adepts, keep valuables flowing out and keep requried materials flowing in. If you need a shot of points ask the Seneschal." // Job Explanation
/*
Cargo Technician
*/
/datum/job/cargo_tech
	title = "Munitorum Adept"
	flag = CARGOTECH
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Munitorum Priest and the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/cargo
	default_headset = /obj/item/device/radio/headset/headset_cargo

	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)

/datum/job/cargo_tech/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/cargotech(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/fingerless(H), slot_gloves)
	H << "\blue The moving of goods from the station off station while keeping the station supplied with necessities. Take care of the goods and ensure on time delievery. Explore the maintenance tunnels for forgotten gear so that it may be use to turn a profit." // Job Explanation
/*
Shaft Miner
*/
/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Munitorum Priest and the Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/shaftminer
	default_headset = /obj/item/device/radio/headset/headset_cargo
	default_backpack = /obj/item/weapon/storage/backpack/industrial
	default_satchel = /obj/item/weapon/storage/backpack/satchel_eng
	default_storagebox = /obj/item/weapon/storage/box/engineer

	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_mining, access_mint, access_mining_station, access_mailsorting, access_mineral_storeroom)

/datum/job/mining/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/miner(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/fingerless(H), slot_gloves)
	H << "\blue Hired by the Rogue Trader to use the mining vessels to mine out valuable ores and return them for a profit. Take care though, in the mines lay a hidden enemy long forgotten." // Job Explanation
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/crowbar(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/bag/ore(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/mining_voucher(H), slot_r_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/crowbar(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/bag/ore(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/mining_voucher(H), slot_in_backpack)

/*
Celebrity
*/
/datum/job/celebrity
	title = "Celebrity"
	flag = CELEBRITY
	department_head = list("Rock and Roll")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Your Free spirit and the Rogue Trader"
	selection_color = "#dddddd"

	access = list(access_theatre, access_maint_tunnels)
	minimal_access = list(access_theatre)

/datum/job/celebrity/equip_items(var/mob/living/carbon/human/H)
	H.fully_replace_character_name(H.real_name, pick(clown_names)) // Give him a temporary random name to prevent identity revealing
	H.verbs += /mob/living/carbon/human/proc/renderaid
	H.verbs += /mob/living/carbon/human/proc/celebshuttle
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset(H), slot_ears)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/powdered_wig(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/celebrity(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/red(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/paper/celebjudgement(H), slot_l_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/paper/celebjudgement(H), slot_in_backpack)

	H.rename_self("clown")
	if(prob(25))
		H.verbs += /mob/living/carbon/human/proc/celebfall //I was changing them back and forth RAPIDLY //This is how we get the verb!
	H << "\blue You were hired by the Rogue Trader to entertain the crew, the is a theatre and various costumes which you can utilise to achieve this goal and recieve compensation, or you could follow the quest." // Job Explanation
/*
Mime
*/
/datum/job/mime
	title = "Mime"
	flag = MIME
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/mime
	default_backpack = /obj/item/weapon/storage/backpack/mime

	access = list(access_theatre, access_maint_tunnels)
	minimal_access = list(access_theatre)


/datum/job/mime/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/mime(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/mime(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/beret(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/suspenders(H), slot_wear_suit)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/toy/crayon/mime(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing(H), slot_l_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/toy/crayon/mime(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing(H), slot_in_backpack)

	if(H.mind)
		H.mind.spell_list += new /obj/effect/proc_holder/spell/aoe_turf/conjure/mime_wall(null)
		H.mind.spell_list += new /obj/effect/proc_holder/spell/targeted/mime/speak(null)
		H.mind.miming = 1
		if(prob(25))
			H.mind.spell_list += new /obj/effect/proc_holder/spell/targeted/mime/concentrate(null)

	H.rename_self("mime")
	H << "\blue Do the quest or just fuck with people. Have fun." // Job Explannation
/*
Janitor
*/
/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/janitor
	default_headset = /obj/item/device/radio/headset/headset_srv

	access = list(access_janitor, access_maint_tunnels)
	minimal_access = list(access_janitor, access_maint_tunnels)

/datum/job/janitor/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/janitor(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H << "\blue Clean the station, and report signs of heresy, you very loyal imperial citizen. Note a servitor could easily take your job." // Job Explanation
/*
Librarian
*/
/datum/job/librarian
	title = "Record Keeper"
	flag = LIBRARIAN
	department_head = list("Seneschal")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Seneschal"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/librarian

	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)

/datum/job/librarian/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/red(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/weapon/barcodescanner(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/device/laser_pointer(H), slot_l_store)

/*
Inquisitorial Acolyte
*/
/datum/job/lawyer
	title = "Inquisitorial Acolyte"
	flag = LAWYER
	department_head = list("Inquisition")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Inquisition"
	selection_color = "#dddddd"
	var/global/lawyers = 0 //Counts lawyer amount
	default_backpack = /obj/item/weapon/storage/backpack/satchel
	default_satchel = /obj/item/weapon/storage/backpack/satchel
	default_pda = /obj/item/device/pda/lawyer
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_id = null
	idtype = null

/datum/job/lawyer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/acolyte(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/acolytecoat(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/acolyteboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/device/pda/lawyer(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/acolyte(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/acolytegloves(H), slot_gloves)
	H.faction = "Inquisitor"
	H <<  "\blue You have been chosen by an Inquisitor to be their very eyes, your main goal is to look out for heresy and report it back to them, if you can handle it yourself do so, but always keep your Inquisitor informed on what is happening. Do this using your vox communicator located in the Liar. Refrain from raining ordance down via the stationed blackship. Keep in mind that you do not wield the power of the inquisitor and you have a target on your back. Your power comes from your connections not your rank. Detaining heretics and arresting them is on par with you, but ordering executions is left to the Rogue Trader and Inquisition."

	if (prob(50))
		var/obj/item/weapon/implant/loyalty/E = new/obj/item/weapon/implant/loyalty(H)
		E.imp_in = H
		E.implanted = 1

	spawn(10)
		var/weaponchoice = input(H, "What Ordo does your Inquisitor belong too?","Ordo Selection") as null|anything in list("Ordo Hereticus", "Ordo Xenos", "Ordo Malleus")
		switch(weaponchoice)
			if("Ordo Hereticus")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/(H), slot_r_hand)
				H.equip_to_slot_or_del (new /obj/item/weapon/gun/projectile/automatic/laspistoli(H), slot_s_store)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/laspistolmag(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/laspistolmag(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/device/hdetector(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/weapon/card/id/inquisitor(H), slot_wear_id)
				H.equip_to_slot_or_del (new /obj/item/device/radio/headset/headset_sec(H), slot_ears)
				H.wear_id.name = "[H.real_name]'s Inquisitorial Seal"

			if("Ordo Xenos")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/pknife(H), slot_r_hand)
				H.equip_to_slot_or_del (new /obj/item/weapon/gun/projectile/automatic/pistol/heavy/ox(H), slot_s_store)
				H.equip_to_slot_or_del (new /obj/item/device/xdetector(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/m12mm(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/m12mm(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/weapon/card/id/inquisitor/ordoxenos(H), slot_wear_id)
				H.equip_to_slot_or_del (new /obj/item/device/radio/headset/headset_sec(H), slot_ears)
				H.wear_id.name = "[H.real_name]'s Inquisitorial Seal"

			if("Ordo Malleus")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig/inq(H), slot_r_hand)
				H.equip_to_slot_or_del (new /obj/item/weapon/gun/projectile/automatic/bpistol(H), slot_s_store)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/bpistolmag(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/ammo_box/magazine/bpistolmag(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/clothing/tie/medal/gold/sealofpurity(H), slot_in_backpack)
				H.equip_to_slot_or_del (new /obj/item/weapon/card/id/inquisitor/ordomalleus(H), slot_wear_id)
				H.equip_to_slot_or_del (new /obj/item/device/radio/headset/headset_sec(H), slot_ears)
				H.wear_id.name = "[H.real_name]'s Inquisitorial Seal"

//--Eldar Spy--

/datum/job/eldarspy
	title = "Eldar Spy"
	flag = ELDARSPY
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Everyone!"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	idtype = /obj/item/weapon/card/id/assistant

/datum/job/eldarspy/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid //This is how we get the verb!
	if(!H.unEquip(H.wear_id))
		qdel(H.wear_id)
	if(!H.unEquip(H.belt))
		qdel(H.belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/cape(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)  //Looks like an assistant
	H.equip_to_slot_or_del(new /obj/item/weapon/paper/espy(H), slot_in_backpack)  //With a cloaking device
	H.equip_to_slot_or_del(new /obj/item/device/soulstone(H), slot_in_backpack)	//and a soulstone. Perfectly normal!
	H.equip_to_slot_or_del(new /obj/item/weapon/card/id/syndicate(H), slot_wear_id)
	H.equip_to_slot_or_del(new /obj/item/device/pda(H), slot_belt)

	H << "\blue To forge your ID, pull out the card and click on it, you can then insert it into your PDA to update its info. You are an Eldar, a xenos to the Imperium of Mankind. Your local Seer Council has tasked you with maintaining an eye on the newly established mining outpost, they know not of the other dangers that lurk here. Don't get found out. You can either choose to protect them from these dangers or outright slaughter with just cause those that are seeking to exploit the world. You must have a justified reason to kill anyone. You can also simply choose to observe and report in." // Job Explanation

datum/job/assistant/get_access()
	if(config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) //Config has assistant maint access set
		. = ..()
		. |= list(access_maint_tunnels)
	else
		return ..()

