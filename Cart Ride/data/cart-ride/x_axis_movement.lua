local power = 950
local speedsave = 0
local speedcount = true       
local warning = 0
local botplaycheck = true
local movebf = true
local bfposxsave = 0
local bfpostrigger = true
local coolmechanic = true      -- Put value to false if you want to turn off the cartride mechanic

function onCreate()
    makeLuaText('speed','Speed: ' .. speedsave,999, 555 ,89)
    addLuaText('speed')
    setTextSize('speed',30)
    setTextAlignment('speed','middle')
	setProperty('speed.alpha', 0)

	makeLuaText('Warning','Dont let your speed go under 20.' ,999, 200 ,350)
	addLuaText('Warning')
	setTextSize('Warning',50)
	setTextAlignment('Warning','middle')
	setTextColor('Warning', 'B80025')
	setProperty('Warning.alpha', 0)
end

function onCreatePost()
		doTweenX('NubCartX', 'dad', 430, 1.2, 'cubeOut')
	function onUpdate()
		if coolmechanic == true then
			if botplaycheck == true then
				if botPlay then
					setProperty('speed.alpha', 0)
					speedcount = false
				else
					setProperty('speed.alpha', 1)
					speedcount = true
				end
			else
			end
		end

		if bfpostrigger == true then
			bfposxsave = getProperty('boyfriend.x')
		elseif bfpostrigger == false then
			bfposxsave = bfposxsave
		end

		if movebf == false then
			setpProperty('boyfriend.x', getProperty('boyfriend.x'))
		elseif movebf == true then
			doTweenX('BfCartX', 'boyfriend', power, 0.5, 'quadOut')
		end

		if coolmechanic == true then
			if power >= 1700 then
				setProperty('health', -100);
			end
	
			if power <= -573 then
				power = -573
			end

			if speedcount == true then
				if power >= 1700 then
					setProperty('health', -100);
				end
		
				if power <= -573 then
					power = -573
				end
	
				setProperty('speed.alpha', 1)
				setTextString('speed','Speed: ' .. speedsave)
				if getProperty('boyfriend.x') >= 1700  then
					setTextString('Count', 'Death')
	
				elseif getProperty('boyfriend.x') <= 1700 and getProperty('boyfriend.x') > 1626.7 then
					speedsave = 20
				elseif getProperty('boyfriend.x') <= 1626.7 and getProperty('boyfriend.x') > 1553.4	then
					speedsave = 21
	
				elseif getProperty('boyfriend.x') <= 1553.4 and getProperty('boyfriend.x') > 1480.1	then
					speedsave = 22
	
				elseif getProperty('boyfriend.x') <= 1480.1 and getProperty('boyfriend.x') > 1406.8	then
					speedsave = 23
					
				elseif getProperty('boyfriend.x') <= 1406.8 and getProperty('boyfriend.x') > 1333.5	then
					speedsave = 24
									
				elseif getProperty('boyfriend.x') <= 1333.5 and getProperty('boyfriend.x') > 1260.2	then
					speedsave = 25
													
				elseif getProperty('boyfriend.x') <= 1260.2 and getProperty('boyfriend.x') > 1186.9	then
					speedsave = 26
													
				elseif getProperty('boyfriend.x') <= 1186.9 and getProperty('boyfriend.x') > 1113.6	then
					speedsave = 27
													
				elseif getProperty('boyfriend.x') <= 1113.6 and getProperty('boyfriend.x') > 1040.3	then
					speedsave = 28
								
				elseif getProperty('boyfriend.x') <= 1040.3 and getProperty('boyfriend.x') > 967 then
					speedsave = 29
									
				elseif getProperty('boyfriend.x') <= 967 and getProperty('boyfriend.x') > 893.7	then
					speedsave = 30
	
				elseif getProperty('boyfriend.x') <= 893.7 and getProperty('boyfriend.x') > 820.4 then
					speedsave = 31
	
				elseif getProperty('boyfriend.x') <= 820.4 and getProperty('boyfriend.x') > 747.1	then
					speedsave = 32
	
				elseif getProperty('boyfriend.x') <= 747.1 and getProperty('boyfriend.x') > 673.8	then
					speedsave = 33
	
				elseif getProperty('boyfriend.x') <= 673.8 and getProperty('boyfriend.x') > 600.5	then
					speedsave = 34
					
				elseif getProperty('boyfriend.x') <= 600.5 and getProperty('boyfriend.x') > 527.2	then
					speedsave = 35
									
				elseif getProperty('boyfriend.x') <= 527.2 and getProperty('boyfriend.x') > 453.9	then
					speedsave = 36
													
				elseif getProperty('boyfriend.x') <= 453.9 and getProperty('boyfriend.x') > 380.6	then
					speedsave = 37
													
				elseif getProperty('boyfriend.x') <= 380.6 and getProperty('boyfriend.x') > 307.3	then
					speedsave = 38
													
				elseif getProperty('boyfriend.x') <= 307.3 and getProperty('boyfriend.x') > 234	then
					speedsave = 39
								
				elseif getProperty('boyfriend.x') <= 234 and getProperty('boyfriend.x') > 160.7 then
					speedsave = 40
									
				elseif getProperty('boyfriend.x') <= 160.7 and getProperty('boyfriend.x') > 87.4	then
					speedsave = 41
	
				elseif getProperty('boyfriend.x') <= 87.4 and getProperty('boyfriend.x') > 14.1	then
					speedsave = 42
	
				elseif getProperty('boyfriend.x') <= 14.1 and getProperty('boyfriend.x') > -59.2 then
					speedsave = 43
	
				elseif getProperty('boyfriend.x') <= -59.2 and getProperty('boyfriend.x') > -132.5	then
					speedsave = 44
	
				elseif getProperty('boyfriend.x') <= -132.5 and getProperty('boyfriend.x') > -205.8	then
					speedsave = 45
	
				elseif getProperty('boyfriend.x') <= -205.8 and getProperty('boyfriend.x') > -279.1	then
					speedsave = 46
					
				elseif getProperty('boyfriend.x') <= -279.1 and getProperty('boyfriend.x') > -352.4	then
					speedsave = 47
									
				elseif getProperty('boyfriend.x') <= -352.4 and getProperty('boyfriend.x') > -425.7	then
					speedsave = 48
													
				elseif getProperty('boyfriend.x') <= -425.7 and getProperty('boyfriend.x') > -499	then
					speedsave = 49
													
				elseif getProperty('boyfriend.x') <= -499 and getProperty('boyfriend.x') > -572.4	then
					speedsave = 50
				end
			end
		end
		function onTimerCompleted(tag)
            if tag == 'WarningThing' then
                doTweenAlpha('WarningAlpha', 'Warning', 0, 1, 'quadOut')
            end
        end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if coolmechanic == true then
		if speedcount == true then
			if getPropertyFromGroup('notes', id, 'rating') == 'sick' and direction == 0 then
				power = power - 20
			elseif getPropertyFromGroup('notes', id, 'rating') == 'sick' and direction == 1 then
				power = power - 20
			elseif getPropertyFromGroup('notes', id, 'rating') == 'sick' and direction == 2 then
				power = power - 20
			elseif getPropertyFromGroup('notes', id, 'rating') == 'sick' and direction == 3 then
				power = power - 20
			elseif getPropertyFromGroup('notes', id, 'rating') == 'good' and direction == 0 then
				power = power - 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'good' and direction == 1 then
				power = power - 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'good' and direction == 2 then
				power = power - 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'good' and direction == 3 then
				power = power - 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'bad' and direction == 0 then
				power = power - 5
			elseif getPropertyFromGroup('notes', id, 'rating') == 'bad' and direction == 1 then
				power = power - 5
			elseif getPropertyFromGroup('notes', id, 'rating') == 'bad' and direction == 2 then
				power = power - 5
			elseif getPropertyFromGroup('notes', id, 'rating') == 'bad' and direction == 3 then
				power = power - 5
			elseif getPropertyFromGroup('notes', id, 'rating') == 'shit' and direction == 0 then
				power = power + 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'shit' and direction == 1 then
				power = power + 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'shit' and direction == 2 then
				power = power + 15
			elseif getPropertyFromGroup('notes', id, 'rating') == 'shit' and direction == 3 then
				power = power + 15
			end
		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if coolmechanic == true then
		if speedcount == true then
			power = power + 50
		end
	end
end

function onStepHit()
	if coolmechanic == true then
		if speedcount == true then
			if curStep % 2 == 1 then
				power = power + 8.7
			end
		end
	end
end

function onBeatHit()
	if curBeat == 364 then
		if speedsave >= 45 then
			runTimer('AchievementWait2', 3, 1)
			setProperty('Achievements2.alpha', 1)
			playSound('confirmMenu')
			gotachievement = true
		end
	end

	if curBeat == 232 then
		setProperty('speed.alpha', 0)
		bfpostrigger = false
		movebf = false
		botplaycheck = false
		speedcount = false
	end

	if curBeat == 360 then
		setProperty('boyfriend.x', bfposxsave)
		movebf = true
		botplaycheck = true
		speedcount = true
	end
end

function onSongStart()
	if coolmechanic == true then
		if speedcount == true then
			if warning == 0 then
				setProperty('Warning.alpha', 1)
				runTimer('WarningThing', 1, 1)
				warning = 1
			end
		end	
	end	
end

