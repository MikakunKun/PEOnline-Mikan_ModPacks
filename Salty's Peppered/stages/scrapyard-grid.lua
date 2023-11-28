local xx = 360;
local yy = 600;
local xx2 = 700;
local yy2 = 600;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
function onCreate()
	-- background shit
	makeLuaSprite('sky', 'scrapyard/sky', -800, -1050);
	setLuaSpriteScrollFactor('sky', 0.5, 0.5);
        scaleObject('sky', 2, 1);
		
		makeLuaSprite('city-bg', 'scrapyard/city-bg', -500, -550);
		setLuaSpriteScrollFactor('city-bg', 0.6, 0.6);
		scaleObject('city-bg', 1, 1);
	
	makeLuaSprite('ground', 'scrapyard/ground', -1000, -550);
	scaleObject('ground', 1.1, 1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('scrap-left', 'scrapyard/scrap-left', -920, -500);
		setLuaSpriteScrollFactor('scrap-left', 1, 1);
		scaleObject('scrap-left', 1, 1);
		
		makeLuaSprite('box', 'scrapyard/box', -850, -500);
		setLuaSpriteScrollFactor('box', 1, 1);
		scaleObject('box', 1, 1);
		
		makeLuaSprite('scrap-right', 'scrapyard/scrap-right', -720, -450);
		setLuaSpriteScrollFactor('scrap-right', 1, 1);
		scaleObject('scrap-right', 1, 1);

        makeLuaSprite('grid', 'scrapyard/grid', -700, -650);
	setLuaSpriteScrollFactor('grid', 0.5, 0.5);
        scaleObject('grid', 1, 1);

		makeLuaSprite('vignette', 'scrapyard/vignette', -1300, -700);
		setLuaSpriteScrollFactor('vignette', 1, 1);
		scaleObject('vignette', 2, 2);

               makeAnimatedLuaSprite('light', 'mall2/light', -1300, -700);
        setLuaSpriteScrollFactor('light', 1, 1);
        scaleObject('light', 2, 2); 

	end

	addLuaSprite('sky', false);
	addLuaSprite('city-bg', false);
	addLuaSprite('ground', false);
	addLuaSprite('scrap-left', false);
	addLuaSprite('scrap-right', false);
	addLuaSprite('box', false);
        addLuaSprite('grid', false);
	addLuaSprite('vignette', true);

end

function onStepHit()
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
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
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