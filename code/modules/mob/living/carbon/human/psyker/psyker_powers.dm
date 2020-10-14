//psyker code here

/mob/living/carbon/human/
	var/Stress = 0
	var/maxStress = 0
	var/Stress_rate = 5
	var/SoulStatus = "Stable"
	var/psymode = NON_PSYKERS

/mob/living/carbon/human/Stat()
	..()
	if(maxStress>0)
		stat(null, "Soul: [SoulStatus]")

/mob/living/carbon/human/Life()
	..()
	updatesoulstatus()
	if(Stress > 0)
		Stress = min(Stress-Stress_rate, maxStress)

/mob/living/carbon/human/proc/updatesoulstatus()
	if(maxStress > 0)
		if(SoulStatus == "Stable")
			adjustFireLoss(0)
			adjustCloneLoss(0)
			adjustStaminaLoss(0)

		if(SoulStatus == "Unstable")
			adjustFireLoss(2)
			adjustCloneLoss(1)

		if(SoulStatus == "Highly Unstable")
			adjustFireLoss(3)
			adjustCloneLoss(2)
			adjustStaminaLoss(3)

		if(SoulStatus == "Critical State")
			adjustFireLoss(5)
			adjustCloneLoss(3)
			adjustStaminaLoss(5)
			Stress_rate = 0
			spawn(300)
				Stress_rate = 5
	
	if(istype(src, /mob/living/carbon/human/whitelisted/eldar/leader))
		if(Stress < 80 && SoulStatus != "Stable")
			SoulStatus = "Stable"
			src << "\green Your soul becomes stable again."

		if(Stress >= 100 && Stress < 140 && SoulStatus != "Unstable")
			SoulStatus = "Unstable"
			src << "\blue Your soul begins to become unstable."

		if(Stress >= 140 && Stress < 180 && SoulStatus != "Highly Unstable")
			SoulStatus = "Highly Unstable"
			src << "\red Your soul is dangerously unstable."

		if(Stress == 180 && SoulStatus != "Critical State")
			SoulStatus = "Critical State"
			src << "\red Your soul is in critical state!!"

	else if(istype(src, /mob/living/carbon/human/whitelisted/eldar))
		if(Stress < 80 && SoulStatus != "Stable")
			SoulStatus = "Stable"
			src << "\green Your soul becomes stable again."

		if(Stress >= 80 && Stress < 120 && SoulStatus != "Unstable")
			SoulStatus = "Unstable"
			src << "\blue Your soul begins to become unstable."

		if(Stress >= 120 && Stress < 160 && SoulStatus != "Highly Unstable")
			SoulStatus = "Highly Unstable"
			src << "\red Your soul is dangerously unstable."

		if(Stress == 160 && SoulStatus != "Critical State")
			SoulStatus = "Critical State"
			src << "\red Your soul is in critical state!!"

	else if(istype(src, /mob/living/carbon/human/whitelisted))
		if(Stress < 60 && SoulStatus != "Stable")
			SoulStatus = "Stable"
			src << "\green Your soul becomes stable again."

		if(Stress >= 60 && Stress < 100 && SoulStatus != "Unstable")
			SoulStatus = "Unstable"
			src << "\blue Your soul begins to become unstable."

		if(Stress >= 100 && Stress < 120 && SoulStatus != "Highly Unstable")
			SoulStatus = "Highly Unstable"
			src << "\red Your soul is dangerously unstable."

		if(Stress == 120 && SoulStatus != "Critical State")
			SoulStatus = "Critical State"
			src << "\red Your soul is in critical state!!"

	else
		if(Stress < 40 && SoulStatus != "Stable")
			SoulStatus = "Stable"
			src << "\green Your soul becomes stable again."

		if(Stress >= 40 && Stress < 80 && SoulStatus != "Unstable")
			SoulStatus = "Unstable"
			src << "\blue Your soul begins to become unstable."

		if(Stress >= 80 && Stress < 100 && SoulStatus != "Highly Unstable")
			SoulStatus = "Highly Unstable"
			src << "\red Your soul is dangerously unstable."

		if(Stress == 100 && SoulStatus != "Critical State")
			SoulStatus = "Critical State"
			src << "\red Your soul is in critical state!!"

/mob/living/carbon/human/proc/psymode()
	set name = "Psyker Mode (OFF)"
	set desc = "Using this puts you into a psychic mode, in this mode you can use your main spells."
	set category = "Psy"
	
	if(istype(src, /mob/living/carbon/human/whitelisted/eldar/leader))
		psymode = WARLOCK
	
	else if(istype(src, /mob/living/carbon/human/whitelisted/eldar))
		psymode = ELDARPSYKER

	else if(istype(src, /mob/living/carbon/human/whitelisted))
		psymode = MUHREENPSYKER

	else
		psymode = HUMANPSYKER

	if(psymode == HUMANPSYKER || psymode == MUHREENPSYKER || psymode == ELDARPSYKER)
		src << "\blue Your mind starts casting the powers of the warp in your soul, you are able to use your main spells."
	else
		src << "\blue Your mind starts to cool down and you feel the warp pressure lifting from your soul, you arent able to use your main spells."

	verbs += /mob/living/carbon/human/proc/psymodeoff
	verbs -= /mob/living/carbon/human/proc/psymode

/mob/living/carbon/human/proc/psymodeoff()
	set name = "Psyker Mode (ON)"
	set desc = "Using this will put off the psyker mode, making you unable to use your main spells."
	set category = "Psy"
	psymode = NON_PSYKERS

	verbs += /mob/living/carbon/human/proc/psymode
	verbs -= /mob/living/carbon/human/proc/psymodeoff

/mob/living/carbon/human/proc/imprison(var/mob/living/carbon/T in oview(7))
	set name = "Imprison"
	set desc = "Uses your psychic abilities to imprison someone in their own mental barriers."
	set category = "Spells"
	if (stat != CONSCIOUS)
		src << "You must be conscious and alive to use psychic abilities."
		return
	if(Stress + 30 <= maxStress)
		Stress += 30
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/C in oview(7))
				victims += C
			T = input(src, "Who should we imprison?") as null|anything in victims
		if(T)
			if(!istype(T))
				src << "\red We only imprison living beings!"
				return
			src << "We psychically imprison [T]"
			visible_message("\green <B>[src]'s eyes glow green!</B>")
			for(var/turf/W in orange(10,T)) //Their entire view so they can't see outside the walls around them.
				if(get_dist(T,W) > 2)
					var/obj/effect/turf_projection/prison = project_turf(T,W) //Makes a ring of hallucinated walls around you.
					prison.lifetime = 600
		else
			src << "\blue You cannot imprison nothing!"
	else
		src << "\red Your soul cant handle that!"

/mob/living/carbon/human/proc/lightningbolt(var/atom/T)
	set name = "Lightning Bolt"
	set desc = "Smite your foes with a lightning bolt"
	set category = "Psy"
	if (stat != CONSCIOUS)
		src << "You must be conscious and alive to use psychic abilities."
		return
	if(Stress + 20 <= maxStress)
		Stress += 20
		if(!T)
			var/list/victims = list()
			for(var/mob/living/carbon/C in oview(7))
				victims += C
			T = input(src, "Who should we shoot?") as null|anything in victims
		if(T)
			src.visible_message("<span class='danger'>[src] projects a lightning bolt!", "<span class='alertalien'>You project a lightning bolt.</span>")
			var/turf/curloc = src.loc
			var/atom/targloc
			if(!istype(T, /turf/))
				targloc = get_turf(T)
			else
				targloc = T
			if (!targloc || !istype(targloc, /turf) || !curloc)
				return
			if (targloc == curloc)
				return
			var/obj/item/projectile/beam/lightningbolt/A = new /obj/item/projectile/beam/lightningbolt(src.loc)
			A.current = curloc
			A.yo = targloc.y - curloc.y
			A.xo = targloc.x - curloc.x
			A.process()
		else
			src << "\blue You cannot shoot at nothing!"
	else
		src << "\red Your soul cant handle that!"

/mob/living/carbon/human/proc/quickening()
	set name = "Mind Over Matter"
	set desc = "Use your psychich energy to stimulate reflexes to insane levels and negate all knockouts."
	set category = "Psy"
	if (stat != CONSCIOUS)
		src << "You must be conscious and alive to use psychic abilities."
		return
	if(dodging)
		src << "\red They are already active."
		return
	if(Stress + 40 <= maxStress)
		Stress += 40
		dodging = 1
		status_flags = 0
		src << "\red Adrenaline active."
		spawn(90)
			src << "\red Adrenaline no longer active."
			dodging = 0
			status_flags = CANPARALYSE|CANPUSH
		return
	else
		src << "\red Your soul cant handle that!"

/mob/living/carbon/human/proc/telepath(mob/M as mob in orange(30,src)) //Like whisper but free, and much farther range.
	set name = "Telepathy"
	set desc = "Project your mind to others."
	set category = "Psy"

	if(stat != CONSCIOUS)
		return

	var/msg = sanitize(input("Message:", "Whisper") as text|null)
	if(msg)
		log_say("Telepathy: [key_name(src)]->[M.key] : [msg]")
		M << "<span class='noticealien'><b><i>You hear a strange voice in your head... [msg]</i></b></span>"
		src << {"<span class='noticealien'>You said: "[msg]" to [M]</span>"}
