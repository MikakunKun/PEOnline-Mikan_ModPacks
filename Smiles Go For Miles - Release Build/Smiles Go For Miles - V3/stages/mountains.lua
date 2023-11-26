function onCreate()
	-- background shit
	makeLuaSprite('mountains1', 'mountains1', -550, -385);
	setScrollFactor('mountains1', 1, 1);
	scaleObject('mountains1', 1.1, 1.1);
	
	makeLuaSprite('mountains2', 'mountains2', -550, -390);
	setScrollFactor('mountains2', 1, 1);
	scaleObject('mountains2', 1.1, 1.1);
	
	makeLuaSprite('mountains3', 'mountains3', -550, -390);
	setScrollFactor('mountains3', 1, 1);
	scaleObject('mountains3', 1.1, 1.1);

	addLuaSprite('mountains1', false);
	addLuaSprite('mountains2', false);
	addLuaSprite('mountains3', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end