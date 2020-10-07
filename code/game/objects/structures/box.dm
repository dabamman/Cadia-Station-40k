/obj/structure/box
	name = "Box of parts"
	desc = "Fresh from the munitorum supply station."
	icon = 'icons/obj/storage.dmi'
	icon_state = "boxstuff"
	density = 1

/obj/structure/box/attackby(var/obj/item/W as obj,mob/user as mob)
	if(istype(W, /obj/item/device/allenwrench))
		interact(user)
		usr.visible_message("<span class='warning'>  [usr] takes a look in the box.</span>", "<span class='notice'>Lets have a look</span>", "<span class='warning>What was that sound?</span>")

		user.set_machine(src)

		var/dat = {"<br>Ready to build<br>
		<a href='?src=\ref[src];SENT=1'>Sentinel</a><br>
		<a href='?src=\ref[src];CHIMAC2=1'>Chimera, Inquisition</a><br>
		<a href='?src=\ref[src];CHIMAC=1'>Chimera, AutoCannon</a> |
		<a href='?src=\ref[user];mach_close=computer'>Nothing</a>"}

		user << browse(dat, "window=computer;size=575x450")
		onclose(user, "computer")
		return
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

/obj/structure/box/Topic(href, href_list)
	if(..())
		return

	var/mob/living/user = usr

	user.set_machine(src)

	if(href_list["SENT"])
		usr.visible_message("<span class='warning'>  [usr] begins constructing something elaborate.</span>", "<span class='notice'>You start to build a Sentinel</span>", "<span class='warning>What was that sound?</span>")
		sleep (30)
		new /obj/mecha/combat/sentinel/loaded(src.loc)
		usr.visible_message("<span class='notice'>[usr] completes the Sentinel.</span>")
		qdel(src)
	else if(href_list["CHIMAC"])
		usr.visible_message("<span class='warning'>  [usr] begins constructing something elaborate.</span>", "<span class='notice'>You start to build a Chimera</span>", "<span class='warning>What was that sound?</span>")
		sleep (30)
		new /obj/mecha/combat/chimera/AC/loaded(src.loc)
		usr.visible_message("<span class='notice'>[usr] completes the Chimera.</span>")
		qdel(src)
	else if(href_list["CHIMAC2"])
		usr.visible_message("<span class='warning'>  [usr] begins constructing something elaborate.</span>", "<span class='notice'>You start to build a Chimera</span>", "<span class='warning>What was that sound?</span>")
		sleep (30)
		new /obj/mecha/combat/chimera/inq/loaded(src.loc)
		usr.visible_message("<span class='notice'>[usr] completes the Chimera.</span>")
		qdel(src)
	return

/*
Repackaged Spider Turrets
*/

/obj/structure/spiderturretbox/lasgun
	name = "Las Spider Turret"
	desc = "A repackaged spider turret. Ready for transport. Use a turret interface device or a Tech Priest's special tool on this."
	icon = 'icons/obj/turrets3.dmi'
	icon_state = "boxstuff"
	density = 1

/obj/structure/spiderturretbox/lasgun/attackby(I as obj, user as mob)
	if(istype(I, /obj/item/device/allenwrench))
		new /obj/machinery/spiderturret/lasgun(src.loc)
		playsound(src.loc, 'sound/mecha/nominal.ogg', 60, 1)
		usr.visible_message("<span class='notice'>The spider turret unfolds into place and activates!</span>")
		qdel(src)
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

/obj/structure/spiderturretbox/plasma
	name = "Plasma Spider Turret"
	desc = "A repackaged spider turret. Ready for transport. Use a turret interface device or a Tech Priest's special tool on this."
	icon = 'icons/obj/turrets4.dmi'
	icon_state = "boxstuff"
	density = 1

/obj/structure/spiderturretbox/plasma/attackby(I as obj, user as mob)
	if(istype(I, /obj/item/device/allenwrench))
		new /obj/machinery/spiderturret/plasma(src.loc)
		playsound(src.loc, 'sound/mecha/nominal.ogg', 60, 1)
		usr.visible_message("<span class='notice'>The spider turret unfolds into place and activates!</span>")
		qdel(src)
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

/obj/structure/spiderturretbox/projectile
	name = "Projectile Spider Turret"
	desc = "A repackaged spider turret. Ready for transport. Use a turret interface device or a Tech Priest's special tool on this."
	icon = 'icons/obj/turrets.dmi'
	icon_state = "boxstuff"
	density = 1

/obj/structure/spiderturretbox/projectile/attackby(I as obj, user as mob)
	if(istype(I, /obj/item/device/allenwrench))
		new /obj/machinery/spiderturret/projectile(src.loc)
		playsound(src.loc, 'sound/mecha/nominal.ogg', 60, 1)
		usr.visible_message("<span class='notice'>The spider turret unfolds into place and activates!</span>")
		qdel(src)
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

/obj/structure/spiderturretbox/taser
	name = "Taser Spider Turret"
	desc = "A repackaged spider turret. Ready for transport. Use a turret interface device or a Tech Priest's special tool on this."
	icon = 'icons/obj/turrets2.dmi'
	icon_state = "boxstuff"
	density = 1

/obj/structure/spiderturretbox/taser/attackby(I as obj, user as mob)
	if(istype(I, /obj/item/device/allenwrench))
		new /obj/machinery/spiderturret/taser(src.loc)
		playsound(src.loc, 'sound/mecha/nominal.ogg', 60, 1)
		usr.visible_message("<span class='notice'>The spider turret unfolds into place and activates!</span>")
		qdel(src)
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

//Skitarii from a box!

/obj/structure/skitariiparts
	name = "Skitarii Hypaspist cryostasis coffin"
	desc = "A Skitarii Hypaspist contained in a cryostasis coffin for long-term storage, picked up by the Rogue Trader from the last forge world visit. A Tech-Priest is needed to activate the Skitarii with the correct techna-lingua access codes."
	icon = 'icons/obj/storage.dmi'
	icon_state = "cryostasiscoffin"
	density = 1

/obj/structure/skitariiparts/attackby(var/obj/item/W as obj,mob/user as mob)
	if(istype(W, /obj/item/device/allenwrench))
		interact(user)
		usr.visible_message("<span class='warning'>  [usr] takes a look at the data-screen on the side of the cryostasis coffin.</span>", "<span class='notice'>You inspect the data-screen on the side of the cryostasis coffin.</span>", "<span class='warning>What was that sound?</span>")

		user.set_machine(src)

		var/dat = {"<br>Ready to awaken<br>
		<a href='?src=\ref[src];RNGR=1'>Skitarii Hypaspist</a><br>"}

		user << browse(dat, "window=computer;size=575x450")
		onclose(user, "computer")
		return
	else
		usr.visible_message("<span class='notice'>I think you need a Tech Priest to take a look at this.</span>")
		return

/obj/structure/skitariiparts/Topic(href, href_list)
	if(..())
		return

	var/mob/living/user = usr

	user.set_machine(src)

	if(href_list["RNGR"])
		usr.visible_message("<span class='warning'>  [usr] begins to type a code into the cryostasis coffin.</span>", "<span class='notice'>You start to input the access codes to awaken the Skitarii Hypaspist.</span>", "<span class='warning>What was that sound?</span>")
		sleep (30)
		playsound(loc, 'sound/machines/airlock.ogg', 75, 0)
		new /mob/living/carbon/human/skitarii_hypaspist(src.loc)
		usr.visible_message("<span class='notice'>[usr] steps back as the cryostasis coffin opens with a short hiss of mist, awakening the Skitarii within.</span>")
		qdel(src)