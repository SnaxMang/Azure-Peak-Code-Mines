//Eora content from Stonekeep

/obj/item/clothing/head/peaceflower
    name = "eoran bud"
    desc = "A flower of gentle petals, associated with Eora or Necra. Usually adorned as a headress or laid at graves as a symbol of love or peace."
    icon = 'icons/roguetown/items/produce.dmi'
    mob_overlay_icon = 'icons/roguetown/clothing/onmob/head_items.dmi'
    icon_state = "peaceflower"
    item_state = "peaceflower"
    dropshrink = 0.9
    slot_flags = ITEM_SLOT_HEAD
    body_parts_covered = NONE
    dynamic_hair_suffix = ""
    force = 0
    throwforce = 0
    w_class = WEIGHT_CLASS_TINY
    throw_speed = 1
    throw_range = 3

/obj/item/clothing/head/peaceflower/equipped(mob/living/carbon/human/user, slot)
    . = ..()
    if(slot == SLOT_HEAD)
        ADD_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/dropped(mob/living/carbon/human/user)
    ..()
    REMOVE_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/attack_hand(mob/user)
    if(iscarbon(user))
        var/mob/living/carbon/C = user
        if(src == C.head)
            to_chat(user, "<span class='warning'>I feel at peace. <b style='color:pink'>Why would you want anything else?</b></span>")
            return
    return ..()

/obj/effect/proc_holder/spell/invoked/bud
    name = "Eoran Bloom"
    desc = ""
    clothes_req = FALSE
    range = 7
    overlay_state = "love"
    sound = list('sound/magic/magnet.ogg')
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    releasedrain = 40
    chargetime = 60
    warnie = "spellwarning"
    no_early_release = TRUE
    charging_slowdown = 1
    chargedloop = /datum/looping_sound/invokegen
    associated_skill = /datum/skill/magic/holy
    recharge_time = 60 SECONDS

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
    var/target = targets[1]
    if(istype(target, /mob/living/carbon/human)) //Putting flower on head check
        var/mob/living/carbon/human/C = target
        if(!C.get_item_by_slot(SLOT_HEAD))
            var/obj/item/clothing/head/peaceflower/F = new(get_turf(C))
            C.equip_to_slot_if_possible(F, SLOT_HEAD, TRUE, TRUE)
            to_chat(C, "<span class='info'>A flower of Eora blooms on my head. I feel at peace.</span>")
            return TRUE
        else
            to_chat(user, "<span class='warning'>The target's head is covered. The flowers of Eora need an open space to bloom.</span>")
            revert_cast()
            return FALSE
    var/turf/T = get_turf(targets[1])
    if(!isclosedturf(T))
        new /obj/item/clothing/head/peaceflower(T)
        return TRUE
    to_chat(user, "<span class='warning'>The targeted location is blocked. The flowers of Eora refuse to grow.</span>")
    revert_cast()
    return FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse
    name = "Eora's Curse"
    overlay_state = "curse2"
    releasedrain = 50
    chargetime = 30
    range = 7
    warnie = "sydwarning"
    movement_interrupt = FALSE
    chargedloop = null
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    sound = 'sound/magic/whiteflame.ogg'
    associated_skill = /datum/skill/magic/holy
    antimagic_allowed = TRUE
    recharge_time = 10 SECONDS
    miracle = FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse/cast(list/targets, mob/living/user)
    if(isliving(targets[1]))
        var/mob/living/carbon/target = targets[1]
        target.apply_status_effect(/datum/status_effect/buff/druqks)
        target.apply_status_effect(/datum/status_effect/buff/drunk)
        target.visible_message("<span class='info'>A purple haze shrouds [target]!</span>", "<span class='notice'>I feel much calmer.</span>")
        target.blur_eyes(10)
        return TRUE
    revert_cast()
    return FALSE

// =====================
// Eora Bond Component
// =====================
/datum/component/eora_bond
    var/mob/living/carbon/partner
    var/mob/living/carbon/caster
    var/duration = 900 SECONDS
    var/max_distance = 7
    var/damage_share = 0.4
    var/heal_share = 0.4
    var/wound_chance = 15
    var/ispartner = FALSE
    can_transfer = TRUE

/datum/component/eora_bond/partner
    ispartner = TRUE

/datum/component/eora_bond/Initialize(mob/living/partner_mob, mob/living/caster_mob, var/holy_skill)
    if(!isliving(parent) || !isliving(partner_mob))
        return COMPONENT_INCOMPATIBLE

    // Prevent duplicate bonds
    var/datum/component/eora_bond/existing = parent.GetComponent(/datum/component/eora_bond)
    if(existing)
        return COMPONENT_INCOMPATIBLE

    partner = partner_mob
    caster = caster_mob
    
    var/bonus_mod = 0
    if(holy_skill >= 4)
        bonus_mod = 0.05
    damage_share = 0.1 + (0.05 * holy_skill) + bonus_mod
    heal_share = 0.1 + (0.05 * holy_skill) + bonus_mod
    wound_chance = 40 - (5 * holy_skill)

    // Correct signal name
    RegisterSignal(parent, COMSIG_MOB_APPLY_DAMGE, PROC_REF(on_damage))
    RegisterSignal(parent, COMSIG_LIVING_MIRACLE_HEAL_APPLY, PROC_REF(on_heal))
    RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(on_deletion))

    START_PROCESSING(SSprocessing, src)
    addtimer(CALLBACK(src, .proc/remove_bond), duration)
    
    var/mob/living/L = parent
    L.apply_status_effect(/datum/status_effect/eora_bond)
    return ..()

/datum/component/eora_bond/proc/on_damage(datum/source, damage, damagetype, def_zone)
    if( !isliving(partner) || !ispartner)
        return
    
    var/mob/living/carbon/L = caster
    var/shared_damage = damage * damage_share
    
    if(damagetype == BRUTE)
        //Heal our buddy <3
        var/list/wCount = partner.get_wounds()
        if(wCount.len > 0)
            partner.heal_wounds(shared_damage)
            partner.update_damage_overlays()
        partner.adjustBruteLoss(-shared_damage, 0)

        var/obj/item/bodypart/BP = null
        BP = L.get_bodypart(check_zone(def_zone))
        if(!BP)
            BP = L.get_bodypart(BODY_ZONE_CHEST)
        BP.receive_damage(shared_damage, 0)
        L.update_damage_overlays()
        //Potentially bite ourselves :(
        if(prob(wound_chance))
            L.visible_message(span_danger("[L]'s wounds bleed profusely!"))
            BP.add_wound(/datum/wound/bite/small)

/datum/component/eora_bond/proc/on_heal(datum/source, healing_on_tick, healing_datum)
    if( !isliving(parent) || source != parent || istype(healing_datum, /datum/status_effect/buff/healing/eora))
        return
    
    healing_on_tick = healing_on_tick * heal_share
    var/mob/living/target_to_heal
    if(parent == caster)
        target_to_heal = partner
    else
        target_to_heal = caster

    target_to_heal.apply_status_effect(/datum/status_effect/buff/healing/eora, healing_on_tick)

/datum/component/eora_bond/proc/on_deletion()
    remove_bond()

/datum/component/eora_bond/process()
    //If this turns out to be too costly, make this based on the movement signal instead.
    var/mob/living/M = parent
    if(!istype(M) || !istype(partner) || M.stat == DEAD || partner.stat == DEAD || get_dist(M, partner) > max_distance)
        remove_bond()

/datum/component/eora_bond/proc/remove_bond()
    var/mob/living/L = parent
    if(L)
        L.remove_status_effect(/datum/status_effect/eora_bond)
        UnregisterSignal(L, list(
            COMSIG_MOB_APPLY_DAMGE,
            COMSIG_LIVING_MIRACLE_HEAL_APPLY,
            COMSIG_PARENT_QDELETING
        ))
    
    if(partner)
        partner.remove_status_effect(/datum/status_effect/eora_bond)
        var/datum/component/eora_bond/other = partner.GetComponent(/datum/component/eora_bond)
        if(other)
            other.partner = null
            qdel(other)
    
    partner = null
    STOP_PROCESSING(SSprocessing, src)
    qdel(src)

/datum/status_effect/buff/healing/eora

// =====================
// Heartweave Spell
// =====================
/obj/effect/proc_holder/spell/invoked/heartweave
    name = "Heartweave"
    desc = "Forge a symbiotic bond between two souls."
    overlay_state = "bliss"
    range = 2
    chargetime = 0.5 SECONDS
    invocation = "By Eora's grace, let our fates intertwine!"
    sound = 'sound/magic/magnet.ogg'
    recharge_time = 60 SECONDS
    miracle = TRUE
    devotion_cost = 75
    associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/heartweave/cast(list/targets, mob/living/user)
    var/mob/living/target = targets[1]

    var/datum/component/eora_bond/existing = user.GetComponent(/datum/component/eora_bond)
    if(existing)
        to_chat(user, span_warning("You are already bonded!"))
        revert_cast()
        return FALSE
    
    if(!istype(target, /mob/living/carbon) || target == user)
        revert_cast()
        return FALSE

    if(!do_after(user, 8 SECONDS, target = target))
        to_chat(user, span_warning("The bond requires focused concentration!"))
        revert_cast()
        return FALSE

    var/consent = alert(target, "[user] offers a lifebond. Accept?", "Heartweave", "Yes", "No")
    if(consent != "Yes" || QDELETED(target))
        to_chat(user, span_warning("The bond was rejected."))
        revert_cast()
        return FALSE

    var/holy_skill = user.mind?.get_skill_level(associated_skill)
    // Add component to both participants without mutual recursion
    user.AddComponent(/datum/component/eora_bond, target, user, holy_skill)
    target.AddComponent(/datum/component/eora_bond/partner, target, user, holy_skill)
    
    user.visible_message(
        span_notice("A golden tether forms between [user] and [target]!"),
        span_notice("You feel [target]'s life force linked to yours.")
    )
    return TRUE

// =====================
// Status Effect
// =====================

#define HEARTWEAVE_FILTER "heartweave"

/datum/status_effect/eora_bond
    id = "eora_bond"
    duration = -1
    alert_type = /atom/movable/screen/alert/status_effect/eora_bond
    var/outline_colour = "#FF69B4"

/atom/movable/screen/alert/status_effect/eora_bond
    name = "Eora's Bond"
    desc = "Your life force is linked to another soul."

/datum/status_effect/eora_bond/on_apply()
    var/filter = owner.get_filter(HEARTWEAVE_FILTER)
    if (!filter)
        owner.add_filter(HEARTWEAVE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 2))
    return TRUE

/datum/status_effect/eora_bond/on_remove()
    owner.remove_filter(HEARTWEAVE_FILTER)