// Port from Vanderlin but I can't get their stone throw to work so I am leaving a note here instead
/mob/living/simple_animal/hostile/retaliate/rogue/troll/cave
	name = "cave troll"
	desc = "Dwarven tales of giants and trolls often contain these creatures, horrifying amalgamations of flesh and crystal who have long since abandoned Malum's ways."
	icon = 'icons/roguetown/mob/monster/trolls/troll_cave.dmi'
	health = CAVETROLL_HEALTH
	maxHealth = CAVETROLL_HEALTH
	ai_controller = /datum/ai_controller/troll/cave

	botched_butcher_results = list (
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
		/obj/item/natural/bundle/bone/full = 1,
		/obj/item/alch/horn = 1, 
		/obj/item/natural/hide = 2)
	butcher_results = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 3,
		/obj/item/natural/hide = 3,
		/obj/item/natural/bundle/bone/full = 1,
		/obj/item/alch/sinew = 5,
		/obj/item/alch/horn = 2,
		/obj/item/alch/viscera = 3,
		/obj/item/natural/head/troll/cave = 1,
		)
	perfect_butcher_results = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 5,
		/obj/item/natural/hide = 5,
		/obj/item/natural/bundle/bone/full = 1, 
		/obj/item/alch/sinew = 7, 
		/obj/item/alch/horn = 2, 
		/obj/item/alch/viscera = 3,
		/obj/item/natural/head/troll/cave = 1,
		)

	defprob = 15

