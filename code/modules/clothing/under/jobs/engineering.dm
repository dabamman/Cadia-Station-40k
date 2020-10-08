//Contains: Engineering department jumpsuits
/obj/item/clothing/under/rank/chief_engineer
	desc = "It's a high visibility jumpsuit given to those engineers insane enough to achieve the rank of \"Chief engineer\". It has minor radiation shielding."
	name = "chief engineer's jumpsuit"
	icon_state = "chiefengineer"
	item_state = "g_suit"
	item_color = "chief"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 10)

/obj/item/clothing/under/rank/atmospheric_technician
	desc = "It's a jumpsuit worn by atmospheric technicians."
	name = "atmospheric technician's jumpsuit"
	icon_state = "atmos"
	item_state = "atmos_suit"
	item_color = "atmos"

/obj/item/clothing/under/rank/engineer
	desc = "It's an orange high visibility jumpsuit worn by engineers. It has minor radiation shielding."
	name = "engineer's jumpsuit"
	icon_state = "robotics2"
	item_state = "robotics2"
	item_color = "robotics2"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 10)

/obj/item/clothing/under/rank/roboticist
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	name = "roboticist's jumpsuit"
	icon_state = "robotics"
	item_state = "robotics"
	item_color = "robotics"

/obj/item/clothing/under/rank/skitunder
	desc = "Subdermal armor plating, reinforced cybernetic enhancements, reflec coated augmentations, and other upgrades designed to be more resistant to damage. It can't be removed as it's, y'know, a part of your body. "
	name = "sturdy cybernetics"
	icon_state = "skit_s"
	item_state = "skit_s"
	item_color = "skit_s"
	has_sensor = 2 // As if the Adeptus Mechanicus would let the Skitarii turn off a way to gather more data.
	gender = PLURAL
	body_parts_covered = GROIN|LEGS|HEAD
	armor = list(melee = 15, bullet = 15, laser = 10, energy = 10, bomb = 10, bio = 25, rad = 25)
	flags = NODROP