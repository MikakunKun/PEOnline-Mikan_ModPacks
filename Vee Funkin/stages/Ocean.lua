local wheeee = 0
function onCreate()
	-- background stuff

	makeLuaSprite('Background', 'Ocean/Background', -1100, -400);
        addLuaSprite('Background', false)

	makeLuaSprite('Rock-back', 'Ocean/Rock-back', 400, -400);
        addLuaSprite('Rock-back', false)

	makeLuaSprite('Rock-front', 'Ocean/Rock-front', -900, -400);
        addLuaSprite('Rock-front', false)
	
        makeLuaSprite('Rock-far-far', 'Ocean/Rock-far-far', 1300, 550);
        addLuaSprite('Rock-far-far', false)

        makeAnimatedLuaSprite('Feesh', 'Feesh', -200, 0)
	addAnimationByPrefix('Feesh','Feesh','Feesh', 24, true)
        addLuaSprite('Feesh',false);
	objectPlayAnimation('Feesh', 'Feesh', true);

        makeLuaSprite('Black', 'Black', -1000, -500);
        addLuaSprite('Black', true)

	setLuaSpriteScrollFactor('Background', 1, 1);
        setLuaSpriteScrollFactor('Rock-front', 1.1, 1);
        setLuaSpriteScrollFactor('Rock-back', 1.25, 1);
        setLuaSpriteScrollFactor('Rock-far-far', 1.30, 1);
        setLuaSpriteScrollFactor('Feesh', 1, 1);
        setLuaSpriteScrollFactor('Black', 1, 1);

end
function onEvent(name,value1,value2)
	if name == 'Play Animation' then

		if value1 == 'Disappear' then
                        setProperty('Black.visible', false);
                end
        end
end
function onUpdate()
    wheeee = wheeee + 1;
         setProperty('gfGroup.angle',wheeee);
end