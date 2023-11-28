local xx = 230;
local yy = 440;
local xx2 = 950;
local yy2 = 580;
local ofs = 60;
local angleshit = 1;
local anglevar = 1;

function onCreate()
	-- background shit
	makeLuaSprite('BG_Back1', 'herstage/BG_Back1', -450, -250);
	setLuaSpriteScrollFactor('BG_Back1', 0.1, 0.1);
        scaleObject('BG_Back1', 1.3, 1.3);
	
	makeLuaSprite('BG_Back2', 'herstage/BG_Back2', -500, -150);
	setLuaSpriteScrollFactor('BG_Back2', 0.3, 0.3);
	scaleObject('BG_Back2', 1.4, 1.3);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('BG_Back3', 'herstage/BG_Back3', -550, -100);
		setLuaSpriteScrollFactor('BG_Back3', 0.4, 0.4);
		scaleObject('BG_Back3', 1.5, 1.3);
		
		makeLuaSprite('BG_Back4', 'herstage/BG_Back4', -400, -200);
		setLuaSpriteScrollFactor('BG_Back4', 0.6, 0.6);
		scaleObject('BG_Back4', 1.1, 1.1);

		makeLuaSprite('FG', 'herstage/FG', -700, -250);
		setLuaSpriteScrollFactor('FG', 1, 1);
		scaleObject('FG', 1.4, 1.4);

          makeLuaSprite('bg-gray', 'bg-gray', -450, -250);
	setLuaSpriteScrollFactor('bg-gray', 0.1, 0.1);
        scaleObject('bg-gray', 1.3, 1.3);

               makeAnimatedLuaSprite('light-front', 'philly2/light-front', -1300, -700);
        setLuaSpriteScrollFactor('light-front', 1, 1);
        scaleObject('light-front', 2, 2); 

	end

	addLuaSprite('BG_Back1', false);
	addLuaSprite('BG_Back2', false);
	addLuaSprite('BG_Back3', false);
	addLuaSprite('BG_Back4', false);
	addLuaSprite('FG', false);
        addLuaSprite('bg-gray', false);
        addLuaSprite('light-front', true)
	addAnimationByPrefix('light-front','Move', 'light light0', 12, true);

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