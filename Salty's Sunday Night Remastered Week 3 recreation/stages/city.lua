
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'bg/city/sky', -600, -400);
	setScrollFactor('sky', 0.1, 0.1);
	scaleObject('sky', 0.9, 0.9);
	
	makeLuaSprite('moon', 'bg/city/moon', -900, -600);
	setScrollFactor('moon', 0.2, 0.2);
	scaleObject('moon', 0.9, 0.9);

	makeLuaSprite('city', 'bg/city/city', -600, -300);
	setScrollFactor('city', 0.8, 0.8);
	scaleObject('city', 0.9, 0.9);
	
	makeLuaSprite('city2', 'bg/city/city2', -600, -300);
	setScrollFactor('city2', 0.9, 0.9);
	scaleObject('city2', 0.9, 0.9);

	makeLuaSprite('city3', 'bg/city/city3', -600, -300);
	setScrollFactor('city3', 0.9, 0.9);
	scaleObject('city3', 0.9, 0.9);

	makeLuaSprite('street', 'bg/city/street', -600, -300);
	setScrollFactor('street', 1, 1);
	scaleObject('street', 0.9, 0.9);

	addLuaSprite('sky', false);
	addLuaSprite('moon', false);
	addLuaSprite('city', false);
	addLuaSprite('city2', false);
	addLuaSprite('city3', false);
	addLuaSprite('street', false);
end