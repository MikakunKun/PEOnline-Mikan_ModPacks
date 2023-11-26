function opponentNoteHit() -- health draining mechanic
	health = getProperty('health')
    	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.03);
  end
end

function onCreate()
	setPropertyFromClass('states.GameOverSubstate', 'characterName', 'playable-spinda-gf');
	setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'GFDeath');
	setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');
end