function onCreate()
	-- background shit
	makeLuaSprite('ttownBG', 'ttownBG', -550, -385);
	setScrollFactor('ttownBG', 0.9, 0.9);
	scaleObject('ttownBG', 1.1, 1.1);
	
	makeLuaSprite('ttownFG', 'ttownFG', -550, -390);
	setScrollFactor('ttownFG', 0.9, 0.9);
	scaleObject('ttownFG', 1.1, 1.1);

	addLuaSprite('ttownBG', false);
	addLuaSprite('ttownFG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end