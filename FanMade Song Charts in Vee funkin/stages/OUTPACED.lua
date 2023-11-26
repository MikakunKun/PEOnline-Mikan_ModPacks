function onCreate()
	-- background stuff

	makeLuaSprite('Trees', 'Trees', -850, -300);
        addLuaSprite('Trees', false)

	makeLuaSprite('Grass', 'Grass', -1500, 800);
        addLuaSprite('Grass', false)

	makeLuaSprite('Bushes', 'Bushes', -650, 530);
        addLuaSprite('Bushes', false)

	setLuaSpriteScrollFactor('Grass', 1, 1);
        setLuaSpriteScrollFactor('Bushes', 1.1, 1);
        setLuaSpriteScrollFactor('Trees', 1.25, 1);
end

function onStepHit()
        if (curStep >= 1375 and curStep < 1391) then
                if curStep % 16 == 0 or curStep % 16 == 8 then
                        triggerEvent('Add Camera Zoom', '', '')
                end
        end
        if (not ((curStep >= 384 and curStep <= 400) or (curStep >= 832 and curStep < 848) or (curStep >= 1103 and curStep < 1119)
        or (curStep >= 1375 and curStep < 1391) or (curStep >= 1887 and curStep < 1951))) and  curStep < 2208  then
                if curStep % 16 == 0 or curStep % 16 == 6 then
                        triggerEvent('Add Camera Zoom', '', '')
                end
                if (curStep >= 272 and curStep <= 784) or (curStep >= 1119 and curStep <= 1631) then
                        if curStep % 16 == 12 then
                                triggerEvent('Add Camera Zoom', '-0.015', '-0.03')
                        end
                end
        end
end