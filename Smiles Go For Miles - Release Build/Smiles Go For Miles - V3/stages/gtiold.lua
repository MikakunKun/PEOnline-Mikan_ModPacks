function onCreate()
	-- background shit
	makeLuaSprite('gti full bg', 'gti full bg', -550, -385);
	setScrollFactor('gti full bg', 1.0, 1.0);
	scaleObject('gti full bg', 1.1, 1.1);
	
	makeLuaSprite('gti fg 2', 'gti fg 2', -550, -390);
	setScrollFactor('gti fg 2', 1.0, 1.0);
	scaleObject('gti fg 2', 1.1, 1.1);

	addLuaSprite('gti full bg', false);
	addLuaSprite('gti fg 2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end