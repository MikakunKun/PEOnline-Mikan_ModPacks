local defaultNotePos = {};
local confusion = 1;
local allowCountdown = false;
local enter = false;


function onCreate()
	setPropertyFromClass('states.GameOverSubstate', 'characterName', 'patirisu-bf');
	setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');

	makeLuaSprite('fade', 'Black Screen', -360, -180);
	addLuaSprite('fade', true);
	setScrollFactor('fade', 0, 0);
end





function onUpdate(elapsed)

    songPos = getPropertyFromClass('backend.Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 230)

	if curStep == 1 then

		runTimer('fadestart', 2);

		for i = 0,7 do 
			x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
			y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
			table.insert(defaultNotePos, {x,y})
    		end
	end


    for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + (math.sin((currentBeat+i*2.5)) * confusion * 5))
    end

end



function goodNoteHit(id, noteData, noteType, isSustainNote)

	if confusion > 1 then
		confusion = confusion - 0.2
	end
end



function noteMiss(id, noteData, noteType, isSustainNote)

	if noteType == 'Confusion Note' then
		confusion = confusion + 5
	end
end



function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'fadestart' then
		doTweenAlpha('fadeaway', 'fade', 0, 8, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'fadeaway' then
		removeLuaSprite('fade', true);
	end
end