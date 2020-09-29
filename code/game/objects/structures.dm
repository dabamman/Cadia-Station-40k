obj/structure
	icon = 'icons/obj/structures.dmi'

	var/climb_time = 20
	var/climb_stun = 20
	var/climbable = FALSE
	var/mob/living/structureclimber
	var/borked = 0 //similar to machinery's stat BROKEN

obj/structure/blob_act()
	if(prob(50))
		qdel(src)

obj/structure/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				qdel(src)
				return
		if(3.0)
			return

/obj/structure/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(structureclimber && structureclimber != user)
		user.changeNext_move(CLICK_CD_MELEE)
		user.do_attack_animation(src)
		structureclimber.visible_message("<span class='warning'>[structureclimber] is knocked off [src].</span>", "<span class='warning'>You're knocked off [src]!</span>", "<span class='warning'>You see [structureclimber] get knocked off [src].</span>")

/obj/structure/MouseDrop_T(atom/movable/O, mob/user)
	. = ..()
	if(!climbable)
		return
	if(!istype(O, /obj/item) || user.get_active_hand() != O)
		return
	if(!user.drop_item(O))
		return
	if (O.loc != src.loc)
		step(O, get_dir(O, src))

/obj/structure/proc/do_climb(atom/movable/A)
	if(climbable)
		if(A.loc == src.loc)
			var/turf/where_to_climb = get_step(A,dir)
			if(!where_to_climb.is_blocked_turf())
				A.forceMove(where_to_climb)
				return TRUE
		density = FALSE
		. = step(A,get_dir(A,src.loc))
		density = TRUE

/obj/structure/proc/climb_structure(mob/living/user)
	src.add_fingerprint(user)
	user.visible_message("<span class='warning'>[user] starts climbing onto [src].</span>", \
								"<span class='notice'>You start climbing onto [src]...</span>")
	var/adjusted_climb_time = climb_time
	if(user.restrained()) //climbing takes twice as long when restrained.
		adjusted_climb_time *= 2
	if(isalien(user))
		adjusted_climb_time *= 0.25 //aliens are terrifyingly fast
	structureclimber = user
	if(do_mob(user, user, adjusted_climb_time))
		if(src.loc) //Checking if structure has been destroyed
			if(do_climb(user))
				user.visible_message("<span class='warning'>[user] climbs onto [src].</span>", \
									"<span class='notice'>You climb onto [src].</span>")
				if(climb_stun)
					user.Stun(climb_stun)
				. = 1
			else
				usr << "<span class='warning'>You fail to climb onto [src].</span>"
	structureclimber = null

