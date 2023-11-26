local xPos = {}
local arrowDir = {}
function onSongStart()
    addHaxeLibrary("EKdata", 'backend')
    setProperty('skipArrowStartTween', true)
    for i = 0,getProperty('strumLineNotes.length')-1 do 
        table.insert(xPos, getPropertyFromGroup('strumLineNotes', i, 'x'))
        table.insert(arrowDir, runHaxeCode('return Note.colArray[Note.gfxIndex[EKdata.mania][game.strumLineNotes.members['..i..'].noteData]];'))
    end
end
function onCountdownStarted()
    for i = 0,getProperty('opponentStrums.length')-1 do 
        setPropertyFromGroup('opponentStrums', i, 'x', -3000)
    end
    
end
function onEvent(tag, val1, val2)
    if tag == 'Change Mania' then 

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            local didSetPos = false
            for j = 0,#arrowDir-1 do
                if runHaxeCode('return Note.colArray[Note.gfxIndex[EKdata.mania][game.strumLineNotes.members['..i..'].noteData]];') == arrowDir[j+1] then 
                    setPropertyFromGroup('strumLineNotes', i, 'x', xPos[j+1])
                    --setPropertyFromGroup('opponentStrums', i, 'x', xPos[j+1])
                    didSetPos = true
                end
            end
            if not didSetPos then 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
                --setPropertyFromGroup('playerStrums', i, 'alpha', 0)
                --noteTweenAlpha('p1a'..i, i+getProperty('playerStrums.length'), 1, crochet/250, 'cubeInOut')
                noteTweenAlpha('a'..i, i, 1, crochet/250, 'cubeInOut')
            end
            if i < getProperty('playerStrums.length') then 
                setPropertyFromGroup('strumLineNotes', i, 'x', -3000)
            end
        end


        xPos = {}
        arrowDir = {}
        for i = 0,getProperty('opponentStrums.length')-1 do 
            table.insert(xPos, _G['defaultOpponentStrumX'..i])
            table.insert(arrowDir, runHaxeCode('return Note.colArray[Note.gfxIndex[EKdata.mania][game.opponentStrums.members['..i..'].noteData]];'))
            --noteTweenX('p2'..i, i, _G['defaultOpponentStrumX'..i], crochet/250, 'cubeInOut')
        end
        for i = 0,getProperty('playerStrums.length')-1 do 
            table.insert(xPos, _G['defaultPlayerStrumX'..i])
            table.insert(arrowDir, runHaxeCode('return Note.colArray[Note.gfxIndex[EKdata.mania][game.playerStrums.members['..i..'].noteData]];'))
            noteTweenX('p1'..i, i+getProperty('playerStrums.length'), _G['defaultPlayerStrumX'..i], crochet/250, 'cubeInOut')
        end
    end
end

function onCreatePost()
    runHaxeCode("game.iconP2.changeIcon('ShaggyPlus');")
end