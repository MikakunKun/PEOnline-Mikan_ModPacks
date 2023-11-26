function onCreate()
	-- background 
-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('sky2','philly-neo/sky2', -1800, -600);
		setLuaSpriteScrollFactor('sky', 0.1, 0.1);
		scaleObject('sky2', 2.00, 2.00);
		makeLuaSprite('city2','philly-neo/city2', -500, -200);
		setLuaSpriteScrollFactor('city2', 0.3, 0.3);
		scaleObject('city2', 1.50, 1.50);
		makeLuaSprite('behindTrain2','philly-neo/behindTrain2', -700, -750);
		scaleObject('behindTrain2', 1.50, 1.50);
		makeLuaSprite('street2','philly-neo/street2', -1800, -550);
		scaleObject('street2', 0.9, 0.9);



	end

	addLuaSprite('sky2', false);
	addLuaSprite('city2', false);
	addLuaSprite('light', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('light', 'idle', 'light idle', 1, false);
	addLuaSprite('behindTrain2', false);
	addLuaSprite('street2', false);
	
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end