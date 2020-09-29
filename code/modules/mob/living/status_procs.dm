//PARALYZE this is WIP to eventually port over TG procs - wel

/*
/mob/living/proc/IsParalyzed() //If we're immobilized
	return has_status_effect(STATUS_EFFECT_PARALYZED)

/mob/living/proc/AmountParalyzed() //How many deciseconds remain in our Paralyzed status effect
	var/datum/status_effect/incapacitating/paralyzed/P = IsParalyzed(FALSE)
	if(P)
		return P.duration - world.time
	return 0

/mob/living/proc/Paralyze(amount, updating = TRUE, ignore_canstun = FALSE) //Can't go below remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_PARALYZE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(((status_flags & CANKNOCKDOWN) && !HAS_TRAIT(src, TRAIT_STUNIMMUNE)) || ignore_canstun)
		if(absorb_stun(amount, ignore_canstun))
			return
		var/datum/status_effect/incapacitating/paralyzed/P = IsParalyzed(FALSE)
		if(P)
			P.duration = max(world.time + amount, P.duration)
		else if(amount > 0)
			P = apply_status_effect(STATUS_EFFECT_PARALYZED, amount, updating)
		return P

/mob/living/proc/SetParalyzed(amount, updating = TRUE, ignore_canstun = FALSE) //Sets remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_PARALYZE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(((status_flags & CANKNOCKDOWN) && !HAS_TRAIT(src, TRAIT_STUNIMMUNE)) || ignore_canstun)
		var/datum/status_effect/incapacitating/paralyzed/P = IsParalyzed(FALSE)
		if(amount <= 0)
			if(P)
				qdel(P)
		else
			if(absorb_stun(amount, ignore_canstun))
				return
			if(P)
				P.duration = world.time + amount
			else
				P = apply_status_effect(STATUS_EFFECT_PARALYZED, amount, updating)
		return P

/mob/living/proc/AdjustParalyzed(amount, updating = TRUE, ignore_canstun = FALSE) //Adds to remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_PARALYZE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(((status_flags & CANKNOCKDOWN) && !HAS_TRAIT(src, TRAIT_STUNIMMUNE)) || ignore_canstun)
		if(absorb_stun(amount, ignore_canstun))
			return
		var/datum/status_effect/incapacitating/paralyzed/P = IsParalyzed(FALSE)
		if(P)
			P.duration += amount
		else if(amount > 0)
			P = apply_status_effect(STATUS_EFFECT_PARALYZED, amount, updating)
		return P */