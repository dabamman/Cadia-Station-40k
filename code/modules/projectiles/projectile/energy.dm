/obj/item/projectile/energy
	name = "energy"
	icon_state = "spark"
	damage = 0
	damage_type = BURN
	flag = "energy"
	trace_residue = "Minor electrical discolouration."


/obj/item/projectile/energy/electrode
	name = "electrode"
	icon_state = "spark"
	stun = 2
	weaken = 2
	stutter = 10
	hitsound = "sparks"

	on_hit(var/atom/target, var/blocked = 0)
		if(!ismob(target) || blocked >= 2) //Fully blocked by mob or collided with dense object - burst into sparks!
			var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread
			sparks.set_up(1, 1, src)
			sparks.start()
		..()

/obj/item/projectile/energy/declone
	name = "biological deconstructor ray"
	icon_state = "declone"
	damage = 20
	damage_type = CLONE
	irradiate = 40
	trace_residue = "Some sort of nanomachines."

/obj/item/projectile/energy/dart
	name = "dart"
	icon_state = "toxin"
	damage = 5
	damage_type = TOX
	weaken = 5
	trace_residue = null


/obj/item/projectile/energy/bolt
	name = "bolt"
	icon_state = "shuriken"
	damage = 10
	damage_type = TOX
	nodamage = 0
	weaken = 10
	stutter = 10
	trace_residue = null

/obj/item/projectile/energy/shuriken
	name = "shuriken"
	icon_state = "shuriken"
	damage = 10
	damage_type = TOX
	nodamage = 0
	weaken = 10
	stutter = 10
	trace_residue = null

/obj/item/projectile/energy/bolt/large
	name = "largebolt"
	damage = 10

/obj/item/projectile/energy/disabler
	name = "disabler beam"
	icon_state = "omnilaser"
	damage = 34
	damage_type = STAMINA
	var/range = 7

/obj/item/projectile/energy/disabler/Range()
	range--
	if(range <= 0)
		delete()

/obj/item/projectile/energy/heavyplasma //A sort of hybrid between a meltagun shot and a plasma gun shot.
	name = "heavy plasma"
	icon = 'icons/obj/largeprojectiles.dmi'
	icon_state = "plasma"
	damage = 30
	trace_residue = "Unfocused charring patterns."
	piercing = 100
	woundtype = /datum/wound/melt


/obj/item/projectile/energy/plasma
	name = "plasma"
	icon_state = "plasmagun"
	damage = 30
	damage_type = BURN
	flag = "energy"
	trace_residue = "Serious Burns"
	woundtype = /datum/wound/melt

/*
pulseb
*/

/obj/item/projectile/energy/pulseb
	name = "pulse blast"
	icon_state = "ice_1" //needs icon?
	damage = 140
	damage_type = BURN
	flag = "bullet"
	trace_residue = "Serious Burns"
	woundtype = /datum/wound/melt

/obj/item/projectile/energy/pulseb/New()
	spawn(4)
		qdel(src)

/obj/item/projectile/energy/test
	name = "tester beam"
	icon_state = "testbeam"
	damage = 75
	damage_type = BURN
	flag = "bullet"
	pixel_shot = 1
	diagnostic = 1
	delay = 50

/obj/item/projectile/energy/laslathe
	name = "lasbolt"
	icon_state = "laser"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 20
	damage_type = BURN
	flag = "laser"
	trace_residue = "Focused charring patterns."
	woundtype = /datum/wound/laser