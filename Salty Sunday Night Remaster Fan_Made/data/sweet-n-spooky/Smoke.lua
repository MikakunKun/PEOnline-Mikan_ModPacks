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
	if curStep == 1 then
                RainbowON()
    end
	if curStep == 48 then
		RainbowOFF()
    end
	if curStep == 319 then
                RainbowON()
    end
	if curStep == 383 then
		RainbowOFF()
    end
	if curStep == 608 then
                RainbowON()
    end
	if curStep == 640 then
		RainbowOFF()
    end
	if curStep == 672 then
                RainbowON()
    end
	if curStep == 704 then
		RainbowOFF()
    end
	if curStep == 960 then
                RainbowON()
    end
	if curStep == 992 then
		RainbowOFF()
    end
	if curStep == 1048 then
                RainbowON()
    end
	if curStep == 1056 then
		RainbowOFF()
    end
	if curStep == 1279 then
                RainbowON()
    end
	if curStep == 1311 then
		RainbowOFF()
    end
	if curStep == 1343 then
                RainbowON()
    end
	if curStep == 1375 then
		RainbowOFF()
    end
end


function onTweenCompleted(tag) --it loops the funny colors
	if tag == 'idk3' then doTweenX('idk4', 'clouds2', 0, 1, 'sineInOut') end
	if tag == 'idk4' then doTweenX('idk3', 'clouds2', 50, 2, 'sineInOut') end
end