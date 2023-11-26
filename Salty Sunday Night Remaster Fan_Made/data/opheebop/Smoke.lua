function onCreate()
	
	makeLuaSprite('black1', 'black-screen', 0, 0);
	setObjectCamera('black1', 'camHud')


	makeLuaSprite('clouds2', 'smoke', 900, 350);
	setObjectCamera('clouds2', 'camHud')

	addLuaSprite('black1', false);
	addLuaSprite('clouds2', false);
end

function onStartCountdown()
	setProperty('clouds2.alpha', 0)
	doTweenX('idk3', 'clouds2', 1000, -500, 'sineInOut')
end	
function RainbowON() --turns on the funny rainbow stuff
	setProperty('black1.alpha', 0.7)
	setProperty('clouds2.alpha', 0.7)
end

function RainbowOFF() --turns it off
	setProperty('black1.alpha', 0)
	setProperty('clouds2.alpha', 0)
end

function onStepHit()
	if curStep == 127 then
                RainbowON()
    end
	if curStep == 127 then
		RainbowOFF()
    end
	if curStep == 640 then
                RainbowON()
    end
	if curStep == 896 then
		RainbowOFF()
    end
	if curStep == 928 then
                RainbowON()
    end
	if curStep == 1247 then
		RainbowOFF()
    end
end


function onTweenCompleted(tag) --it loops the funny colors
	if tag == 'idk3' then doTweenX('idk4', 'clouds2', 0, 1, 'sineInOut') end
	if tag == 'idk4' then doTweenX('idk3', 'clouds2', 50, 2, 'sineInOut') end
end