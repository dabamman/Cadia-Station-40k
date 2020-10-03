// AN attempt to make emotes - Wel Ard (This is probably a horrible idea and will lead to terrible things.)

/mob
	var/next_emote_sound_allowed



/mob/living/carbon/human/verb/scream()
	set name = "Scream"
	set category = "Emotes"
	set desc = "Yell out in fear!"

	if(next_emote_sound_allowed > world.time)
		return
	say("*scream")
	playsound(src,'sound/emotes/scream.ogg',50,1)
	next_emote_sound_allowed = world.time+50


/mob/living/carbon/human/verb/cry()
	set name = "Cry"
	set category = "Emotes"
	set desc = "Sob"

	if(next_emote_sound_allowed > world.time)
		return
	say("*cry")
	playsound(src,'sound/emotes/cry.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/laugh()
	set name = "Laugh"
	set category = "Emotes"
	set desc = "Laugh out loud!"

	if(next_emote_sound_allowed > world.time)
		return
	say("*laugh")
	playsound(src,'sound/emotes/laugh.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/yawn()
	set name = "Yawn"
	set category = "Emotes"
	set desc = "I'm sleepy."

	if(next_emote_sound_allowed > world.time)
		return
	say("*yawn")
	playsound(src,'sound/emotes/yawn.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/empprotects()
	set name = "Emperor Protects"
	set category = "Emotes"
	set desc = "The Emperor Protects!"

	if(next_emote_sound_allowed > world.time)
		return
	say("The Emperor protects.")
	playsound(src,'sound/emotes/emperorprotects.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/sigh()
	set name = "Sigh"
	set category = "Emotes"
	set desc = "Sighs"

	if(next_emote_sound_allowed > world.time)
		return
	say("*sigh")
	playsound(src,'sound/emotes/sigh.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/whimper()
	set name = "Whimper"
	set category = "Emotes"
	set desc = "Whimper"

	if(next_emote_sound_allowed > world.time)
		return
	say("*whimper")
	playsound(src,'sound/emotes/whimper.ogg',50,1)
	next_emote_sound_allowed = world.time+50

/mob/living/carbon/human/verb/groan()
	set name = "Groan"
	set category = "Emotes"
	set desc = "groan in pain"

	if(next_emote_sound_allowed > world.time)
		return
	say("*groan")
	playsound(src,'sound/emotes/groan.ogg',50,1)
	next_emote_sound_allowed = world.time+50


/* 2 funny to delete, but too troll to leave in
/mob/living/carbon/human/verb/poop()
	set name = "Poop"
	set category = "Emotes"
	set desc = "Uh oh, stinky!"

	if(next_emote_sound_allowed > world.time)
		return
	me_verb("drops their pants and begins to push...")
	playsound(src,'sound/emotes/poo.ogg',50,1)
	next_emote_sound_allowed = world.time+500000000
	new /obj/item/weapon/reagent_containers/food/snacks/poop(src.loc)
    */



/*
Space Marine Emotes
*/

/mob/living/carbon/human/whitelisted/um/verb/empprotex()
	set name = "For the Emperor"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("For the Emperor!!!")
	playsound(src,'sound/emotes/marineforbigE.ogg',50,1)
	next_emote_sound_allowed = world.time+90

/mob/living/carbon/human/whitelisted/rg/verb/empprotex()
	set name = "For the Emperor"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("For the Emperor!!!")
	playsound(src,'sound/emotes/marineforbigE.ogg',50,1)
	next_emote_sound_allowed = world.time+90

/mob/living/carbon/human/whitelisted/sm/verb/empprotex()
	set name = "For the Emperor"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("For the Emperor!!!")
	playsound(src,'sound/emotes/marineforbigE.ogg',50,1)
	next_emote_sound_allowed = world.time+90

/mob/living/carbon/human/whitelisted/sm/verb/cutxeno()
	set name = "Kill xenos"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("Cut down the aliens!")
	playsound(src,'sound/emotes/antixeno.ogg',50,1)
	next_emote_sound_allowed = world.time+90

/mob/living/carbon/human/whitelisted/rg/verb/cutxeno()
	set name = "Kill xenos"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("Cut down the aliens!")
	playsound(src,'sound/emotes/antixeno.ogg',50,1)
	next_emote_sound_allowed = world.time+90

/mob/living/carbon/human/whitelisted/um/verb/cutxeno()
	set name = "Kill xenos"
	set category = "Emotes"
	set desc = "For big E!"

	if(next_emote_sound_allowed > world.time)
		return
	say("Cut down the aliens!")
	playsound(src,'sound/emotes/antixeno.ogg',50,1)
	next_emote_sound_allowed = world.time+90
/*
Sisters of Battle Emotes
*/

/mob/living/carbon/human/sob/verb/empprotex()
	set name = "Dying wail"
	set category = "Emotes"
	set desc = "Ow."

	if(next_emote_sound_allowed > world.time)
		return
	say("For the Emperor!!!")
	playsound(src,'sound/emotes/Sasha.ogg',50,1)
	next_emote_sound_allowed = world.time+90