 //very big WIP testing ideas with these boys - it seems to be much easier to get them functioning as humans rather than silicon as that entails a whole lot of craziness. Really need to make them unable to wear anything but give them base armor/biotic weps
/mob/living/carbon/human/skitarii_hypaspist
	name = "Unknown"
	real_name = "Unknown"
	universal_speak = 1
	gender = "male"
	maxHealth = 150
	health = 150
	status_flags = 0
	factions = list("imperium")//new
	var/isempty = 0

/mob/living/carbon/human/skitarii_hypaspist/New()
	..()
	spawn(5)
		if(!src.ckey)
			isempty = 1 //Then the larva can be possessed by any ghost.
			request_player()
	equip_to_slot_or_del(new /obj/item/clothing/glasses/bioniceye, slot_glasses)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/skitarii, slot_gloves)
	equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security, slot_back)
	equip_to_slot_or_del(new /obj/item/clothing/under/rank/skitunder, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/skitshoes, slot_shoes)
	equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/skitrobe, slot_wear_suit)

	var/namelist = list ("Sy-Gex-[rand(123, 789)]", "Tyr-[rand(123, 789)]", "Dak-[rand(123, 789)]", "Delyrr-[rand(123, 789)]", "Ar-[rand(123, 789)]", "Zyto-Neumann-[rand(123, 789)]", "Xixos-[rand(123, 789)]", "Rho-[rand(123, 789)]", "Delpha-[rand(123, 789)]",)
	var/rndname = pick(namelist)

	name = "[rndname]"
	real_name = "[rndname]"
	var/obj/item/weapon/card/id/W = new
	W.icon_state = "dogtag"
	W.access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks,
				access_construction, access_atmospherics, access_tcomsat, access_robotics, access_tox, access_tox_storage, access_research,
				access_xenobiology, access_mineral_storeroom)

	W.assignment = "Skitarii Hypaspist"
	W.registered_name = real_name
	W.update_label()
	equip_to_slot_or_del(W, slot_wear_id)
	sleep (10)
	regenerate_icons()

/mob/living/carbon/human/skitarii_hypaspist/Life()
	..()
	if(iscarbon(src))
		icon = 'icons/mob/human.dmi'
		icon_state = "skitarii-hypaspist_s"

//Procs for grabbing players.
/mob/living/carbon/human/skitarii_hypaspist/proc/request_player()
	for(var/mob/dead/observer/O in player_list)
		if(jobban_isbanned(O, "Syndicate"))
			continue
		if(O.client)
			if(O.client.prefs.be_special & BE_ALIEN)
				question(O.client)

/mob/living/carbon/human/skitarii_hypaspist/proc/question(var/client/C)
	spawn(0)
		if(!C)	return
		var/response = alert(C, "An agent of the Adpetus Mechanicus needs a player. Are you interested?", "Skitarii Hypaspist", "Yes", "No", "Never for this round")
		if(!C || ckey)
			return
		if(response == "Yes")
			transfer_personality(C)
		else if (response == "Never for this round")
			C.prefs.be_special ^= BE_ALIEN

/mob/living/carbon/human/skitarii_hypaspist/proc/transfer_personality(var/client/candidate)

	if(!candidate)
		return

	isempty = 0
	src.mind = candidate.mob.mind
	src.ckey = candidate.ckey
	if(src.mind)
		src.mind.assigned_role = "imperium"

