local xx =  400;
local yy =  500;
local xx2 = 1000;
local yy2 = 600;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;

function onCreate()
	-- background 
-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('sky-normal','graveyard/sky-normal', -800, -500);
                setLuaSpriteScrollFactor('sky-normal', 0.6, 0.6);
                makeLuaSprite('tree-city-bg','graveyard/tree-city-bg', -950, -500);
                setLuaSpriteScrollFactor('tree-city-bg', 0.8, 0.8);
                makeLuaSprite('mortuary-normal','graveyard/mortuary-normal', -900, -500);
                makeAnimatedLuaSprite('light', 'mall2/light', -1000, -700);
        setLuaSpriteScrollFactor('light', 1, 1);
        scaleObject('light', 3, 3);

          		



	end

	addLuaSprite('sky-normal', false);
	addLuaSprite('tree-city-bg', false);
	addLuaSprite('mortuary-normal', false);

end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
      end

    else
        triggerEvent('Camera Follow Pos','','')
    end

end
 function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end
