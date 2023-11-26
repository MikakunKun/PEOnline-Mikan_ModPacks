function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'BF Crystal'); --Character json file for the death animation
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end