//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(config.jobs_have_maint_access & SECURITY_HAS_MAINT_ACCESS)
		return list(access_maint_tunnels)
	return list()

/*
Head of Guardsmen
*/
/datum/job/hos
	title = "Commissar"
	flag = HOS
	department_head = list("Rogue Trader")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Rogue Trader"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14

	default_id = /obj/item/weapon/card/id/silver
	default_pda = /obj/item/device/pda/heads/hos
	default_headset = /obj/item/device/radio/headset/heads/hos
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)

/datum/job/hos/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/det(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat/comissar2(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/comissar2(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/commissar(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos/comissar2(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/chainofcommand/cwhip(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/sunglasses(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/sechailer(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H << "\blue Your regiment was bought out by a Rogue Trader, whom you now serve. You are charged with maintaining the morale of your men and detaining any harmful unsavory citizens. Brief your men and then assign them tasks. Ensure the guards stay vigilant and on task." // Job Explanation

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)


	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Power Sword","Mercy Chainsword", "Bolter Pistol", "Heavy Stubber")
		switch(weaponchoice)
			if("Power Sword")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/munitorium(H), slot_r_hand)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Bolter Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bpistol(H), slot_r_hand)
			if("Heavy Stubber")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/l6_saw(H), slot_r_hand)

/*
Warden
*/
/datum/job/warden
	title = "Sergeant"
	flag = WARDEN
	department_head = list("Commissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commissar"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_pda = /obj/item/device/pda/warden
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court) //See /datum/job/warden/get_access()

/datum/job/warden/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/warden(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/warden(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/warden(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/sunglasses(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/device/flash(H), slot_l_store)
	H << "\blue As a Sergeant you are tasked with keeping a watchful vigil over the Armory and the Brig if anyone is in it, lacking any heretical prisoners you are usually the eyes and ears for the Commissiar and Rogue trader regarding the happenings of the guardsmen. Enforce what discipline in the guards the commissiar fails to, and ensure the guardsmen remain on the assigned task." // Job explanation
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Guardsman's Sword", "Mercy Chainsword", "Hell Pistol")
		switch(weaponchoice)
			if("Guardsman's Sword")
				H.equip_to_slot_or_del(new /obj/item/weapon/complexsword/IGsword(H), slot_r_hand)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Hell Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/hellpistol(H), slot_r_hand)

/datum/job/warden/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L

/*
Detective
*/
/datum/job/detective
	title = "Enforcer"
	flag = DETECTIVE
	department_head = list("Commissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commissar"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_pda = /obj/item/device/pda/detective
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_brig)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)

/datum/job/detective/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/HoS(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/thermal/eyepatch(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/uzi(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/uzim45(H), slot_in_backpack)
	H << "\blue Watch the citizens of the station and investigate any possible heresy, bring it up to the Rogue Trader. Collect evidence and bring it to bear down on the person in question." // Job Explanation
	var/obj/item/clothing/mask/cigarette/cig = new /obj/item/clothing/mask/cigarette(H)
	cig.light("")
	H.equip_to_slot_or_del(cig, slot_wear_mask)

	if(H.backbag == 1)//Why cant some of these things spawn in his office?
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/collapsiblesword(H), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/collapsiblesword(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Mercy Chainsword", "Vox Legi Shotgun", "Lasgun (Fully Equipped)")
		switch(weaponchoice)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Vox Legi Shotgun")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/combat/voxlegis(H), slot_r_hand)
			if("Lasgun (Fully Equipped)")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_r_hand)
/*
Sanctioned Psyker
*/
/datum/job/imperialpsyker
	title = "Sanctioned Psyker"
	flag = IMPPSYKER
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1 // Might be changed in the future, probably not, we don't want the entire guard on the station to be psykers.
	spawn_positions = 1
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7 // This'll probably have to be changed in the future.
	var/list/dep_access = null

	default_pda = /obj/item/device/pda/security
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/satchel
	default_satchel = /obj/item/weapon/storage/backpack/satchel
	default_id = /obj/item/weapon/card/id/dogtag

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court) //But see /datum/job/warden/get_access()

/datum/job/imperialpsyker/equip_items(var/mob/living/carbon/human/H) // They'll need to get more Psyker-specific gear in the future.
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!

	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/spsykerboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/spsykercoat(H), slot_wear_suit) // The idea behind no armor is that, Psykers shouldn't be able to engage in DIRECT combat, they should work together with their fellow Guardsmen to stay safe.
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/spsykergloves(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/spsykerblindfold(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/staff(H), slot_r_hand)
	H << "\red An Imperial Sanctioned Psyker is an abomination in the eyes of many, a cursed existence only allowed its life by the mercy and benevolence of the God-Emperor of Mankind. After you were taken by the Black Ships at a young age, you were soulbound to the God-Emperor on Holy Terra and now use your psychic mutation in service of the Imperial Guard. Follow your orders wisely or you may well be put down, like the despicable mutant you are. Due note you carry no rank over anyone and at best will be a target if any warp manifestations are taking hold on the station."

	H.equip_to_slot_or_del(new /obj/item/weapon/bible(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/book/manual/security_space_law(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/seclite, slot_in_backpack)

	H.maxStress += 500 // Primaris Psykers are powerful, but not as powerful as Librarians, so they get half the amount Librarians do.
	H.verbs += /mob/living/carbon/human/proc/psymode
	H.verbs += /mob/living/carbon/human/proc/quickening
	H.verbs += /mob/living/carbon/human/proc/telepath
	//extra letters added on end to avoid duplicate definitions/clash with Librarians, real goose tape code I know - Wel

	H.mutations.Add(TK)
	H.update_mutations()

// if this doesn't work then I may need to make separate psyker page to separate from Librarians as it may have issues with carbon humans and carbon whitelisted humans

/*
Security Officer
*/
/datum/job/officer
	title = "Imperial Guard"
	flag = OFFICER
	department_head = list("Commissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 500
	spawn_positions = 5
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7
	var/list/dep_access = null

	default_pda = /obj/item/device/pda/security
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/impguard
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec
	default_id = /obj/item/weapon/card/id/dogtag

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court) //But see /datum/job/warden/get_access()

/datum/job/officer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/device/flash(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H << "\blue As a guardsmen you have dedicated your life in service to the God Emperor for the time being, your regiment was acquired by a Rogue Trader and is led by a Commissiar. On the station you may be tasked to a variety of things depending on the stated objective. You will be called upon in times of great need, carry on you the burden of protecting everyone else on the station." // Job Explanation

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/baton/loaded(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/weapon/book/manual/security_space_law(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/seclite, slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/baton/loaded(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/book/manual/security_space_law(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/seclite, slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select Class","Class Selection") as null|anything in list("Standard Guardsman", "Field Chiurgeon", "Sharpshooter", "Scout", "Shock Guardsman", "Heavy Weapons Specialist")
		switch(weaponchoice)
			if("Standard Guardsman")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/complexknife/combatknife(H), slot_in_backpack)
			if("Field Chiurgeon")
				if(!H.unEquip(H.gloves))
					qdel(H.gloves)
				H.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex, slot_gloves)
				H.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, slot_glasses)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/pill_bottle/stimulant, slot_r_store)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/impguard, slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/impguard, slot_in_backpack)
			if("Sharpshooter") // I couldn't think of anything else for this class, further expansion would be appreciated.
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/longlas(H), slot_r_hand)
			if("Scout")
				H.equip_to_slot_or_del(new /obj/item/clothing/mask/bandana/red, slot_wear_mask)
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/pistol(H), slot_r_hand) // Currently a Stubber Pistol, might be switched out for a Laspistol if it's shit.
				H.equip_to_slot_or_del(new /obj/item/weapon/complexsword/IGsword(H), slot_l_hand)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m10mm, slot_r_store)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m10mm, slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m10mm, slot_in_backpack)
			if("Shock Guardsman")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/autogun2(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/autogun, slot_r_store)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/autogun, slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/autogun, slot_in_backpack)
			if("Heavy Weapons Specialist")
				if(!H.unEquip(H.wear_suit))
					qdel(H.wear_suit)
				if(!H.unEquip(H.head))
					qdel(H.head)
				if(!H.unEquip(H.shoes))
					qdel(H.shoes)
				H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots/reinforced(H), slot_shoes)
				H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/reinforced(H), slot_wear_suit)
				H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet/reinforced(H), slot_head)
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/l6_saw(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m762, slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m762, slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/m762, slot_r_store)

/datum/job/officer/get_access()
	var/list/L = list()
	if(dep_access)
		L |= dep_access.Copy()
	L |= ..() | check_config_for_sec_maint()
	dep_access = null;
	return L

var/list/sec_departments = list("engineering", "supply", "medical", "science")

/datum/job/officer/proc/assign_sec_to_department(var/mob/living/carbon/human/H)
	if(!sec_departments.len)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	else
		var/department = pick(sec_departments)
		sec_departments -= department
		var/destination = null
		switch(department)
			if("supply")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/cargo(H), slot_w_uniform)
				default_headset = /obj/item/device/radio/headset/headset_sec/department/supply
				dep_access = list(access_mailsorting, access_mining)
				destination = /area/security/checkpoint/supply
			if("engineering")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/engine(H), slot_w_uniform)
				default_headset = /obj/item/device/radio/headset/headset_sec/department/engi
				dep_access = list(access_construction, access_engine)
				destination = /area/security/checkpoint/engineering
			if("medical")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/med(H), slot_w_uniform)
				default_headset = /obj/item/device/radio/headset/headset_sec/department/med
				dep_access = list(access_medical)
				destination = /area/security/checkpoint/medical
			if("science")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/science(H), slot_w_uniform)
				default_headset = /obj/item/device/radio/headset/headset_sec/department/sci
				dep_access = list(access_research)
				destination = /area/security/checkpoint/science
		var/teleport = 0
		if(!config.sec_start_brig)
			if(destination)
				if(!ticker || ticker.current_state <= GAME_STATE_SETTING_UP)
					teleport = 1
		if(teleport)
			var/turf/T
			var/safety = 0
			while(safety < 25)
				T = safepick(get_area_turfs(destination))
				if(T && !H.Move(T))
					safety += 1
					continue
				else
					break
		H << "<b>You have been assigned to [department]!</b>"
		return

/obj/item/device/radio/headset/headset_sec/department/New()
	wires = new(src)
	secure_radio_connections = new

	if(radio_controller)
		initialize()
	recalculateChannels()

/obj/item/device/radio/headset/headset_sec/department/engi
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_sec/department/supply
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_sec/department/med
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sec/department/sci
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_sci

/obj/item/clothing/under/rank/security/cargo/New()
	attachTie(new /obj/item/clothing/tie/armband/cargo)

/obj/item/clothing/under/rank/security/engine/New()
	attachTie(new /obj/item/clothing/tie/armband/engine)

/obj/item/clothing/under/rank/security/science/New()
	attachTie(new /obj/item/clothing/tie/armband/science)

/obj/item/clothing/under/rank/security/med/New()
	attachTie(new /obj/item/clothing/tie/armband/medblue)
