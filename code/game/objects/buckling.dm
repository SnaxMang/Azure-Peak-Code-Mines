/atom/movable
	var/can_buckle = 0
	var/buckle_lying = -1 //bed-like behaviour, forces mob.lying = buckle_lying if != -1
	var/buckle_requires_restraints = 0 //require people to be handcuffed before being able to buckle. eg: pipes
	var/list/mob/living/buckled_mobs = null //list()
	var/max_buckled_mobs = 1
	var/buckle_prevents_pull = FALSE
	var/buckleverb = "sit"
	var/sleepy = 0

//Interaction
/atom/movable/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(can_buckle && has_buckled_mobs())
		if(buckled_mobs.len > 1)
			var/unbuckled = input(user, "Who do you wish to remove?","?") as null|mob in sortNames(buckled_mobs)
			if(user_unbuckle_mob(unbuckled,user))
				return 1
		else
			if(user_unbuckle_mob(buckled_mobs[1],user))
				return 1

/atom/movable/MouseDrop_T(mob/living/M, mob/living/user)
	. = ..()
	return mouse_buckle_handling(M, user)

/atom/movable/proc/mouse_buckle_handling(mob/living/M, mob/living/user)
	if(can_buckle && istype(M) && istype(user))
		if(user_buckle_mob(M, user))
			return TRUE

/atom/movable/proc/has_buckled_mobs()
	return LAZYLEN(buckled_mobs)

//procs that handle the actual buckling and unbuckling
/atom/movable/proc/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	if(!buckled_mobs)
		buckled_mobs = list()

	if(!istype(M))
		return FALSE

	if(check_loc && M.loc != loc)
		return FALSE

	if((!can_buckle && !force) || M.buckled || (buckled_mobs.len >= max_buckled_mobs) || (buckle_requires_restraints && !M.restrained()) || M == src)
		return FALSE

	// This signal will check if the mob is mounting this atom to ride it. There are 3 possibilities for how this goes
	// 1. This movable doesn't have a ridable element and can't be ridden, so nothing gets returned, so continue on
	// 2. There's a ridable element but we failed to mount it for whatever reason (maybe it has no seats left, for example), so we cancel the buckling
	// 3. There's a ridable element and we were successfully able to mount, so keep it going and continue on with buckling
	if(SEND_SIGNAL(src, COMSIG_MOVABLE_PREBUCKLE, M, force) & COMPONENT_BLOCK_BUCKLE)
		return FALSE

	M.buckling = src
	if(!M.can_buckle() && !force)
		if(M == usr)
			to_chat(M, span_warning("I am unable to [buckleverb] on [src]."))
		else
			to_chat(usr, span_warning("I am unable to [buckleverb] [M] on [src]."))
		M.buckling = null
		return FALSE

	if(M.pulledby)
		if(buckle_prevents_pull)
			M.pulledby.stop_pulling()
		else if(isliving(M.pulledby))
			M.reset_offsets("pulledby")

	if(!check_loc && M.loc != loc)
		M.forceMove(loc)

	M.buckling = null
	M.buckled = src
	M.setDir(dir)
	buckled_mobs |= M
	M.update_mobility()
	M.throw_alert("buckled", /atom/movable/screen/alert/restrained/buckled)
	M.set_glide_size(glide_size)
	post_buckle_mob(M)

	SEND_SIGNAL(src, COMSIG_MOVABLE_BUCKLE, M, force)
	return TRUE

/obj/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	. = ..()
	if(.)
		if(resistance_flags & ON_FIRE) //Sets the mob on fire if you buckle them to a burning atom/movableect
			M.adjust_fire_stacks(1)
			M.IgniteMob()

/atom/movable/proc/unbuckle_mob(mob/living/buckled_mob, force=FALSE)
	if(istype(buckled_mob) && buckled_mob.buckled == src && (buckled_mob.can_unbuckle() || force))
		. = buckled_mob
		buckled_mob.buckled = null
		buckled_mob.anchored = initial(buckled_mob.anchored)
		buckled_mob.update_mobility()
		buckled_mob.clear_alert("buckled")
		buckled_mob.set_glide_size(DELAY_TO_GLIDE_SIZE(buckled_mob.total_multiplicative_slowdown()))
		buckled_mobs -= buckled_mob
		SEND_SIGNAL(src, COMSIG_MOVABLE_UNBUCKLE, buckled_mob, force)
//		if(buckle_lying)
//			buckled_mob.set_resting(FALSE)
		post_unbuckle_mob(.)

/atom/movable/proc/unbuckle_all_mobs(force=FALSE)
	if(!has_buckled_mobs())
		return
	for(var/m in buckled_mobs)
		unbuckle_mob(m, force)

//Handle any extras after buckling
//Called on buckle_mob()
/atom/movable/proc/post_buckle_mob(mob/living/M)

//same but for unbuckle
/atom/movable/proc/post_unbuckle_mob(mob/living/M)

//Wrapper procs that handle sanity and user feedback
/atom/movable/proc/user_buckle_mob(mob/living/M, mob/user, check_loc = TRUE)
	if(!in_range(user, src) || !isturf(user.loc) || user.incapacitated() || M.anchored)
		return FALSE

	add_fingerprint(user)
	. = buckle_mob(M, check_loc = check_loc)
	if(.)
		if(M == user)
			M.visible_message(span_notice("[M] [buckleverb]s on [src]."),\
				span_notice("I [buckleverb] on [src]."))
		else
			M.visible_message(span_warning("[user] [buckleverb]s [M] on [src]!"),\
				span_warning("[user] [buckleverb]s me on [src]!"))

/atom/movable/proc/user_unbuckle_mob(mob/living/buckled_mob, mob/user)
	var/mob/living/M = unbuckle_mob(buckled_mob)
	if(M)
		if(M != user)
			M.visible_message(span_notice("[user] pulls [M] from [src]."),\
				span_notice("[user] pulls me from [src]."),\
				span_hear("I hear metal clanking."))
		else
			M.visible_message(span_notice("[M] gets off of [src]."),\
				span_notice("I get off of [src]."),\
				span_hear("I hear metal clanking."))
		add_fingerprint(user)
		if(isliving(M.pulledby))
			var/mob/living/L = M.pulledby
			L.set_pull_offsets(M, L.grab_state)
	return M
