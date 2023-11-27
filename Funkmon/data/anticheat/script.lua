local defaultNotePos = {};
local shake = 1;
local randomnumber = 0;
local camera = 0;

local onlineOwner=false

function onCreate()
    onlineOwner=not runHaxeCode('return PlayState.playsAsBF();')

	setPropertyFromClass('states.GameOverSubstate', 'characterName', 'patirisu-bf');
	setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');

end



function onUpdate(elapsed)
    songPos = getPropertyFromClass('backend.Conductor', 'songPosition');
    currentBeat = (songPos / 300) * (bpm / 184)
	if curStep == 16 then
		for i = 0,7 do 
			x = getPropertyFromGroup('strumLineNotes', i, 'x')
			y = getPropertyFromGroup('strumLineNotes', i, 'y')
			table.insert(defaultNotePos, {x,y})
    		end
	end

    if curStep == 248 or curStep == 152 or curStep == 168 or curStep == 184 or curStep == 200 or curStep == 216 or curStep == 232 or curStep == 1184 or curStep >= 268 and curStep <= 273 then
	shake = 30
    end

    if curStep == 249 or curStep == 153 or curStep == 169 or curStep == 185 or curStep == 201 or curStep == 217 or curStep == 233 or curStep == 274 or curStep == 1185 then
	shake = 15
    end

    if curStep == 250 or curStep == 154 or curStep == 170 or curStep == 186 or curStep == 202 or curStep == 218 or curStep == 234 then
	shake = 1
    end

    if curStep == 800 or curStep == 864 or curStep == 928 or curStep == 992 or curStep == 1056 or curStep == 1120 then
	setProperty("camHUD.angle", 180)
    if (onlineOwner==true) then
        noteTweenX("Note7", 0, 760, 0.5, "quartout")
        noteTweenX("Note4", 1, 640, 0.5, "quartout")
        noteTweenX("Note5", 2, 520, 0.5, "quartout")
        noteTweenX("Note6", 3, 400, 0.5, "quartout")
    else
        noteTweenX("Note5", 6, 520, 0.5, "quartout")
        noteTweenX("Note7", 4, 760, 0.5, "quartout")
        noteTweenX("Note6", 7, 400, 0.5, "quartout")
        noteTweenX("Note4", 5, 640, 0.5, "quartout")
    end
    end

    if curStep == 832 or curStep == 896 or curStep == 960 or curStep == 1024 or curStep == 1088 or curStep == 1152 or curStep == 1440 then
	setProperty("camHUD.angle", 0)
    if (onlineOwner==true) then
        noteTweenX("Note7", 0, 400, 0.5, "quartout")
        noteTweenX("Note4", 1, 520, 0.5, "quartout")
        noteTweenX("Note5", 2, 640, 0.5, "quartout")
        noteTweenX("Note6", 3, 760, 0.5, "quartout")
    else
        noteTweenX("Note5", 6, 640, 0.5, "quartout")
        noteTweenX("Note7", 4, 400, 0.5, "quartout")
        noteTweenX("Note6", 7, 760, 0.5, "quartout")
        noteTweenX("Note4", 5, 520, 0.5, "quartout")
    end
    end


    if curStep == 528 then
        if (onlineOwner==true) then
            noteTweenX("Note7", 0, 400, 0.5, "quartout")
            noteTweenX("Note4", 1, 520, 0.5, "quartout")
            noteTweenX("Note5", 2, 640, 0.5, "quartout")
            noteTweenX("Note6", 3, 760, 0.5, "quartout")
        else
            noteTweenX("Note5", 6, 640, 0.5, "quartout")
            noteTweenX("Note7", 4, 400, 0.5, "quartout")
            noteTweenX("Note6", 7, 760, 0.5, "quartout")
            noteTweenX("Note4", 5, 520, 0.5, "quartout")
        end
    end

    local min=4
    local max=7
    if (onlineOwner==true) then
        min=0
        max=3
    end
    if curStep >= 16 and curStep <= 272 or curStep >= 532 and curStep <= 784 or curStep >= 1444 then
        for i = min,max do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
        end 
end

    if curStep >= 272 and curStep <= 528 then
        for i = min,max do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi) + (math.sin((currentBeat+i/5)/4) * 250))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi) + (math.sin((currentBeat+i/5)) * 20))
        end                                                                                                             
end                                                           

    if curStep >= 1184 and curStep <= 1440 then
        for i = min,max do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi) + (math.sin((currentBeat+i/5)/4) * 250))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi) + (math.sin((currentBeat+i/5)) * 20))
            setProperty("camHUD.angle", math.sin(currentBeat/5)*10)
        end                                                                                                             
end        
                                                   
    if curStep == 275 or curStep == 1440 then
	shake = 2
	setProperty("camHUD.angle", 0)
    end
end
