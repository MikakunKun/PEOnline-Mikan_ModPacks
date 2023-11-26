function onCreate()
	-- background shit
	makeAnimatedLuaSprite('croagunk guild', 'dance', -550, -385);
	setScrollFactor('croagunk guild', 0.0, 0.0);
	luaSpriteAddAnimationByPrefix('croagunk guild', 'dance', 'dance', 24, true);
	objectPlayAnimation('croagunk guild', 'dance', true);
	scaleObject('croagunk guild', 1.1, 1.1)

	makeLuaSprite('guild', 'guild', -550, -385);
	setScrollFactor('guild', 1.0, 0.9);
	scaleObject('guild', 1.1, 1.1);

	addLuaSprite('croagunk guild', false);
	addLuaSprite('guild', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end