function onCreate()
	makeLuaSprite('BG', 'monkeystage/Nighttime_BG', -320, -50);
	setScrollFactor('BG', 1, 1);
	addLuaSprite('BG', false);

	makeAnimatedLuaSprite('bashers', 'monkeystage/BG_Bash_Night', -250, 190);
	addAnimationByPrefix('bashers', 'idle', 'BG_Bash_Night', 24, true)
	setScrollFactor('bashers', 1, 1);
	addLuaSprite('bashers', false);
end

function onCreatePost()
	doTweenColor('idk', 'boyfriend', '0xFFE6E6E6', 0.1, 'linear')
	doTweenColor('idk2', 'dad', '0xFFE6E6E6', 0.1, 'linear')
end

function onCountdownTick(c)
	onBeatHit()
end

function onEvent(eventName, value1, value2)
	if eventName == 'Change Character' then
		doTweenColor('idk', 'boyfriend', '0xFFE6E6E6', 0.1, 'linear')
		doTweenColor('idk2', 'dad', '0xFFE6E6E6', 0.1, 'linear')
	end
end

function onBeatHit()
	playAnim('bashers', 'idle', true);
end

