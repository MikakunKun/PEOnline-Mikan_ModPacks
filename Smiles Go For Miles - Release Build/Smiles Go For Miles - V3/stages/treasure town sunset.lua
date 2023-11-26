function onCreate()
	-- background shit
	makeLuaSprite('ttown sunset BG', 'ttown sunset BG', -550, -385);
	setScrollFactor('ttown sunset BG', 0.9, 0.9);
	scaleObject('ttown sunset BG', 1.1, 1.1);

makeAnimatedLuaSprite('kecleons', 'kecleons', -550, -320);
	luaSpriteAddAnimationByPrefix('kecleons', 'kecleons', 'kecleons', 6, true);
	objectPlayAnimation('kecleons', 'kecleons', true);
	setScrollFactor('kecleons', 0.9, 0.9);
	scaleObject('kecleons', 1.1, 1.1)
	
	makeLuaSprite('ttown sunset FG', 'ttown sunset FG', -550, -330);
	setScrollFactor('ttown sunset FG', 0.9, 0.9);
	scaleObject('ttown sunset FG', 1.1, 1.1);

	addLuaSprite('ttown sunset BG', false);
	addLuaSprite('kecleons', false);
	addLuaSprite('ttown sunset FG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end