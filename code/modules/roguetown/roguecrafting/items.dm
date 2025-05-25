// Generic category for everything that is related to "general survival".
// Includes some skill diff 0 or 1 recipes that make sense like drying rack.
// This is just basically everything under the generic "crafting" skills
// With a few exceptions atm to be cleared out later.
// Quarterstaff, carpentry etc. you know.
// Previously known as items.dm
/datum/crafting_recipe/roguetown/
	always_availible = TRUE

/datum/crafting_recipe/roguetown/survival
	abstract_type = /datum/crafting_recipe/roguetown/survival/
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/survival/tneedle
	name = "sewing needle"
	result = /obj/item/needle/thorn
	reqs = list(
		/obj/item/natural/thorn = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/cloth
	name = "cloth (2 fibers)"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/cloth5x
	name = "cloth 5x (10 fibers)"
	result = list(
		/obj/item/natural/cloth,
		/obj/item/natural/cloth,
		/obj/item/natural/cloth,
		/obj/item/natural/cloth,
		/obj/item/natural/cloth,
		)
	reqs = list(/obj/item/natural/fibers = 10)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/clothbelt
	name = "cloth belt"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	verbage_simple = "tie"
	verbage = "ties"

/datum/crafting_recipe/roguetown/survival/unclothbelt
	name = "untie cloth belt"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	craftdiff = 0
	verbage_simple = "untie"
	verbage = "unties"

/datum/crafting_recipe/roguetown/survival/ropebelt
	name = "rope belt"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	craftdiff = 0
	verbage_simple = "tie"
	verbage = "ties"

/datum/crafting_recipe/roguetown/survival/unropebelt
	name = "untie rope belt"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	craftdiff = 0
	verbage_simple = "untie"
	verbage = "unties"

/datum/crafting_recipe/roguetown/survival/rope
	name = "rope"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage_simple = "braid"
	verbage = "braids"

/datum/crafting_recipe/roguetown/survival/net
	name = "net"
	result = /obj/item/net
	craftdiff = 2
	reqs = list(
		/obj/item/rope = 2,
		/obj/item/natural/stone = 3,
		)
	verbage_simple = "braid"
	verbage = "braids"

/datum/crafting_recipe/roguetown/survival/bowstring
	name = "fiber bowstring"
	result = /obj/item/natural/bowstring
	reqs = list(/obj/item/natural/fibers = 2)
	verbage_simple = "twist"
	verbage = "twists"

/datum/crafting_recipe/roguetown/survival/bowpartial
	name = "unstrung bow"
	result = /obj/item/grown/log/tree/bowpartial
	reqs = list(/obj/item/grown/log/tree/small = 1)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"

/datum/crafting_recipe/roguetown/survival/bow
	name = "wooden bow"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	reqs = list(
		/obj/item/natural/bowstring = 1,
		/obj/item/grown/log/tree/bowpartial = 1,
		)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/recurvepartial
	name = "unstrung recurve bow"
	result = /obj/item/grown/log/tree/bowpartial/recurve
	reqs = list(
		/obj/item/grown/log/tree = 1,
		/obj/item/natural/bone = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/recurvebow
	name = "recurve bow"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	reqs = list(
		/obj/item/natural/bowstring = 1,
		/obj/item/grown/log/tree/bowpartial/recurve = 1,
		)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/longbowpartial
	name = "unstrung long bow"
	result = /obj/item/grown/log/tree/bowpartial/longbow
	reqs = list(
		/obj/item/grown/log/tree = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
		)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"
	craftdiff = 4

/datum/crafting_recipe/roguetown/survival/longbow
	name = "long bow"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	reqs = list(
		/obj/item/natural/bowstring = 1,
		/obj/item/grown/log/tree/bowpartial/longbow = 1,
		)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 4

/datum/crafting_recipe/roguetown/survival/wickercloak
	name = "wickercloak"
	result = /obj/item/clothing/cloak/wickercloak
	reqs = list(
		/obj/item/natural/dirtclod = 1,
		/obj/item/grown/log/tree/stick = 5,
		/obj/item/natural/fibers = 3,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/torch
	name = "torch"
	result = /obj/item/flashlight/flare/torch
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/soap
	name = "soap (3x)"
	result = list(
		/obj/item/soap,
		/obj/item/soap,
		/obj/item/soap,
		)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/survival/candle
	name = "candle (x3)"
	result = list(
		/obj/item/candle/yellow,
		/obj/item/candle/yellow,
		/obj/item/candle/yellow,
		)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/survival/stoneaxe
	name = "stone axe"
	result = /obj/item/rogueweapon/stoneaxe
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/woodhammer
	name = "wood mallet"
	result = /obj/item/rogueweapon/hammer/wood
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonehammer
	name = "stone hammer"
	result = /obj/item/rogueweapon/hammer/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonehoe
	name = "stone hoe"
	result = /obj/item/rogueweapon/hoe/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonetongs
	name = "stone tongs"
	result = /obj/item/rogueweapon/tongs/stone
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/stone = 1,
		)

/datum/crafting_recipe/roguetown/survival/stonepick
	name = "stone pick"
	result = /obj/item/rogueweapon/pick/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/stone = 2,
		)

/datum/crafting_recipe/roguetown/survival/stoneknife
	name = "stone knife"
	result = /obj/item/rogueweapon/huntingknife/stoneknife
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/stonespear
	name = "stone spear"
	result = /obj/item/rogueweapon/spear/stone
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/stonesword
	name = "stone sword"
	result = /obj/item/rogueweapon/sword/stone
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/stone = 3,
		)
	craftdiff = 1


/datum/crafting_recipe/roguetown/survival/woodclub
	name = "wood club"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/billhook
	name = "improvised billhook"
	result = /obj/item/rogueweapon/spear/improvisedbillhook
	reqs = list(
		/obj/item/rogueweapon/sickle = 1,
		/obj/item/rope = 1,
		/obj/item/grown/log/tree/small = 1,
		)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/goedendag
	name = "goedendag"
	result = /obj/item/rogueweapon/mace/goden
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/rope = 1,
		/obj/item/rogueweapon/hoe = 1,
		)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3


/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/survival/woodstaff
	name = "wood staff"
	result = list(
		/obj/item/rogueweapon/woodstaff,
		/obj/item/rogueweapon/woodstaff,
		/obj/item/rogueweapon/woodstaff,
		)
	reqs = list(/obj/item/grown/log/tree = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/quarterstaff
	name = "quarterstaff"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff)
	reqs = list(/obj/item/grown/log/tree = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/quarterstaff_iron
	name = "iron-reinforced quarterstaff"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/iron)
	reqs = list(
		/obj/item/rogueweapon/woodstaff/quarterstaff = 1,
		/obj/item/ingot/iron = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/quarterstaff_steel
	name = "steel-reinforced quarterstaff"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/steel)
	reqs = list(
		/obj/item/rogueweapon/woodstaff/quarterstaff = 1,
		/obj/item/ingot/steel = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/woodsword
	name = "wood sword"
	result = list(
		/obj/item/rogueweapon/mace/wsword,
		/obj/item/rogueweapon/mace/wsword,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/woodshield
	name = "wooden shield"
	result = /obj/item/rogueweapon/shield/wood/crafted
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/hide = 1,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/spoon
	name = "spoon (x3)"
	result = list(
		/obj/item/kitchen/spoon,
		/obj/item/kitchen/spoon,
		/obj/item/kitchen/spoon,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/fork
	name = "fork (x3)"
	result = list(
		/obj/item/kitchen/fork,
		/obj/item/kitchen/fork,
		/obj/item/kitchen/fork,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/platter
	name = "platter (x2)"
	result = list(
		/obj/item/cooking/platter,
		/obj/item/cooking/platter,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/rollingpin
	name = "rollingpin"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/rogueweapon/shield/wood/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/survival/woodbucket
	name = "wooden bucket"
	result = /obj/item/reagent_containers/glass/bucket
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/woodcup
	name = "wooden cups (x3)"
	result = list(
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		/obj/item/reagent_containers/glass/cup/wooden/crafted,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/survival/woodtray
	name = "wooden trays (x2)"
	result = list(
		/obj/item/storage/bag/tray,
		/obj/item/storage/bag/tray,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/woodbowl
	name = "wooden bowls (x3)"
	result = list(
		/obj/item/reagent_containers/glass/bowl,
		/obj/item/reagent_containers/glass/bowl,
		/obj/item/reagent_containers/glass/bowl,
		)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/survival/pot
	name = "stone pot"
	result = /obj/item/reagent_containers/glass/bucket/pot/stone
	reqs = list(/obj/item/natural/stone = 2)

/datum/crafting_recipe/roguetown/survival/stonearrow
	name = "stone arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/natural/stone = 1,
		)
	req_table = TRUE

/datum/crafting_recipe/roguetown/survival/stonearrow_five
	name = "stone arrow (x5)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/stone,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone
		)
	reqs = list(
		/obj/item/grown/log/tree/stick = 5,
		/obj/item/natural/stone = 5,
		)
	req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow
	name = "poisoned arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/datum/reagent/stampoison = 5
				)
	req_table = TRUE

/datum/crafting_recipe/roguetown/survival/poisonarrow_stone
	name = "poisoned stone arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone = 1,
				/datum/reagent/stampoison = 5
				)
	req_table = TRUE

/*
/datum/crafting_recipe/roguetown/survival/poisonbolt //Coded, but commented out pending balance discussion.
	name = "poisoned bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/berrypoison = 5)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/survival/poisonarrow_five //Arrows and bolts can be smithed in batches of five. Makes sense for them to be dipped in batches of five, too
	name = "poisoned arrow (x5)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/poison,
		)
	reqs = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
		/datum/reagent/berrypoison = 25,
		)

	req_table = TRUE

/*
/datum/crafting_recipe/roguetown/survival/poisonbolt_five //Coded, but commented out pending balance discussion.
	name = "poisoned bolts (x5)"
	result = list(/obj/item/ammo_casing/caseless/rogue/bolt/poison = 5)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/datum/reagent/berrypoison = 25)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/survival/poisonarrow_five_stone
	name = "poisoned stone arrow (x5)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
		/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
		)
	reqs = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/stone = 5,
		/datum/reagent/berrypoison = 25,
		)

	req_table = TRUE


/datum/crafting_recipe/roguetown/survival/waterbolt_ten
	name = "water bolt (x10)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
	)
	reqs = list(
		/obj/item/natural/glass_shard = 1,
		/obj/item/grown/log/tree/stick = 10,
		)
	req_table = TRUE
	craftdiff = 0
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterbolt_twenty
	name = "water bolt (x20)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		/obj/item/ammo_casing/caseless/rogue/bolt/water,
		)
	reqs = list(
		/obj/item/natural/glass_shard = 2,
		/obj/item/grown/log/tree/stick = 10,
		)
	req_table = TRUE
	craftdiff = 0
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterarrow_ten
	name = "water arrow (x10)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		)
	reqs = list(
		/obj/item/natural/glass_shard = 1,
		/obj/item/grown/log/tree/stick = 10,
		)
	req_table = TRUE
	craftdiff = 0
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/waterarrow_twenty
	name = "water arrow (x20)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		/obj/item/ammo_casing/caseless/rogue/arrow/water,
		)
	reqs = list(
		/obj/item/natural/glass_shard = 2,
		/obj/item/grown/log/tree/stick = 20,
		)
	req_table = TRUE
	craftdiff = 0
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/survival/mortar
	name = "alchemical mortar"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/pestle
	name = "stone pestle"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/bag
	name = "bag (1 fibers, 1 cloth)"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/cloth = 1,
		)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/datum/crafting_recipe/roguetown/survival/bagx5
	name = "bag x5 (5 fibers, 5 cloth)"
	result = list(
		/obj/item/storage/roguebag/crafted,
		/obj/item/storage/roguebag/crafted,
		/obj/item/storage/roguebag/crafted,
		/obj/item/storage/roguebag/crafted,
		/obj/item/storage/roguebag/crafted,
		)
	reqs = list(
		/obj/item/natural/fibers = 5,
		/obj/item/natural/cloth = 5,
		)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	req_table = FALSE

/obj/item/storage/roguebag/crafted
	sellprice = 4


/datum/crafting_recipe/roguetown/survival/bait
	name = "bait"
	result = /obj/item/bait
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/wheat = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/sbaita
	name = "sweetbait (apple)"
	result = /obj/item/bait/sweet
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/apple = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/sbait
	name = "sweetbait (berry)"
	result = /obj/item/bait/sweet
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/bloodbait
	name = "bloodbait"
	result = /obj/item/bait/bloody
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/reagent_containers/food/snacks/rogue/meat = 2,
		)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/survival/pipe
	name = "wood pipe"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/survival/rod
	name = "fishing rod"
	result = /obj/item/fishingrod/crafted
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2,
		)


/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/survival/fishingcage
	name = "fishing cage"
	result = /obj/item/fishingcage
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 2,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/woodspade
	name = "wood spade"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/grown/log/tree/stick = 1,
		)
/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/survival/pearlcross
	name = "amulet (pearls)"
	result = /obj/item/clothing/neck/roguetown/psicross/pearl
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/pearl = 3,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/bpearlcross
	name = "amulet (blue pearls)"
	result = /obj/item/clothing/neck/roguetown/psicross/bpearl
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/pearl/blue = 3,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/shellnecklace
	name = "shell necklace"
	result = /obj/item/clothing/neck/roguetown/psicross/shell
	reqs = list(
		/obj/item/oystershell = 5,
		/obj/item/natural/fibers = 1,
		)

/datum/crafting_recipe/roguetown/survival/shellbracelet
	name = "shell bracelet"
	result = /obj/item/clothing/neck/roguetown/psicross/shell/bracelet
	reqs = list(
		/obj/item/oystershell = 3,
		/obj/item/natural/fibers = 1,
		)

/datum/crafting_recipe/roguetown/survival/abyssoramulet
	name = "amulet of abyssor"
	result = /obj/item/clothing/neck/roguetown/psicross/abyssor
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/pearl/blue = 1,
		)

/datum/crafting_recipe/roguetown/survival/broom
	name = "broom"
	result = /obj/item/broom
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/grown/log/tree/stick = 4,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/book_crafting_kit
	name = "book crafting kit"
	result = /obj/item/book_crafting_kit
	reqs = list(
		/obj/item/natural/hide = 2,
		/obj/item/natural/cloth = 1,
		)
	tools = list(/obj/item/needle = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/survival/woodcross
	name = "wooden amulet"
	result = /obj/item/clothing/neck/roguetown/psicross/wood
	reqs = list(
		/obj/item/natural/fibers = 2,
		/obj/item/grown/log/tree/stick = 2,
		)

/datum/crafting_recipe/roguetown/survival/mantrap
	name = "mantrap"
	result = list(
		/obj/item/restraints/legcuffs/beartrap,
		/obj/item/restraints/legcuffs/beartrap,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2,
		/obj/item/ingot/iron = 1,
		)
	req_table = TRUE
	skillcraft = /datum/skill/craft/traps
	craftdiff = 1
	verbage_simple = "put together"
	verbage = "puts together"

/datum/crafting_recipe/roguetown/survival/paperscroll
	name = "scroll of parchment"
	result = list(
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		/obj/item/paper/scroll,
		)
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/datum/reagent/water = 48,
		)
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/tribalrags
	name = "tribal rags (1 fibers, 1 hide)"
	result = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	reqs = list(
		/obj/item/natural/hide = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 6
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/skullmask
	name = "skull mask"
	result = /obj/item/clothing/mask/rogue/skullmask
	reqs = list(
		/obj/item/natural/bone = 3,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 10
	verbage_simple = "craft"
	verbage = "crafted"
	craftdiff = 0


/datum/crafting_recipe/roguetown/survival/antlerhood
	name = "antlerhood"
	result = /obj/item/clothing/head/roguetown/antlerhood
	reqs = list(
		/obj/item/natural/hide = 1,
		/obj/item/natural/bone = 2,
		)
	sellprice = 12
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/bonespear
	name = "bone spear"
	result = /obj/item/rogueweapon/spear/bonespear
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/bone = 2,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 3


/datum/crafting_recipe/roguetown/survival/boneaxe
	name = "bone axe"
	result = /obj/item/rogueweapon/stoneaxe/boneaxe
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/bone = 2,
		/obj/item/natural/fibers = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/prosthetic/woodleftarm
	name = "wood arm (L)"
	result = list(/obj/item/bodypart/l_arm/prosthetic/woodleft)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodrightarm
	name = "wood arm (R)"
	result = list(/obj/item/bodypart/r_arm/prosthetic/woodright)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodleftleft
	name = "wood leg (L)"
	result = list(/obj/item/bodypart/l_leg/prosthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/prosthetic/woodrightleg
	name = "wood leg (R)"
	result = list(/obj/item/bodypart/r_leg/prosthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/tarot_deck
	name = "tarot deck"
	result = list(/obj/item/toy/cards/deck/tarot)
	reqs = list(
		/obj/item/paper/scroll = 3,
		/obj/item/grown/log/tree/small = 1,
		/obj/item/ash = 1,
		)
	skillcraft = /datum/skill/misc/reading
	tools = list(/obj/item/natural/feather)
	req_table = TRUE
	craftdiff = 2

// Woodcutting recipe
/datum/crafting_recipe/roguetown/survival/lumberjacking
	skillcraft = /datum/skill/labor/lumberjacking
	tools = list(/obj/item/rogueweapon/huntingknife = 1)

/datum/crafting_recipe/roguetown/survival/lumberjacking/cart_upgrade
	name = "woodcutters wheelbrace"
	result = /obj/item/cart_upgrade/level_1
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/stone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/lumberjacking/cart_upgrade2
	name = "reinforced woodcutters wheelbrace"
	result = /obj/item/cart_upgrade/level_2
	reqs = list(
		/obj/item/grown/log/tree/small = 4,
		/obj/item/cart_upgrade/level_1 = 1,
		/obj/item/ingot/iron = 1,
		)
	craftdiff = 4


/datum/crafting_recipe/roguetown/survival/heatershield
	name = "heater shield"
	result = /obj/item/rogueweapon/shield/heater/crafted
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/hide/cured = 1,
		)
	skillcraft = /datum/skill/craft/carpentry

/obj/item/rogueweapon/shield/heater/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/survival/collar
	name = "collar"
	result = /obj/item/clothing/neck/roguetown/collar
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/bell_collar
	name = "bell Collar"
	result = /obj/item/clothing/neck/roguetown/collar/bell_collar
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/jingle_bells = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/feldcollar
	name = "feldcollar"
	result = /obj/item/clothing/neck/roguetown/collar/feldcollar
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/surgcollar
	name = "surgcollar"
	result = /obj/item/clothing/neck/roguetown/collar/surgcollar
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/goodluckcharm
	name = "cabbit's foot luck charm"
	result = /obj/item/clothing/neck/roguetown/luckcharm // +1 fortune when worn
	reqs = list(
		/obj/item/natural/rabbitsfoot = 1,
		/obj/item/natural/fibers = 2,
		)
	craftdiff = 0

// BOUQUETS & CROWNS

/datum/crafting_recipe/roguetown/survival/bouquet_rosa
	name = "rosa bouquet"
	result = /obj/item/bouquet/rosa
	reqs = list(
		/obj/item/alch/rosa = 4,
		/obj/item/natural/fibers = 2,
		/obj/item/paper/scroll = 1,
		)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/survival/bouquet_salvia
	name = "salvia bouquet"
	result = /obj/item/bouquet/salvia
	reqs = list(
		/obj/item/alch/salvia = 4,
		/obj/item/natural/fibers = 2,
		/obj/item/paper/scroll = 1,
		)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/survival/bouquet_matricaria
	name = "matricaria bouquet"
	result = /obj/item/bouquet/matricaria
	reqs = list(
		/obj/item/alch/matricaria = 4,
		/obj/item/natural/fibers = 2,
		/obj/item/paper/scroll = 1,
		)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/survival/bouquet_calendula
	name = "calendula bouquet"
	result = /obj/item/bouquet/calendula
	reqs = list(
		/obj/item/alch/calendula = 4,
		/obj/item/natural/fibers = 2,
		/obj/item/paper/scroll = 1,
		)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/survival/flowercrown_rosa
	name = "rosa crown"
	result = /obj/item/flowercrown/rosa
	reqs = list(
		/obj/item/alch/rosa = 4,
		/obj/item/natural/fibers = 2,
		)
	craftdiff = 0
	verbage_simple = "tied"
	verbage = "ties"

/datum/crafting_recipe/roguetown/survival/flowercrown_salvia
	name = "salvia crown"
	result = /obj/item/flowercrown/salvia
	reqs = list(
		/obj/item/alch/salvia = 4,
		/obj/item/natural/fibers = 2,
		)
	craftdiff = 0
	verbage_simple = "tied"
	verbage = "ties"

/datum/crafting_recipe/roguetown/survival/candle/eora
	name = "eora's candle (x3)"
	result = list(
		/obj/item/candle/eora,
		/obj/item/candle/eora,
		/obj/item/candle/eora,
		)
	reqs = list(
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/alch/rosa = 1,
		/datum/reagent/water/blessed = 25,
		)

/datum/crafting_recipe/roguetown/survival/slingcraft
	name = "sling"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
	reqs = list(/obj/item/natural/fibers = 6)
	verbage_simple = "twist"
	verbage = "twists"
	craftdiff = 1 //you should make some ammo first!
	
/datum/crafting_recipe/roguetown/survival/slingpouchcraft
	name = "sling bullet pouch"
	result = /obj/item/quiver/sling/
	reqs = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/cloth = 1,
		)
	verbage_simple = "craft"
	verbage = "crafts"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/stonebullets
	name = "stone sling bullets (x2)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		)
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "smooth"
	verbage = "smooths"
	craftdiff = 0
	
/datum/crafting_recipe/roguetown/survival/stonebullets10x
	name = "stone sling bullets (x10)"
	result = list(
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		/obj/item/ammo_casing/caseless/rogue/sling_bullet/stone,
		)
	reqs = list(/obj/item/natural/stone = 5)
	verbage_simple = "smooth"
	verbage = "smooths"
	craftdiff = 0

/datum/crafting_recipe/hair_dye
    name = "hair dye cream"
    result = /obj/item/hair_dye_cream
    reqs = list(
        /obj/item/reagent_containers/glass/bowl = 1,
        /obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3,
    )

// DIE

/datum/crafting_recipe/roguetown/survival/d4
	name = "bone die (d4)"
	result = /obj/item/dice/d4
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/d6
	name = "bone die (d6)"
	result = /obj/item/dice/d6
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/d8
	name = "bone die (d8)"
	result = /obj/item/dice/d8
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d10
	name = "bone die (d10)"
	result = /obj/item/dice/d10
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d12
	name = "bone die (d12)"
	result = /obj/item/dice/d12
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/d20
	name = "bone die (d20)"
	result = /obj/item/dice/d20
	reqs = list(/obj/item/natural/bone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 3

/datum/crafting_recipe/roguetown/survival/dye_brush
	name = "dye brush"
	result = /obj/item/needle
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/natural/fur = 1
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/whetstone
	name = "whetstone"
	result = /obj/item/natural/whetstone
	reqs = list(
		/obj/item/natural/stone = 1,
		/obj/item/grown/log/tree/stake = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/rucksack
	name = "rucksack"
	result = /obj/item/storage/backpack/rogue/backpack/bagpack
	reqs = list(
		/obj/item/storage/roguebag = 1,
		/obj/item/rope = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/rucksack/crafted
	reqs = list(/obj/item/storage/roguebag/crafted = 1,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/survival/woodshaft
	name = "wood shaft x2"
	result = /obj/item/shaft/wood
	tools = list(/obj/item/rogueweapon/huntingknife)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/reinforcedshaft
	name = "reinforced shaft"
	result = /obj/item/shaft/reinforced
	tools = list(/obj/item/rogueweapon/hammer)
	reqs = list(
		/obj/item/shaft/wood = 1,
		/obj/item/natural/whetstone = 2,
		)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/survival/peasantry/thresher
	name = "Thresher (+1 Iron Ingot)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 1,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/thresher
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/thresher/whetstone
	name = "Thresher (+4 Whetstones, +1 Log, +1 Rope)"
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/whetstone = 4,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/thresher
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/shovel
	name = "Shovel (+1 Iron Ingot, +2 Sticks)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/shovel
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/shovel/whetstone
	name = "Shovel (+3 Whetstones, +2 Logs, +1 Rope)"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/shovel
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/hoe
	name = "Hoe (+1 Iron Ingot, +2 Sticks)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/hoe
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/hoe/whetstone
	name = "Shovel (+3 Whetstones, +2 Logs, +1 Rope)"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/hoe
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/pitchfork
	name = "Pitchfork (+1 Iron Ingot, +2 Sticks)"
	reqs = list(
		/obj/item/grown/log/tree/stick = 2,
		/obj/item/ingot/iron = 1,
		)
	result = /obj/item/rogueweapon/pitchfork
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/pitchfork/whetstone
	name = "Pitchfork (+3 Whetstones, +2 Logs, +1 Rope)"
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/natural/whetstone = 3,
		/obj/item/rope = 1,
		)
	result = /obj/item/rogueweapon/pitchfork
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/peasantry/peasantwarflail
	name = "peasant war flail (thresher)"
	result = /obj/item/rogueweapon/flail/peasantwarflail
	reqs = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		/obj/item/rogueweapon/thresher = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/goedendag
	name = "militia goedendag"
	result = /obj/item/rogueweapon/woodstaff/militia
	reqs = list(
		/obj/item/rogueweapon/woodstaff = 1,
		/obj/item/natural/whetstone = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/waraxe
	name = "militia shovel-waraxe"
	result = /obj/item/rogueweapon/greataxe/militia
	reqs = list(
		/obj/item/rogueweapon/shovel = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warspear_hoe
	name = "militia warspear (hoe)"
	result = /obj/item/rogueweapon/spear/militia
	reqs = list(
		/obj/item/rogueweapon/hoe = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warspear_pitchfork
	name = "militia warspear (pitchfork)"
	result = /obj/item/rogueweapon/spear/militia
	reqs = list(
		/obj/item/rogueweapon/pitchfork = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/scythe
	name = "scythe"
	result = /obj/item/rogueweapon/scythe
	reqs = list(
		/obj/item/natural/whetstone = 1,
		/obj/item/grown/log/tree/small = 2,
		/obj/item/rope = 1,
		)
	craftdiff = 1

/datum/crafting_recipe/roguetown/survival/peasantry/warflail
	name = "militia flail"
	result = /obj/item/rogueweapon/flail/militia
	reqs = list(
		/obj/item/natural/whetstone = 2,
		/obj/item/rogueweapon/thresher = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warpick
	name = "militia warpick"
	result = /obj/item/rogueweapon/pick/militia
	reqs = list(
		/obj/item/rogueweapon/pick = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/warpick_steel
	name = "militia steel warpick"
	result = /obj/item/rogueweapon/pick/militia/steel
	reqs = list(
		/obj/item/rogueweapon/pick/steel = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/maciejowski_knife
	name = "maciejowski (hunting knife)"
	result = /obj/item/rogueweapon/sword/falchion/militia
	reqs = list(
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/natural/whetstone = 2,
		)
	craftdiff = 2

/datum/crafting_recipe/roguetown/survival/peasantry/maciejowski_messer
	name = "maciejowski (iron messer)"
	result = /obj/item/rogueweapon/sword/falchion/militia
	reqs = list(
		/obj/item/rogueweapon/sword/iron/messer = 1,
		/obj/item/natural/whetstone = 1,
		)
	craftdiff = 2
