function onCreate()
	-- background shit
	makeLuaSprite('sky', 'sky', -600, -100);
	setScrollFactor('sjy', 0.9, 0.9);
	
	makeLuaSprite('hill', 'hill', -850, -550);
	setScrollFactor('hill', 0.9, 0.9);
	scaleObject('hill', 1.1, 1.1);

        -- sprites that only load if Low Quality is turned off
	if not lowQuality then
                makeLuaSprite('bg_trees', 'bg_trees', -650, -300);
                setScrollFactor('bg_trees', 0.9, 0.9);
		scaleObject('bg_trees', 1.1, 1.1);

                makeLuaSprite('background', 'background', 300, -200);
		scaleObject('background', 0.9, 0.9);
		
		makeLuaSprite('middleground', 'middleground', 0, -100);
		scaleObject('middleground', 0.8, 0.8);

		makeLuaSprite('housemg', 'housemg', -900, -300);
		scaleObject('house', 1.0, 1.0);

                makeLuaSprite('housemg', 'housemg', -600, -300);
		scaleObject('housemg', 1.0, 1.0);

		makeLuaSprite('terrain', 'terrain', -600, -400);
		scaleObject('terrain', 1.1, 1.1);

		makeLuaSprite('house', 'house', -600, -350);
		scaleObject('house', 1.1, 1.1);
	end

	addLuaSprite('sky', false);
	addLuaSprite('hill', false);
	addLuaSprite('bg_trees', false);
	addLuaSprite('background', false);
	addLuaSprite('middleground', false);
        addLuaSprite('housemg', false);
        addLuaSprite('terrain', false);
	addLuaSprite('house', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end