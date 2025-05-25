/obj/effect/proc_holder/spell/invoked/thunderstrike
	name = "Thunderstrike"
	desc = "Lashes out a walking barrage of lightning that strikes a line up to 7 tiles long in front of you."
	cost = 3
	releasedrain = 50
	overlay_state = "thunderstrike" // Literally just sparks effect placeholder with 1 frame
	chargedrain = 5
	chargetime = 1 SECONDS // This is a point blank spell and need low charge time
	recharge_time = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokelightning
	associated_skill = /datum/skill/magic/arcane
	gesture_required = TRUE // Offensive spell
	spell_tier = 3 // AOE
	invocation = "Fulmen Percutio!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_LIGHTNING
	glow_intensity = GLOW_INTENSITY_HIGH
	var/delay = 6
	var/strike_delay = 3 // delay between each individual strike. 3 delays seems to make someone stupid able to walk into every single strikes.
	var/strikerange = 7 // how many tiles the strike can reach
	var/damage = 65

/obj/effect/proc_holder/spell/invoked/thunderstrike/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])

	var/turf/source_turf = get_turf(user)
	
	if(T.z != user.z)
		to_chat(span_warning("You can't cast this spell on a different z-level!"))
		return FALSE

	var/list/affected_turfs = getline(source_turf, T)

	for(var/i = 1, i < affected_turfs.len, i++)
		var/turf/affected_turf = affected_turfs[i]
		if(affected_turf == source_turf) // Don't zap yourself
			continue
		if(!(affected_turf in view(source_turf)))
			continue
		var/tile_delay = strike_delay * (i - 1) + delay
		new /obj/effect/temp_visual/trap/thunderstrike(affected_turf, tile_delay)
		addtimer(CALLBACK(src, PROC_REF(strike), affected_turf), wait = tile_delay)
	return TRUE

/obj/effect/proc_holder/spell/invoked/thunderstrike/proc/strike(var/turf/damage_turf)
	new /obj/effect/temp_visual/thunderstrike_actual(damage_turf)
	playsound(damage_turf, 'sound/magic/lightning.ogg', 50)
	for(var/mob/living/L in damage_turf.contents)
		if(L.anti_magic_check())
			visible_message(span_warning("The magic fades away around you [L] "))  //antimagic needs some testing
			playsound(damage_turf, 'sound/magic/magic_nulled.ogg', 100)
			return
		L.electrocute_act(damage, src, 1, SHOCK_NOSTUN)
		return


/obj/effect/temp_visual/trap/thunderstrike
	icon = 'icons/effects/effects.dmi'
	icon_state = "trap"
	light_outer_range = 2
	duration = 1 SECONDS
	layer = MASSIVE_OBJ_LAYER

/obj/effect/temp_visual/thunderstrike_actual
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks"
	light_outer_range = 2
	duration = 1 SECONDS
	layer = MASSIVE_OBJ_LAYER

/obj/effect/temp_visual/trap/thunderstrike/Initialize(mapload, duration_override)
	if(duration_override)
		duration = duration_override
	. = ..() // Call parent AFTER setting duration
	