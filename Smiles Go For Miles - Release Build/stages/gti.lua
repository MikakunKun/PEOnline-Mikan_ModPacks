function onCreate()
	-- background shit
	makeLuaSprite('gti new', 'gti new', -550, -385);
	setScrollFactor('gti new', 1.0, 1.0);
	scaleObject('gti new', 1.1, 1.1);

	addLuaSprite('gti new', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end