function onCreate()
	-- background shit
	makeLuaSprite('oscuro', 'oscuro', -700, -200);
	setScrollFactor('oscuro', 0.9, 0.9);
	
		makeLuaSprite('cabin', 'cabin', -800, -50);
		setScrollFactor('cabin', 1.3, 1.3);
		scaleObject('cabin', 0.9, 0.9);

	addLuaSprite('oscuro', false);
	addLuaSprite('cabin', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end