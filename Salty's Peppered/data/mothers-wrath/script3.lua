--Coding By BlixerTheGamer
--Helped for the code Deleted_Name687

--Script Config Fade
FadeTime = 0.5
FadeEase = 'CircInOut'

function onCreate() 
--No Sound You Idiot
	setProperty('introSoundsSuffix', '-amogusinirl')
--Images Yo

--Two
                    makeLuaSprite('CountTwo', 'ready-warning', 0, 0)
	screenCenter('CountTwo', 'xy')
	setObjectCamera('CountTwo', 'other')
	setProperty('CountTwo.visible', false)
--One
	makeLuaSprite('CountOne', 'set-warning', 0, 0)
	screenCenter('CountOne', 'xy')
	setObjectCamera('CountOne', 'other')
	setProperty('CountOne.visible', false)
--Go	
	makeLuaSprite('CountGO', 'go-warning', 0, 0)
	screenCenter('CountGO', 'xy')
	setObjectCamera('CountGO', 'other')
	setProperty('CountGO.visible', false)
--Add Lua Sprites
	addLuaSprite('CountTwo', true)
	addLuaSprite('CountOne', true)
	addLuaSprite('CountGO', true)
end

--Countdown Time

function onCountdownTick(counter)
	if counter == 0 then
		playSound('intro3')
	elseif counter == 1 then
		setProperty('CountTwo.visible', true)
		doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
		setProperty('countdownReady.visible', false)
		playSound('2-warning')	
	elseif counter == 2 then
                                        setProperty('CountOne.visible', true)
		doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
		setProperty('countdownSet.visible', false)
		playSound('1-warning')
	elseif counter == 3 then
		setProperty('CountGO.visible', true)
		doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
		setProperty('countdownGo.visible', false)
		playSound('go-warning')
	end
end

--Amogus