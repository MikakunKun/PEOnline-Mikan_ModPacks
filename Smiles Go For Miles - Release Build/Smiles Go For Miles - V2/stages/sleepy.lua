function onCreate()
	-- background shit
	makeLuaSprite('sleepy', 'sleepy', -550, -385);
	setScrollFactor('sleepy', 1, 1);
	scaleObject('sleepy', 1.1, 1.1);
	
	makeLuaSprite('sleepy2', 'sleepy2', -550, -390);
	setScrollFactor('sleepy2', 1, 1);
	scaleObject('sleepy2', 1.1, 1.1);
	
	makeLuaSprite('sleepy leefs', 'sleepy leefs', -550, -390);
	setScrollFactor('sleepy leefs', 1, 1);
	scaleObject('sleepy leefs', 1.1, 1.1);
	
	makeLuaSprite('sleepy3', 'sleepy3', -550, -390);
	setScrollFactor('sleepy3', 1, 1);
	scaleObject('sleepy3', 1.1, 1.1);

	addLuaSprite('sleepy', false);
	addLuaSprite('sleepy2', true);
	addLuaSprite('sleepy leefs', true);
	addLuaSprite('sleepy3', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end