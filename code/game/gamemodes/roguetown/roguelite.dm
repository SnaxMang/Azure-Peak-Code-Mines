#define ROGUELITE_PLAYER_LIMIT 25
// Roguelite mode - the simplest version, with only bandits OR werewolves
/datum/game_mode/chaosmode/roguelite
	name = "roguelite"
	config_tag = "roguelite"
	report_type = "roguelite"
	false_report_weight = 0
	required_players = 0 // Helps it be the default mode.
	required_enemies = 0
	recommended_enemies = 0
	enemy_minimum_age = 0
	votable = TRUE
	probability = 99

	announce_span = "danger"
	announce_text = "The town may have been infiltrated! Watch your back..."
	
	var/chosen_antag = ""  // Will be either "bandits" or "werewolves"

// Override pre_setup to clear any previously selected antagonists
/datum/game_mode/chaosmode/roguelite/pre_setup()
	if(allmig || roguefight)
		return TRUE
	
	// Get antagonist candidates
	for(var/A in GLOB.special_roles_rogue)
		allantags |= get_players_for_role(A)
	
	if(num_players() <= ROGUELITE_PLAYER_LIMIT) // Need at least a chunk of people before we start throwing ne'er-do-wells into the mix.
		log_game("Roguelite is active, but less than 25 readied playercount. Antags will not be picked automatically.")
		return TRUE
	else // Randomly choose between bandits or werewolves
		if(prob(50))
			chosen_antag = "bandits"
			pick_bandits()
			log_game("Antagonists: Roguelite Mode - Bandits")
		else
			chosen_antag = "werewolves"
			pick_werewolves()
			log_game("Antagonists: Roguelite Mode - Werewolves")
		return TRUE

// Override after_DO to do nothing for roguelite
/datum/game_mode/chaosmode/roguelite/after_DO()
	if(allmig || roguefight)
		return TRUE
	
	// Do nothing - antagonists have already been chosen in pre_setup
	// This ensures we don't run the parent after_DO which might add additional antagonists
	
	return TRUE

// Override post_setup to only process the chosen antagonist type
/datum/game_mode/chaosmode/roguelite/post_setup()
	set waitfor = FALSE

	if(chosen_antag == "werewolves")
		// Process werewolves only
		for(var/datum/mind/werewolf_mind in pre_werewolves)
			var/datum/antagonist/new_antag = new /datum/antagonist/werewolf()
			werewolf_mind.add_antag_datum(new_antag)
			werewolves += werewolf_mind
			GLOB.pre_setup_antags -= werewolf_mind
		
		// Clear any bandits that might have been selected previously
		pre_bandits.Cut()

	else if(chosen_antag == "bandits")
		// Process bandits only
		for(var/datum/mind/bandito_mind in pre_bandits)
			var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
			bandito_mind.add_antag_datum(new_antag)
			bandits += bandito_mind
			GLOB.pre_setup_antags -= bandito_mind
			SSrole_class_handler.bandits_in_round = TRUE
		
		// Clear any werewolves that might have been selected previously
		pre_werewolves.Cut()

	..()
	//We're not actually ready until all antagonists are assigned.
	gamemode_ready = FALSE
	addtimer(VARSET_CALLBACK(src, gamemode_ready, TRUE), 101)
	return TRUE

// Override generate_report to provide roguelite-specific report
/datum/game_mode/chaosmode/roguelite/generate_report()
	return {"<span class='header'>Town Intelligence Report</span><br>
			<span class='alert'>Roguelite Mode</span><br>
			<span class='alert'>Recent intelligence suggests potential hostile activity in the vicinity.</span><br>
			<span class='alert'>Be vigilant and report suspicious activity to the town authorities.</span>
	"}
