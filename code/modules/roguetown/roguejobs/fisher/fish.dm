/obj/item/reagent_containers/food/snacks/fish
	name = "fish"
	desc = "Fresh blood stains its silvery skin. Silver-coloured scales shimmering softly.."
	icon_state = "carp"
	icon = 'icons/roguetown/misc/fish.dmi'
	verb_say = "glubs"
	verb_yell = "glubs"
	obj_flags = CAN_BE_HIT
	var/dead = TRUE
	var/no_rarity_sprite = FALSE // Whether this fish has rarity based sprites. If not, don't change icon states
	max_integrity = 50
	sellprice = 10
	dropshrink = 0.6
	slices_num = 1
	slice_bclass = BCLASS_CHOP
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/fish
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/fish/dead
	dead = TRUE

/obj/item/reagent_containers/food/snacks/fish/Initialize()
	. = ..()
	var/rarity = pickweight(list("gold" = 1, "ultra" = 40, "rare"= 50, "com"= 900))
	if(!no_rarity_sprite)
		icon_state = "[initial(icon_state)][rarity]"
	switch(rarity)
		if("gold")
			sellprice = sellprice * 10
			name = "legendary [initial(name)]"
		if("ultra")
			sellprice = sellprice * 4
			name = "ultra-rare [initial(name)]"
		if("rare")
			sellprice = sellprice * 2
			name = "rare [initial(name)]"
		if("com")
			name = "common [initial(name)]"
	if(!dead)
		START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/fish/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(isturf(user.loc))
			src.forceMove(user.loc)
		to_chat(user, span_warning("Too slippery!"))
		return

/obj/item/reagent_containers/food/snacks/fish/process()
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(50) && !dead)
		dir = pick(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
		step(src, dir)

/obj/item/reagent_containers/food/snacks/fish/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/reagent_containers/food/snacks/fish/deconstruct()
	if(!dead)
		dead = TRUE
//		icon_state = "[icon_state]"
		STOP_PROCESSING(SSobj, src)
		return 1



/obj/item/reagent_containers/food/snacks/fish/carp
	name = "carp"
	desc = "A mudraking creacher of the river-depths, barely fit for food."
	faretype = FARE_IMPOVERISHED
	icon_state = "carp"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp

/obj/item/reagent_containers/food/snacks/fish/clownfish
	name = "clownfish"
	desc = "This fish brings vibrant hues to the dark world of Azure Peak."
	icon_state = "clownfish"
	faretype = FARE_NEUTRAL
	sellprice = 40
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish

/obj/item/reagent_containers/food/snacks/fish/angler
	name = "anglerfish"
	desc = "A menacing abyssal predator."
	faretype = FARE_NEUTRAL
	icon_state = "angler"
	sellprice = 15
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler

/obj/item/reagent_containers/food/snacks/fish/eel
	name = "eel"
	desc = "A sinuous eel that slithers through the dark waters."
	icon_state = "eel"
	faretype = FARE_NEUTRAL
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel

/obj/item/reagent_containers/food/snacks/fish/sole
	name = "sole"
	desc = "An ugly flatfish, slimy and with both eyes on one side of its head. Nothing to do with feet."
	icon_state = "sole"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/sole
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/sole

/obj/item/reagent_containers/food/snacks/fish/cod
	name = "cod"
	desc = "A cod, wow! Cod you hand me another piece of bait?"
	icon_state = "cod"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/cod
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/cod

/obj/item/reagent_containers/food/snacks/fish/lobster
	name = "lobster"
	desc = "A hard-shelled cretin, barely fit for eating."
	icon_state = "lobster"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/lobster
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/lobster
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/shellfish

/obj/item/reagent_containers/food/snacks/fish/shrimp
	name = "shrimp"
	desc = "A tiny shellfish, little bigger than your thumb. Often nicknamed butterflies of the sea."
	icon_state = "shrimp"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/shrimp
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/shrimp

/obj/item/reagent_containers/food/snacks/fish/oyster
	name = "oyster"
	desc = "A stubborn shellfish that MIGHT hide a prize within, can be opened with a knife to reveal the flesh within."
	icon_state = "oyster"
	sellprice = 5
	var/closed
	var/obj/item/pearl
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/shellfish
	trash = /obj/item/oystershell

/obj/item/reagent_containers/food/snacks/fish/oyster/Initialize()
	. = ..()
	var/pearl_weight
	switch(name) //checks the rarity of the oyster via the name
		if("legendary oyster")
			pearl_weight = pickweight(list("bpearl" = 200, "pearl" =15, "nopearl"=15)) //specific weights should be modified due to balance later
		if("ultra-rare oyster")
			pearl_weight = pickweight(list("bpearl" = 60, "pearl" =120, "nopearl"=35))
		if("rare oyster")
			pearl_weight = pickweight(list("bpearl" = 40, "pearl" =80, "nopearl"=150))
		if("common oyster")
			pearl_weight = pickweight(list("bpearl" = 10, "pearl" =40, "nopearl"=200))
	switch(pearl_weight)
		if("nopearl")
			pearl = null
		if("pearl")
			pearl = new /obj/item/pearl(src)
		if("bpearl")
			pearl = new /obj/item/pearl/blue(src)
	closed = TRUE

/obj/item/reagent_containers/food/snacks/fish/oyster/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/huntingknife))
		if(closed)
			user.visible_message("<span class='notice'>[user] opens the oyster with the knife.</span>")
			closed = FALSE
			icon_state = "[icon_state]_open"
			update_icon()
		else
			if(slice(src, user))
				new /obj/item/oystershell(user.loc)
				new /obj/item/oystershell(user.loc)
	else
		. = ..()

/obj/item/reagent_containers/food/snacks/fish/oyster/attack_right(mob/user)
	if(user.get_active_held_item())
		return
	else
		if(pearl)
			user.put_in_hands(pearl)
			pearl = null
			update_icon()
	. = ..()

/obj/item/reagent_containers/food/snacks/fish/oyster/update_icon()
	cut_overlays()
	if(!closed && pearl)
		var/mutable_appearance/pearl = mutable_appearance(icon, "pearl")
		add_overlay(pearl)

/obj/item/oystershell
	name = "oyster shell"
	icon = 'icons/roguetown/misc/fish.dmi'
	icon_state = "oyster_shell"
	desc = ""
	dropshrink = 0.5
	sellprice = 3

/obj/item/reagent_containers/food/snacks/fish/crab
	name = "crab"
	desc = "A defensive shellfish that's a real hassle to crack open, they taste great when made into cakes with butterdough slice."
	icon_state = "crab"
	sellprice = 10
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/crab
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/crab
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/crab

/obj/item/reagent_containers/food/snacks/fish/crab/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/butterdoughslice))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Covering the crab with butterdough...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT)
				new /obj/item/reagent_containers/food/snacks/rogue/foodbase/crabcakeraw(loc)
				qdel(I)
				qdel(src)
		return TRUE
	. = ..()

/obj/item/reagent_containers/food/snacks/fish/salmon
	name = "salmon"
	desc = "A lonesome, horrific creacher of the freshwaters, searching for a mate. It makes for good eating."
	icon_state = "salmon"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 15
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/salmon
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/salmon

/obj/item/reagent_containers/food/snacks/fish/plaice
	name = "plaice"
	desc = "A popular flatfish for eating. Found on tables of noblefolk and peasantry alike."
	icon_state = "plaice"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 15
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/plaice
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/plaice

/obj/item/reagent_containers/food/snacks/fish/mudskipper
	name = "mudskipper"
	desc = "A furtive creacher, it hides in murky waters to keep its grotesque visage secreted away."
	icon_state = "mudskipper"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/mudskipper
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/mudskipper

/obj/item/reagent_containers/food/snacks/fish/bass
	name = "seabass"
	desc = "I didn't see a bass."
	icon_state = "seabass"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 10
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/bass
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/bass

/obj/item/reagent_containers/food/snacks/fish/sunny
	name = "sunny"
	desc = "A pitiful beast, clinging to Astrata's light as if it would make it stronger. Little does it know that it needs faith for such miracles."
	icon_state = "sunny"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 3
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/sunny
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/sunny

/obj/item/reagent_containers/food/snacks/fish/clam
	name = "clam"
	desc = "A beastye built by Abyssor in the image of a knight. Hard shell, squishy interior."
	icon_state = "clam"
	faretype = FARE_NEUTRAL
	no_rarity_sprite = TRUE
	sellprice = 15
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clam
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clam

/obj/item/reagent_containers/food/snacks/rogue/fryfish
	icon = 'icons/roguetown/misc/fish.dmi'
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("fish" = 1)
	name = "cooked fish"
	faretype = FARE_POOR
	desc = "A charred fish, crisped to perfection."
	icon_state = "carpcooked"
	foodtype = MEAT
	warming = 5 MINUTES
	dropshrink = 0.6

/obj/item/reagent_containers/food/snacks/rogue/fryfish/carp
	name = "cooked carp"
	desc = "A charred and crisped carp. With a mild flavor and firm texture. Fit for the poor."
	icon_state = "carpcooked"
	faretype = FARE_IMPOVERISHED
	plateable = TRUE

/obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish
	name = "cooked clownfish"
	desc = "A cooked clownfish, its former vibrant colors gone."
	icon_state = "clownfishcooked"
	faretype = FARE_POOR
	plateable = TRUE

/obj/item/reagent_containers/food/snacks/rogue/fryfish/angler
	name = "cooked anglerfish"
	desc = "A cooked anglerfish, with a sweet and dense flavor that is sure to please."
	icon_state = "anglercooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE

/obj/item/reagent_containers/food/snacks/rogue/fryfish/eel
	name = "cooked eel"
	desc = "A cooked eel. With its rich flavor and flaky texture, it's a delicacy."
	icon_state = "eelcooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/jelliedeel

/obj/item/reagent_containers/food/snacks/rogue/fryfish/sole
	name = "cooked sole"
	desc = "A cooked sole, with a mild flavor and flaky texture. Fit for the poor."
	icon_state = "solecooked"
	faretype = FARE_POOR
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/cod
	name = "cooked cod"
	desc = "A cooked cod, with a mild flavor and flaky texture. Quite popular."
	icon_state = "codcooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/lobster
	name = "cooked lobster"
	desc = "A cooked lobster. It has a rich and sweet flavor, but not much meat. On its own it is considered\
	food for the poor, but buttered or peppered it is a delicacy."
	icon_state = "lobstercooked"
	faretype = FARE_POOR
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/salmon
	name = "cooked salmon"
	desc = "A cooked salmon. Less terrifying now that it is cooked. It has rich and oily flesh, making it quite popular once spiced."
	icon_state = "salmoncooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/plaice
	name = "cooked plaice"
	desc = "A cooked plaice. With a mild and sweet flavor. Popular with the rich."
	icon_state = "plaicecooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/mudskipper
	name = "cooked mudskipper"
	desc = "A cooked mudskipper. With a fishy and earthy flavor. Popular amongst vagrants."
	icon_state = "mudskippercooked"
	faretype = FARE_POOR
	plateable = FALSE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/bass
	name = "cooked seabass"
	desc = "A cooked seabass. With a firm texture, seabass goes well with spices and sauces."
	icon_state = "seabasscooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/sunny
	name = "cooked sunny"
	desc = "A cooked sunny. With tender and flaky flesh."
	icon_state = "sunnycooked"
	faretype = FARE_POOR
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/fryfish/clam
	name = "cooked clam"
	desc = "A cooked clam. With a sweet and briny flavor, clams are often used in soup."
	icon_state = "clamcooked"
	faretype = FARE_NEUTRAL
	plateable = TRUE

/obj/item/reagent_containers/food/snacks/rogue/fryfish/shrimp
	name = "cooked shrimp"
	desc = "A cooked shrimp. Firm and springy with a natural hint of saltiness."
	icon_state = "shrimpcooked"
	faretype = FARE_NEUTRAL
	name = "cooked shrimp"
	tastes = list("shrimp" = 1)
	plateable = TRUE

/obj/item/reagent_containers/food/snacks/rogue/fryfish/crab
	name = "cooked crab"
	desc = "A cooked crab. With a sweet and rich flavor. Often laboriously made into crab cakes."
	icon_state = "crabcooked"
	faretype = FARE_NEUTRAL
	name = "cooked crab"
	tastes = list("crab" = 1)
	plateable = TRUE
	
/obj/item/reagent_containers/food/snacks/rogue/dryfishfilet
	icon = 'modular/Neu_Food/icons/food.dmi'
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("bland fish" = 1)
	name = "dried fish"
	faretype = FARE_POOR
	desc = "A dried fish filet, boring and flavourless."
	icon_state = "dried_fish"
	foodtype = MEAT
	warming = 5 MINUTES
	dropshrink = 0.6
	rotprocess = null
