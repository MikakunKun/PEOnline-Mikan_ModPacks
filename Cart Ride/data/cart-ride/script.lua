local xx = 1900;
local yy = 400;
local xx2 = 0;
local yy2 = 0;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;
local zz = 1;
local zz2 = 0.7;

local camerapersp = 1

function onCreatePost()
    setProperty('gf.alpha', 0)
end

function onCreate()
    addCharacterToList('bfcartpersp1', 'boyfriend')
    addCharacterToList('cartbf', 'boyfriend')
    addCharacterToList('noob', 'dad')
    addCharacterToList('noobp1', 'dad')
end

function onUpdate()
    if camerapersp == 1 then
        local xx = getProperty('dad.x') + 370
        local yy = getProperty('dad.y') + 400
        local xx2 = getProperty('boyfriend.x') + 150
        local yy2 = getProperty('boyfriend.y') + 240
    
        if del > 0 then
            del = del - 1
        end
        if del2 > 0 then
            del2 = del2 - 1
        end
        if followchars == true then
            if mustHitSection == false then
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                    setProperty('defaultCamZoom', zz)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                    setProperty('defaultCamZoom', zz)
                end
            else
    
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                    setProperty('defaultCamZoom', zz2)
                end
                
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
                    triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                    triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
                    triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                    setProperty('defaultCamZoom', zz2)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                    setProperty('defaultCamZoom', zz2)
                end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                    setProperty('defaultCamZoom', zz2)
                end
            end
        else
            triggerEvent('Camera Follow Pos','','')
        end
    elseif camerapersp == 2 then
        triggerEvent('Camera Follow Pos',699,290)
        setProperty('defaultCamZoom', 0.69)
    end
end

function onSongStart()
end

function onStepHit()
    if curStep == 1 then
        --doTweenZoom('asf', 'camGame', 0.3, 0.5, 'cubeOut')
        --setProperty('defaultCamZoom', 0.3)
	end
end

function onBeatHit()
	if curBeat == 232 then
        camerapersp = 2
        triggerEvent('Change Character', 'boyfriend', 'cartbf')
        triggerEvent('Change Character', 'dad', 'noob')
        setProperty('boyfriend.x', 860)
        setProperty('boyfriend.y', -10)
        setProperty('dad.x', -290)
        setProperty('dad.y', -350)
	end

	if curBeat == 360 then
        camerapersp = 1
        triggerEvent('Change Character', 'boyfriend', 'bfcartpersp1')
        triggerEvent('Change Character', 'dad', 'noobp1')
        setProperty('boyfriend.y', 180)
        setProperty('dad.x', 430)
        setProperty('dad.y', -150)
	end
end