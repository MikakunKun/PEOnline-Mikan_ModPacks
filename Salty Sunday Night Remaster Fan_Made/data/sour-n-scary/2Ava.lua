characterPath = 'characters/Ava' -- Picture File name of spreadsheet (must have .xml)
characterTag = 'ava' -- Set this to what the sprite should be named.

noteNames = {
    'ava', -- Change this to whatever your note is named in path "custom_notetypes".
    --'3rd Player ALT', -- Change this to whatever your note is named in path "custom_notetypes". (ALT)
}

isDanceIdle = false -- If false, character sprite will use animation 'danceLeft' and 'danceRight'
flipX = false -- If true, flips character.
objectOrder = 9 -- Normally, values over 7 go over GF (7), Dad (8) and BF (9). (Default: 9)
haveMissAnimations = false -- If true, it will add the miss animations for the character sprite to use.
singAnimationLength = 4.5 -- How many steps until it goes back to idle.
danceEveryNumBeats = 2 -- Sets which per beat will the character dance on.
gfSpeed = 1 -- How many beats until danceLeft and danceRight dances. (If isDanceIdle is false.)
characterFPS = 24 -- Default is 24, how many frames should the animation play?
skipDance = false -- If true, it skips (stops) the dance on beat for the sprite.

extraSection = false -- If true, camera will point to what is put in characterCamera offset positions.
teamplay = false -- If true, the extra character will sing along with the main character(s).
animSuffix = '-ava' -- If this variable is set as '-alt', it will play alt animations. (Animation suffixes)

antialiasing = true -- If true, it will use antialiasing for the sprite which makes it more detailed.

idleSuffix = '' -- Change this to either have alternative idle animations if you have them added in the animations list.
heyTimer = 0 -- How long should an animation last for. (specialAnim must be true for it to work!)
specialAnim = false -- Is the animation different from the other animations? (Special)

--[[ Animation Data EXPLANATION

['idle'] = Animation name
{'ava idle'} = Animation Prefix
{0, 0} = Animation Offset X and Y
{''} = Animation Indices (0, 1, 2, 3)
{false/true} = Looping?

--]]
animationData = {
    ['idle'] = {'ava idle', 0, 0, '', false},
    ['singLEFT'] = {'ava left', 0, 0, '', false},
    ['singDOWN'] = {'ava down', 0, 0, '', false},
    ['singUP'] = {'ava up', 0, 0, '', false},
    ['singRIGHT'] = {'ava right', 0, 0, '', false},

    ['danceLeft'] = {'ava dance left', 0, 0, '0, 1, 1, 2, 3, 3, 4, 5, 5, 6', false},
    ['danceRight'] = {'ava dance right', 0, 0, '0, 1, 1, 2, 3, 3, 4, 5, 5, 6', false},
    ['danceLeft-ava'] = {'ava dance left', 0, 0, '0, 1, 1, 2, 3, 3, 4, 5, 5, 6', false},
    ['danceRight-ava'] = {'ava dance right', 0, 0, '0, 1, 1, 2, 3, 3, 4, 5, 5, 6', false},
}

singAnimations = {
    'singLEFT', -- Left
    'singDOWN', -- Down
    'singUP', -- Up
    'singRIGHT' -- Right
}

characterPos = {
    300, -- X of character
    50 -- Y of character
}

characterCamera = {
    0, -- X (Offset) for the camera to be targetting when it is extra character's turn.
    0 -- Y (Offset) for the camera to be targetting when it is extra character's turn.
}

characterScales = {
    0.7, -- Scale X of character
    0.7 -- Scale Y of character
}

local noteFileCreation = false -- Creates note files incase note files for the character doesn't exist. (Enable if you don't know how to literally create files!)
local eventFileCreation = false -- Creates event files incase event files for the character doesn't exist. (Enable if you don't know how to literally create files!)

local wentIntoChart = false -- A bool if the user has went into chart editor.
function createCharacter(tag)
    characterName = tag

    for notes = 1, #noteNames do
        if not checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and noteFileCreation then
            saveFile(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        elseif not checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and noteFileCreation then
            saveFile('/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        end
    end

    if not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Camera Section' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile(currentModDirectory .. '/custom_events/' .. tag .. ' Camera Section' .. '.txt', 'Disable/Enable camera section for ' .. tag .. '\n\nValue 1: Enable camera section for ' .. tag .. '\n[0 or 1 = False/True]\n\n(Works when camera moves/next section is hit!)')
    elseif not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Camera Section' .. '.txt') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile('/custom_events/' .. tag .. ' Camera Section' .. '.txt', 'Disable/Enable camera section for ' .. tag .. '\n\nValue 1: Enable camera section for ' .. tag .. '\n[0 or 1 = False/True]\n\n(Works when camera moves/next section is hit!)')
    end

    if not checkFileExists(currentModDirectory .. '/custom_events/' .. 'Extr. Teamplay' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile(currentModDirectory .. '/custom_events/' .. 'Extr. Teamplay' .. '.txt', 'Enable/Disable teamplay.\nLets extra character sing with main character(s).\n\nValue 1: Enable/Disable teamplay.\n[0 or 1 = False/True]')
    elseif not checkFileExists(currentModDirectory .. '/custom_events/' .. 'Extr. Teamplay' .. '.txt') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile('/custom_events/' .. 'Extr. Teamplay' .. '.txt', 'Enable/Disable teamplay.\nLets extra character sing with main character(s).\n\nValue 1: Enable/Disable teamplay.\n[0 or 1 = False/True]')
    end

    if not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and eventFileCreation then
        saveFile(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt', 'Changes idle animation to the alt idle animation.\n\nValue 1: Suffix for idle alt animation.')
    elseif not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and eventFileCreation then
        saveFile('/custom_events/' .. tag .. ' Idle ALT' .. '.txt', 'Changes idle animation to the alt idle animation.\n\nValue 1: Suffix for idle alt animation.')
    end

    makeAnimatedLuaSprite(tag, characterPath, characterPos[1], characterPos[2]);

    for i, v in pairs(animationData) do
        if stringTrim(v[4]) == '' or not v[4] then
            addAnimationByPrefix(tag, i, v[1], characterFPS, v[5]);
        elseif v[4] and not v[5] then -- else'em
            addAnimationByIndices(tag, i, v[1], v[4], characterFPS);
        elseif v[4] and v[5] then -- else'em
            addAnimationByIndicesLoop(tag, i, v[1], v[4], characterFPS);
        end

        addOffset(tag, i, v[2], v[3]);
    end

    setProperty(tag .. '.flipX', flipX);
    setProperty(tag .. '.antialiasing', antialiasing)
    scaleObject(tag, characterScales[1], characterScales[2]);

    setObjectOrder(tag, objectOrder);

    addLuaSprite(tag, false); -- Set this to true if you want it to be in front of other sprites. (You can also use object order to set where the sprite should overlap.)

    dance() -- Fix character playing a random animation & offset on character creation.
end

function onCreate()
    luaDebugMode = true

    createCharacter(characterTag);
end

function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    for names = 1, #noteNames do
        if noteType == noteNames[names] then
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noAnimation', true); -- Make it so original character doesn't sing these notes
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noMissAnimation', true); -- Make it so original character doesn't miss
        end
    end
end

holdTimer = 0 -- For onUpdate.

local danced = false -- Has the character danced for GF? (Works a bit differently than in Psych Engine?)

function onBeatHit()
    if isDanceIdle then
        if curBeat % danceEveryNumBeats == 0 and not skipDance and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
            dance()
            --holdTimer = 0
        end

    elseif not isDanceIdle then -- I did this differently than in Psych Engine. However, this works!
        if danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0

        elseif not danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0
        end
    end
end

function onUpdate(elapsed)
    if stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
        holdTimer = holdTimer + elapsed
    end

    if flipX then 
        if holdTimer >= getPropertyFromClass('Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength then
            dance()
            holdTimer = 0
        end

    else
        if holdTimer > getPropertyFromClass('Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength and stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') and not stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') then
            dance()
        end
    end

    if stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') and getProperty(characterName .. '.animation.curAnim.finished') then
        playAnim(characterName, 'idle' .. idleSuffix, true, false, 10)
    end

    if getProperty(characterName .. '.animation.curAnim.finished') and stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), '-loop') then
        playAnim(characterName, getProperty(characterName .. '.animation.curAnim.name') .. '-loop')
    end

    if specialAnim and heyTimer <= 0 and getProperty(characterName .. '.animation.curAnim.name') == 'hey' or getProperty(characterName .. '.animation.curAnim.name') == 'cheer' then -- Automatically set 'heyTimer' to 0.6 if it plays one of these animations with specialAnim on. (Do I do this?)
        heyTimer = 0.6
    end

    if heyTimer > 0 then
        heyTimer = heyTimer - elapsed * playbackRate
        if heyTimer <= 0 then
            if specialAnim and getProperty(characterName .. '.animation.curAnim.name') == 'hey' or getProperty(characterName .. '.animation.curAnim.name') == 'cheer' then
                specialAnim = false
                dance()
            end
            heyTimer = 0
        end
    elseif specialAnim and getProperty(characterName .. '.animation.curAnim.finished') then
        specialAnim = false
        dance()
    end

    --// Unrelated animation character stuff //--
    if keyboardJustPressed('SEVEN') and not wentIntoChart then
        wentIntoChart = true
    end
    --//
end

function onMoveCamera(character)
    if extraSection then
        setProperty('camFollow.x', getMidpointX(characterName) - 100 - characterCamera[1])
        setProperty('camFollow.y', getMidpointY(characterName) - 100 + characterCamera[2])
    end
end

function onCountdownStarted()
    runTimer('startCharacterTimer', getPropertyFromClass('Conductor', 'crochet') / 1000 / playbackRate, 5) -- lol (will a loop of 5 be an issue?)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote) 
    if noteType == table.contains(noteNames, 'ava') then
        animSuffix = ''
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0

    elseif noteType == table.contains(noteNames, 'ava') and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?
        animSuffix = ''

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    if noteType == table.endsWith(noteNames, 'ALT') then
        animSuffix = '-alt'
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif noteType == table.endsWith(noteNames, 'ALT') and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!!
        if noteType == noteNames[extraNotes] then
            animSuffix = ''
                        
            if noteNames[extraNotes]:find('-') then
                playAnim(characterName, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
                specialAnim = true
            else
                playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            end

            holdTimer = 0
        end
    end

    --Sort this better?
    if teamplay then
        if noteType == 'ava' then -- Default Note (lol)
            animSuffix = ''
            playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

            if not isDanceIdle then
                animSuffix = ''
                if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                    danced = true
                elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                    danced = false
                end
            end

            if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        elseif noteType == 'Alt Animation' then
            animSuffix = '-alt'
            playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

            if not isDanceIdle then
                animSuffix = '-alt'
                if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                    danced = true
                elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                    danced = false
                end
            end

            if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        end
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType == table.contains(noteNames, 'ava') then
        animSuffix = ''
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0

    elseif noteType == table.contains(noteNames, 'ava') and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?
        animSuffix = ''

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    if noteType == table.endsWith(noteNames, 'ALT') then
        animSuffix = '-alt'
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif noteType == table.endsWith(noteNames, 'ALT') and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            danced = not danced
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!!
        if noteType == noteNames[extraNotes] then
            animSuffix = ''

            if noteNames[extraNotes]:find('-') then
                playAnim(characterName, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
                specialAnim = true
            else
                playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            end

            holdTimer = 0
        end
    end

    --Sort this better?
    if teamplay then
        if noteType == '' then -- Default Note (lol)
            animSuffix = ''
            playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

            if not isDanceIdle then
                animSuffix = ''
                if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                    danced = true
                elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                    danced = false
                end
            end

            if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        elseif noteType == 'Alt Animation' then
            animSuffix = '-alt'
            playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
            holdTimer = 0

            if not isDanceIdle then
                animSuffix = '-alt'
                if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
                    danced = true
                elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
                    danced = false
                end
            end

            if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
                danced = not danced
            end
        end
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == noteNames[1] and haveMissAnimations then
        playAnim(characterName, singAnimations[noteData + 1] .. 'miss' .. animSuffix, true)
        --recalculateDanceIdle()
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startCharacterTimer' then
        if isDanceIdle and luaSpriteExists(characterName) and loopsLeft % danceEveryNumBeats == 0 and getProperty(characterName .. '.animation.curAnim') and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
            dance()

        elseif not isDanceIdle and luaSpriteExists(characterName) and loopsLeft % gfSpeed == 0 and getProperty(characterName .. '.animation.curAnim') and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- gfSpeed and not round(gfSpeed * danceEveryNumBeats)? lol
            dance()
        end
    end
end

function onEvent(eventName, value1, value2)
    if eventName == characterName .. ' Idle ALT' or stringEndsWith(eventName, ' Idle ALT') then
        if value1 then
            idleSuffix = value1
        else
            idleSuffix = ''
        end
    end

    if eventName == characterName .. ' Camera Section' or stringEndsWith(eventName, ' Camera Section') then
        if value1 == '1' then
            extraSection = true
        elseif value1 == '0' then
            extraSection = false
        end
    end

    if stringEndsWith(eventName, ' Teamplay') then --Rethink name check?
        if value1 == '1' then
            teamplay = true
        elseif value1 == '0' then
            teamplay = false
        end
    end

    if eventName == 'Play Animation' then -- is issue? idk
        if value1 and value2 then
            playAnim(value2, value1, true) -- This won't check if the animation is a sing note. (because idk lol i could make it check)
            specialAnim = true
        end
    end
end

function eventEarlyTrigger(event)
    if stringEndsWith(event, ' Teamplay') then -- Should work properly? (seems to be needed since it doesn't work on the same step with notes.)
        return 10
    end
end

function onDestroy()
    if not wentIntoChart then
        for notes = 3, #noteNames do -- Seperate main and ALT files.
            if checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
                deleteFile(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua')
            elseif checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
                deleteFile('/custom_notetypes/' .. noteNames[notes] .. '.lua')
            end
        end

        if checkFileExists(currentModDirectory .. '/custom_events/' .. characterName .. ' Camera Section' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile(currentModDirectory .. '/custom_events/' .. characterName .. ' Camera Section' .. '.txt')
        elseif checkFileExists('/custom_events/' .. characterName .. ' Camera Section' .. '.txt') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile('/custom_events/' .. characterName .. ' Camera Section' .. '.txt')
        end

        if checkFileExists(currentModDirectory .. '/custom_events/' .. 'Extr. Teamplay' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile(currentModDirectory .. '/custom_events/' .. 'Extr. Teamplay' .. '.txt')
        elseif checkFileExists('/custom_events/' .. 'Extr. Teamplay' .. '.txt') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile('/custom_events/' .. 'Extr. Teamplay' .. '.txt')
        end

        if checkFileExists(currentModDirectory .. '/custom_events/' .. characterName .. ' Idle ALT' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile(currentModDirectory .. '/custom_events/' .. characterName .. ' Idle ALT' .. '.txt')
        elseif checkFileExists('/custom_events/' .. characterName .. ' Idle ALT' .. '.txt') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile('/custom_events/' .. characterName .. ' Idle ALT' .. '.txt')
        end
    end
end

local settingCharacterUp = true
function recalculateDanceIdle() -- Does settingCharacterUp & lastDance variable be needed for this? (Psych Engine does this but it seems to be fine without it? I don't know.)
    local lastDanceIdle = isDanceIdle
    isDanceIdle = (getProperty(characterName .. '.animation.curAnim.name') == 'danceLeft' .. idleSuffix and getProperty(characterName .. '.animation.curAnim.name') == 'danceRight' .. idleSuffix)

    if settingCharacterUp then
        danceEveryNumBeats = (isDanceIdle == 1 and 1 or 2) -- isDanceIdle == 1 or 2?
    elseif not lastDanceIdle == isDanceIdle then
        local danceEveryNumBeatsCalc = danceEveryNumBeats

        if not isDanceIdle then
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc / 2
        else
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc * 2
    
            danceEveryNumBeats = round(math.max(danceEveryNumBeatsCalc, 1)) 
            --debugPrint('Round handled: ' .. danceEveryNumBeats)
        end
        settingCharacterUp = false
    end
end

function dance()
    if not skipDance and not specialAnim then
        if not isDanceIdle then

            danced = not danced

            if danced then -- no stepCrochet?
                playAnim(characterName, 'danceRight' .. idleSuffix, true);
                holdTimer = 0
    
            elseif not danced then -- no stepCrochet?
                playAnim(characterName, 'danceLeft' .. idleSuffix, true);
                holdTimer = 0
            end

        elseif isDanceIdle then
            playAnim(characterName, 'idle' .. idleSuffix, false);
        end
    end
end

-- http://lua-users.org/wiki/SimpleRound -- Second code.
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function table.contains(tbl, key)
    for i, v in ipairs(tbl) do
        if v == key then
            return v
        end
    end
    return nil
end

function table.endsWith(tbl, key)
    for i, v in ipairs(tbl) do
        if stringEndsWith(v, key) then
            return v
        end
    end
    return nil
end

function setCharacterVar(variable, input)
    _G[variable] = input
end

function getCharacterVar(variable)
    return _G[variable]
end

--[[ 
    Highest is first priority!
    TODOS: 
        
--]]
