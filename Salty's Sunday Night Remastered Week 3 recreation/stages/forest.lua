
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'bg/forest/sky', -600, -400);
	setScrollFactor('sky', 0.5, 0.5);
	scaleObject('forest', 0.9, 0.9);

	makeLuaSprite('forest', 'bg/forest/forest', -200, -250);
	setScrollFactor('forest', 1, 1);
	scaleObject('forest', 0.9, 0.9);

	addLuaSprite('sky', false);
	addLuaSprite('forest', false);
end