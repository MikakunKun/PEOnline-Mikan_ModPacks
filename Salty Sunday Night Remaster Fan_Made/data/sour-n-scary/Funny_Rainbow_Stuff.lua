function onCreate()
	
	makeLuaSprite('lights1', 'Blue', 0, -500);
	setObjectCamera('lights1', 'camHud')


	makeLuaSprite('lights2', 'Purple', 0, -600);
	setObjectCamera('lights2', 'camHud')

	addLuaSprite('lights1', false);
	addLuaSprite('lights2', false);
end

function onStartCountdown()
	setProperty('lights1.alpha', 0)
	setProperty('lights2.alpha', 0)
	doTweenY('zefunk1', 'lights1', 0, 4, 'sineInOut')
	doTweenY('zefunk3', 'lights2', 0, 2, 'sineInOut')
end	
function RainbowON() --turns on the funny rainbow stuff
	setProperty('lights1.alpha', 0.7)
	setProperty('lights2.alpha', 0.7)
end

function RainbowOFF() --turns it off
	setProperty('lights1.alpha', 0)
	setProperty('lights2.alpha', 0)
end

function onStepHit()
	if curStep == 191 then
                RainbowON()
    end
	if curStep == 255 then
		RainbowOFF()
    end
	if curStep == 768 then
                RainbowON()
    end
	if curStep == 1023 then
		RainbowOFF()
    end
end


function onTweenCompleted(tag) --it loops the funny colors
	if tag == 'zefunk1' then doTweenY('zefunk2', 'lights1', -500, 4, 'sineInOut') end
	if tag == 'zefunk2' then doTweenY('zefunk1', 'lights1', 0, 4, 'sineInOut') end
	if tag == 'zefunk3' then doTweenY('zefunk4', 'lights2', -600, 2, 'sineInOut') end
	if tag == 'zefunk4' then doTweenY('zefunk3', 'lights2', 0, 2, 'sineInOut') end
end