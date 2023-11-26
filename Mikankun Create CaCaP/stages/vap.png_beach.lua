function onCreate()
	-- background shit
    makeLuaSprite('thebglol', 'beach', -600, -600)
	scaleObject('thebglol', 1.6, 1.6)
	setScrollFactor('thebglol', 0.9, 0.9)


	addLuaSprite('thebglol', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end