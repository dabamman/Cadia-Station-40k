/*
LASGUNS
*/

//Lasguns

/obj/item/weapon/gun/projectile/automatic/lasgun
	name = "lasgun"
	desc = "The standard-issue rifle of the Astra Militarum as well as one of the most common weapons found in the Imperium of Man. "
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK
	origin_tech = "combat=5;materials=1;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/lasgunmag
	fire_sound = 'sound/weapons/lasgun.ogg'
	scoped = 0
	chainb = 0
	canscope = 0
	zoom = 0
	canattach = 0
	scopetype = 0
	ejectcasing = 0 //Technically energy based! None of that!
	var/projectiles_per_shot = 3
	var/deviation = 0
	var/projectiles = 10000000000
	var/cooldown = 1
	var/projectile = /obj/item/projectile/bullet/lasgun

/obj/item/weapon/gun/projectile/automatic/lasgun/process_chamber(var/eject_casing = 0, var/empty_chamber = 1)    //be afraid of my skill
	..()

/*
Adding a lascannon here because I would rather not make a new file for a simple additional las-weapon.
*/

/obj/item/weapon/gun/projectile/automatic/lascannon
	name = "Las-Cannon"
	desc = "A heavy las-weapon that is particularly effective against armored opponents."
	icon_state = "lascannon"
	item_state = "lascannon"
	origin_tech = "combat=7;materials=3;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/lascannonmag
	fire_sound = 'sound/weapons/lasgun.ogg'
	ejectcasing = 0 //Technically energy based! None of that!

/obj/item/weapon/gun/projectile/automatic/evgun
	name = "Lucious Pattern Lasgun"
	desc = "Standed issue ranged weapon of the Imperial Guard"
	icon_state = "evgun"
	item_state = "evgun"
	slot_flags = SLOT_BACK
	origin_tech = "combat=5;materials=1;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/evmag
	fire_sound = 'sound/weapons/lasgun.ogg'
	scoped = 0
	chainb = 0
	canscope = 0
	canattach = 0
	ejectcasing = 0 //Technically energy based! None of that!
	var/projectiles_per_shot = 3
	var/deviation = 0
	var/projectiles = 10000000000
	var/cooldown = 1
	var/projectile = /obj/item/projectile/bullet/lasgun

/obj/item/weapon/gun/projectile/automatic/evgun/process_chamber(var/eject_casing = 0, var/empty_chamber = 1)    //be afraid of my skill
	..()

/obj/item/weapon/gun/projectile/automatic/latherifle
	name = "integrated lathe-crafted lasrifle"
	desc = "An integrated lasrifle hooked up to your internal power supply and controlled through a Mind Impulse Unit. The direct connection to your power supply ensures thousands of shots before the capacitor needs to be recharged."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = 0
	fire_sound = 'sound/weapons/lasgun.ogg'
	ejectcasing = 0 //Technically energy based! None of that!
	flags = NODROP|THICKMATERIAL | STOPSPRESSUREDMAGE
	force = 15.0 //Not bad for clubbing people with.
	var/projectiles_per_shot = 3
	var/deviation = 0
	var/projectiles = 100000
	var/cooldown = 1
	var/projectile = /obj/item/projectile/bullet/las

/obj/item/weapon/gun/projectile/automatic/latherifle/dropped()
	qdel(src)

/obj/item/weapon/gun/projectile/automatic/latherifle/process_chamber(var/eject_casing = 0, var/empty_chamber = 1)    //be afraid of my skill
	..()