
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  1000;
local yy =  1050;
local xx2 = 1400;
local yy2 = 1050;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	makeLuaSprite('monotoneback', 'monotoneback', 0, -100);
	setScrollFactor('monotoneback', 0.9, 0.9);
	addLuaSprite('monotoneback', false);

	makeAnimatedLuaSprite('crowd','crowd',900,800)
	addAnimationByPrefix('crowd','crowd','tess n gus fring instance',24,true)
	objectPlayAnimation('crowd','crowd',true)
	addLuaSprite('crowd',false)

	makeLuaSprite('backlights', 'backlights', 0, -100);
	setScrollFactor('backlights', 0.9, 0.9);
	addLuaSprite('backlights', false);

	makeLuaSprite('fg', 'fg', 0, -100);
	setScrollFactor('fg', 0.9, 0.9);
	addLuaSprite('fg', false);

	makeLuaSprite('attacklamp', 'lamp', 0, 0);
	setScrollFactor('attacklamp', 0.9, 0.9);
	addLuaSprite('attacklamp', false);

	makeAnimatedLuaSprite('cooper','cooper',2000,700)
	addAnimationByPrefix('cooper','cooper','bg seat 1 instance',24,true)
	objectPlayAnimation('cooper','cooper',true)
	addLuaSprite('cooper',false)

	makeAnimatedLuaSprite('orbyy','orbyy',900,650)
	addAnimationByPrefix('orbyy','orbyy','orbyy',24,true)
	objectPlayAnimation('orbyy','orbyy',true)
	addLuaSprite('orbyy',false)

	makeAnimatedLuaSprite('offbi','offbi',1300,600)
	addAnimationByPrefix('offbi','offbi','offbi',24,true)
	objectPlayAnimation('offbi','offbi',true)
	addLuaSprite('offbi',false)

	makeAnimatedLuaSprite('loggoattack','loggoattack',1000,750)
	addAnimationByPrefix('loggoattack','loggoattack','loggfriend',24,true)
	objectPlayAnimation('loggoattack','loggoattack',true)
	addLuaSprite('loggoattack',false)

	makeAnimatedLuaSprite('nick t','nick t',650,700)
	addAnimationByPrefix('nick t','nick t','nick t idle',24,true)
    addAnimationByPrefix('nick t','nick t2','nick t animation',23,false)
	objectPlayAnimation('nick t','nick t',true)
	addLuaSprite('nick t',false)

	makeLuaSprite('frontlight', 'frontlight', 0, -100);
	setScrollFactor('frontlight', 0.9, 0.9);
	addLuaSprite('frontlight', true);

	makeLuaSprite('purple', 'purple', 0, -100);
	setScrollFactor('purple', 0.9, 0.9);
	addLuaSprite('purple', true);

    addLuaScript('data/LoadSecondJson')
end

function onStepHit()
    if curStep == 1427 then
        objectPlayAnimation('nick t','nick t2',true)
        doTweenAlpha('pinkTw22', 'loggoattack', 0.2, 0.2, 'linear')
        doTweenAlpha('pinkTw23', 'orbyy', 0.2, 0.2, 'linear')
        doTweenAlpha('pinkTw24', 'offbi', 0.2, 0.2, 'linear')
        doTweenAlpha('dadFadeEventTween', 'boyfriend', 0.2, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween2', 'dad', 0.2, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween3', 'Dad-NeoBf', 0.2, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween4', 'BF_shirtless', 0.2, 0.2, 'linear');
    elseif curStep == 1440 then
        objectPlayAnimation('nick t','nick t',true)
        doTweenAlpha('pinkTw22', 'loggoattack', 1, 0.2, 'linear')
        doTweenAlpha('pinkTw23', 'orbyy', 1, 0.2, 'linear')
        doTweenAlpha('pinkTw24', 'offbi', 1, 0.2, 'linear')
        doTweenAlpha('dadFadeEventTween', 'boyfriend', 1, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween2', 'dad', 1, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween3', 'Dad-NeoBf', 1, 0.2, 'linear');
        doTweenAlpha('dadFadeEventTween4', 'BF_shirtless', 1, 0.2, 'linear');
    end
end


function onUpdate()
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
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat == 64 then
        setProperty('defaultCamZoom',0.62)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1225
        yy2 = 1000
    end
    if curBeat == 80 then
        setProperty('defaultCamZoom',0.72)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1225
        yy2 = 1000
    end
    if curBeat == 95 then
        setProperty('defaultCamZoom',0.92)
		followchars = true
        xx = 1000
        yy = 900
        xx2 = 1050
        yy2 = 900
    end
    if curBeat == 99 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1000
        yy = 1050
        xx2 = 1450  
        yy2 = 1050
    end
    if curBeat == 196 then
        setProperty('defaultCamZoom',0.62)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1275
        yy2 = 1000
    end
    if curBeat == 229 then
        setProperty('defaultCamZoom',0.72)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1275
        yy2 = 1000
    end
    if curBeat == 276 then
        setProperty('defaultCamZoom',0.62)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1275
        yy2 = 1000
    end
    if curBeat == 292 then
        setProperty('defaultCamZoom',0.77)
		followchars = true
        xx = 1000
        yy = 1050
        xx2 = 1450  
        yy2 = 1050
    end
    if curBeat == 324 then
        setProperty('defaultCamZoom',0.72)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1275
        yy2 = 1000
    end
    if curBeat == 355 then
        setProperty('defaultCamZoom',0.92)
		followchars = true
        xx = 1000
        yy = 900
        xx2 = 1050
        yy2 = 900
    end
    if curBeat == 360 then
        setProperty('defaultCamZoom',0.62)
		followchars = true
        xx = 1225
        yy = 1000
        xx2 = 1275
        yy2 = 1000
    end
    
    
end

