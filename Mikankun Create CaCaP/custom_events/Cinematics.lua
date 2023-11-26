-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

start = 0

finish = 0



function onCreate()
	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', 0, -120)
	makeGraphic('UpperBar', 1280, 120, '000000')
	setProperty('UpperBar.alpha', 0)
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)

	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 720)
	makeGraphic('LowerBar', 1280, 120, '000000')
	setProperty('LowerBar.alpha', 0)
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)
end


function onUpdate()

	if start == 1 then
		if downscroll then
			doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
			doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
			doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
			doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
			doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
			doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
			doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
		else
			doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
			doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
			doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
			doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
			doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
			doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
			doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)	
		end
		doTweenAlpha('AlphaTweenUpper','UpperBar', 1, 0.5, 'Linear')
		doTweenAlpha('AlphaTweenLower','LowerBar', 1, 0.5, 'Linear')
	end

	if finish == 2 then
		if downscroll then
			doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
			doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
			doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
			doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
			doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
			doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
			doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
		else
			doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
			doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
			doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
			doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
			doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
			doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
			doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
		end
		doTweenAlpha('AlphaTweenUpper','UpperBar', 0, 0.5, 'Linear')
		doTweenAlpha('AlphaTweenLower','LowerBar', 0, 0.5, 'Linear')
	end
end

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
	end
end
