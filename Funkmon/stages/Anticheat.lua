function onCreate()
	-- background shit
	makeLuaSprite('Back', 'Map23', -500, -500);
	setScrollFactor('Back', 0.4, 0.4);

	makeLuaSprite('Mid', 'Map22', -500, -500);
	setScrollFactor('Mid', 1, 1);

	makeLuaSprite('Front', 'Map21',-500, -500);
	setScrollFactor('Front', 0, 0);

	addLuaSprite('Back', false);
	addLuaSprite('Mid', false);
	addLuaSprite('Front', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end