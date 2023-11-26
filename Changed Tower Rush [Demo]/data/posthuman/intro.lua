local initiate = false

function onUpdate()
if not initiate then
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
runTimer('wff', 0.01)
runTimer('wfe', 1.01)
end
end
end

function onStartCountdown()
	if not initiate then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.001);
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		playSound('Book', 1)
		makeLuaSprite('photo', 'photos/Posthuman', screenWidth / 2 - 373 / 2, screenHeight / 2 - 385 / 2)
		setObjectCamera('photo', 'other')
		addLuaSprite('photo', true)
		
		makeLuaSprite('bg', '', 0, 0)
		makeGraphic('bg', screenWidth, screenHeight, '000000')
		setObjectCamera('bg', 'other')
		setObjectOrder('bg', getObjectOrder('photo') - 1)
		doTweenAlpha('SetToSemiTransparent', 'bg', 0.5, 0.001)
		addLuaSprite('bg', true)
		
		runTimer('wff', 3)
		runTimer('wfe', 4)
		
		setProperty('scoreTxt.visible', false);
		setProperty('healthBarBG.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('iconP2.visible', false);
		setProperty('iconP1.visible', false);
	end
	if tag == 'wfe' then
		initiate = true
		removeLuaSprite('shakyname')
		removeLuaSprite('bg')
		setProperty('scoreTxt.visible', true);
		setProperty('healthBarBG.visible', true);
		setProperty('healthBar.visible', true);
		setProperty('iconP2.visible', true);
		setProperty('iconP1.visible', true);
		startCountdown()
	end
	if tag == 'wff' then
		playSound('Book', 1)
		doTweenAlpha('fadebg', 'bg', 0, 1)
		doTweenAlpha('fadename', 'photo', 0, 1)
	end
end

function onCreate()
	setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
	setProperty('skipCountdown',true)
	setProperty('vocals.time',0)
end

function onCreatePost()
	setProperty('vocals.volume',0)
	setProperty('vocals.time',0)
end

function onSongStart()
	setProperty('vocals.volume',1)
	setProperty('vocals.time',0)
	setPropertyFromClass('flixel.FlxG','sound.music.volume',1)
end