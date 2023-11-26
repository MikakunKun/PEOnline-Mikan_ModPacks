function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'BF Perkie'); --Character json file for the death animation
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'BB Game Over'); --put in mods/music/
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'BB Game Over Confirm'); --put in mods/music/
end