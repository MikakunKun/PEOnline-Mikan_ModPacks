function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'attack' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'attack' then
		if difficulty == 2 then
			playSound('attack', 2.5);-----------put your custom sound here
		end
		characterPlayAnim('dad', 'singDOWN' , true);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.1)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'attack' and difficulty == 2 then
		setProperty('health', -0.4);
		playSound('attack', 2.5); -----------put your custom sound here
	elseif noteType == 'attack' and difficulty == 1 then
		setProperty('health', getProperty('health')-0.4);
		playSound('attack', 2.5);-----------put your custom sound here
		characterPlayAnim('boyfriend', 'hurt', true);
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end