function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Glitch Note' then
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Static_Note_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Glitch_Splash_assets');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end


function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Glitch Note' then
		makeAnimatedLuaSprite('image','GlitchingEffect',0,0)addAnimationByPrefix('image','dance','Glitching',24,true)
		objectPlayAnimation('image','dance',false)
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.01, 'quartIn');
		setObjectCamera('image', 'other');
		doTweenAlpha('byebye', 'image', 0, 1.2, 'quartin');
		--[[
		setPropertyFromClass('openfl.Lib','application.window.x', getRandomFloat(0,250))
		setPropertyFromClass('openfl.Lib','application.window.y', getRandomFloat(0,150))]]

	end
end


function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end