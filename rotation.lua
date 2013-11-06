ProbablyEngine.rotation.register_custom(71, "Arma Capere", {

  -- =======================================
  --      Arma Capere - Arms Warrior PvE
  -- =======================================
  --          Optimized for T16 2P 
  -- =======================================
  -- If you have any questions, please ask
  -- https://probablyengine.com/forum/viewtopic.php?id=153
  -- =======================================

-- Hotkeys
	--{ "pause", "modifier.lshift"}, NOT IMPLEMENTED IN PE
	{ "Heroic Leap", "modifier.lcontrol", "ground" },
	{ "Skull Banner", "modifier.lalt", "ground"},
	{ "Demoralizing Banner", "modifier.rcontrol", "ground"},
	
-- Buffs
	{ "Berserker Rage" },
	{ "Blood Fury" },

-- Shouts
--	{ "Battle Shout", {
--  		"!player.buff(Battle Shout)",
--  		"!player.buff(Horn of Winter)",
--  		"!player.buff(Trueshot Aura)",
--	}},
--
--	{ "Commanding Shout", {
--  		"!player.buff(Commanding Shout)",
--  		"!player.buff(Dark Intent)",
--  		"!player.buff(Power Word: Fortitude)",
--  		"!player.buff(Qiraji Fortitude)",
--	}},

-- Interrupts
	{ "Pummel", "modifier.interrupts" },
	{ "Disrupting Shout", "modifier.interrupts" },

-- Defensives
	{ "Rallying Cry", {
    	"player.health < 25",
	}},

	{ "Shield Wall", {
    	"player.health < 15"
  	}},

  	{ "Die by the Sword", {
    	"player.health < 40",
  	}},

  	{ "Impending Victory" },
  	{ "Victory Rush" },

	{ "71", {
		"player.health <= 15",
        "player.seal != 2"
    }},
	{ "2457", {
		"player.health >= 16",
        "player.seal != 1"
    }},

-- Cooldowns
	{ "Avatar", "modifier.cooldowns"},
	{ "Recklessness", "modifier.cooldowns"},
	--{ "Skull Banner", "modifier.cooldowns"},

-- AoE
	{{ 
		{ "Thunder Clap", "target.debuff(Deep Wounds).duration < 3" },
		{ "Sweeping Strikes" },
		{ "Bloodbath" },
		{ "Bladestorm", "player.buff(Sweeping Strikes).duration > 5" },
		{ "Dragon Roar" },
		{ "Colossus Smash", "target.debuff(Colossus Smash).duration <= 2" },
		{ "Slam", "player.rage > 70" },
		{ "Mortal Strike", "player.rage < 40" },
		{ "Overpower", "player.buff(Taste for Blood).count >= 1" },
		{ "Battle Shout" },
		{ "Whirlwind" },
		{ "Heroic Throw" },		
	}, "modifier.multitarget"},

-- Single Target
	{ "Colossus Smash", "target.debuff(Colossus Smash).duration <= 2" },
	
	-- Inside CS
	{{
		{ "Storm Bolt" },
		{ "Bloodbath" },
		{ "Mortal Strike" },
		{ "Overpower", "player.buff(Taste for Blood).count >= 1" },
		{ "Heroic Strike", "player.rage >= 60" },
		{ "Slam" },
	}, {"target.debuff(Colossus Smash)", "target.health > 20" }},

	-- Execute Inside CS
	{{
		{ "Shattering Throw", "!player.moving" },
		{ "Storm Bolt" },
		{ "Bloodbath" },
		{ "Mortal Strike" },
		{ "Execute" },
		{ "Overpower", "player.buff(Taste for Blood).count >= 1" },
	}, {"target.debuff(Colossus Smash)", "target.health <= 20" }},
	
	-- Outside CS
	{{
		{ "Mortal Strike" },
		{ "Overpower", "player.buff(Taste for Blood).count >= 1" },
		{ "Battle Shout" },
		{ "Heroic Throw" },
		{ "Slam" },
	}, {"!target.debuff(Colossus Smash)", "target.health > 20" }},

	-- Execute Outside CS
	{{
		{ "Mortal Strike" },
		{ "Execute", "player.rage > 80" },
		{ "Overpower", "player.buff(Taste for Blood).count >= 1" },
		{ "Battle Shout" },
		{ "Heroic Throw" },
		{ "Heroic Strike" },		
	}, {"!target.debuff(Colossus Smash)", "target.health <= 20" }},

})