local xx = 110;
local yy = 440;
local xx2 = 950;
local yy2 = 580;
local ofs = 60;
local angleshit = 1;
local anglevar = 1;
local followchars = true;

function onCreate()
	-- background
-- sprites that only load if Low Quality is turned off
	if not lowQuality then
                makeLuaSprite('street2','philly2/street2', -110, -0);
                makeLuaSprite('Back5','philly2/Back5', -600, -200);
		makeLuaSprite('sky','philly2/sky2', -600, -300);
		setLuaSpriteScrollFactor('sky', 0.2, 0.2);
                scaleObject('sky', 1.2, 1.2);
                makeLuaSprite('bg-yellah','bg-yellah', -600, -300);
		setLuaSpriteScrollFactor('bg-yellah', 0.2, 0.2);
                scaleObject('bg-yellah', 1.2, 1.2);
                makeLuaSprite('Back5','philly2/Back5', -600, -200);
		setLuaSpriteScrollFactor('Back5', 0.3, 0.3);
		scaleObject('Back5', 1.2, 1.2);
	        makeLuaSprite('nest-stairs','philly2/nest-stairs', -600, -200);
		scaleObject('nest-stairs', 1.2, 1.2);
                setLuaSpriteScrollFactor('nest-stairs', 0.6, 0.6);
                makeLuaSprite('stairs','philly2/stairs', -600, -300);
                scaleObject('stairs', 1.2, 1.2);
                setLuaSpriteScrollFactor('stairs', 0.5, 0.5);
		makeLuaSprite('honeycomb1','philly2/honeycomb1', -600, -300);
		setLuaSpriteScrollFactor('honeycomb1', 0.3, 0.3);
		scaleObject('honeycomb1', 1.2, 1.2);
                makeLuaSprite('honeycomb2','philly2/honeycomb2', -600, -300);
		setLuaSpriteScrollFactor('honeycomb2', 0.4, 0.4);
		scaleObject('honeycomb2', 1.2, 1.2);
		makeAnimatedLuaSprite('light', 'philly2/light',-600, -200);		
	        scaleObject('light', 1.2, 1.2);
                setLuaSpriteScrollFactor('light', 0.6, 0.6);
                makeAnimatedLuaSprite('light-front', 'philly2/light-front', -1200, -600);
                setLuaSpriteScrollFactor('light-front', 1, 1);
                scaleObject('light-front', 5, 5);

	end

	addLuaSprite('sky', false);
        addLuaSprite('bg-yellah', false);
        addLuaSprite('honeycomb1', false);
        addLuaSprite('honeycomb2', false);
        addLuaSprite('stairs', false);
        addLuaSprite('nest-stairs', false);
	addLuaSprite('light', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('light', 'idle', 'light idle', 1, true);
        addLuaSprite('street2', false);
        addLuaSprite('light-front', true)
	addAnimationByPrefix('light-front','idle', 'light light0', 24, true);

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