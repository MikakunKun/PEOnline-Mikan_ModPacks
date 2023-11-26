function onCreate()
    makeLuaSprite('Shark', 'Shark', -600, -300);
	setScrollFactor('Shark', 1, 1);

	addLuaSprite('Shark', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end