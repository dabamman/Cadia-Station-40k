/mob/living/carbon/human/sob/saints
	name = "Unknown"
	real_name = "Unknown"
	suicide_allowed = 0
	universal_speak = 1
	gender = "female"
	hair_color = "fff"
	hair_style = "Bobcurl"
	facial_hair_style = "Shaved"
	facial_hair_color = "fff"
	factions = list("imperium")//new

/mob/living/carbon/human/sob/saints/New()
	..()
	sleep (5)
	mutate("goldenglow") //Adding a little golden glow overlay for the SoB... Working on those wings. -Drake
	maxHealth = 5000
	health = 5000
	status_flags = 0
	luminosity = 10
	wings = 1
	immunetofire = 1
	var/obj/item/device/radio/headset/R = new /obj/item/device/radio/headset/headset_cent
	R.set_frequency(1441)
	equip_to_slot_or_del(R, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/sister, slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/sister, slot_shoes)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/sister, slot_gloves)
	equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/night, slot_glasses)
	equip_to_slot_or_del(new /obj/item/clothing/mask/breath, slot_wear_mask)
	equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sister/halo, slot_head)
	equip_to_slot_or_del(new /obj/item/weapon/chainsword/ultramarine_chainsword/glow, slot_belt)
	equip_to_slot_or_del(new /obj/item/weapon/shield/stormshield, slot_l_hand)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_r_store)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_l_store)
	equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/sister, slot_back)
	equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bolter/glow, slot_r_hand)


	var/namelist = list ("Tina", "Debra", "Julia", "Cassandra", "Elisa", "Verona", "Sandra", "Vera", "Drasa", "Tammara", "Lidia", "Chandra", "Samantha", "Claria", "Romania", "Sitrina", "Silena")
	var/rndname = pick(namelist)

	name = "Saint [rndname]"
	real_name = "Saint [rndname]"
	var/obj/item/weapon/card/id/W = new
	W.icon_state = "orange"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Special Ops Officer")
	W.assignment = "saint"
	W.registered_name = real_name
	W.update_label()
	equip_to_slot_or_del(W, slot_wear_id)
	sleep (20)
	rename_self("[name]")
	regenerate_icons()

/mob/living/carbon/human/sob/Life()
	..()
	if(prob(1))
		if(stat != DEAD)
			var/chat = pick('sound/voice/sob1.ogg','sound/voice/sob2.ogg', 'sound/voice/sob3.ogg', 'sound/voice/sob4.ogg')
			playsound(loc, chat, 75, 0)

/mob/living/carbon/human/sob/adjustFireLoss(var/amount)
	return
