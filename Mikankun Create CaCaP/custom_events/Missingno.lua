local scaleX = {}
local scaleY = {}
local onlineOwner=false

function onStartCountdown()
    return Function_Continue
end

function onCountdownStarted()
    onlineOwner=not runHaxeCode('return PlayState.playsAsBF();')
    for i = 0, 3 do
        table.insert(scaleX,getProGroup('playerStrums',i,'scale.x'))
        table.insert(scaleY,getProGroup('playerStrums',i,'scale.y'))
    end
end

function onEvent(eventName, value1, value2)
    if eventName == 'Missingno' then
        missingno()
    end
end

function onUpdatePost(elapsed)
    for i = 0,getProperty('notes.length')-1 do
        local strum = 'opponentStrums'
        if getProGroup('notes',i,'mustPress') then strum = 'playerStrums' end
        local noteData = getProGroup('notes', i, 'noteData')
        if getProGroup('notes',i,'isSustainNote') then
            setProGroup('notes', i, 'flipY', getProGroup(strum, noteData, 'downScroll'))
        else
            setProGroup('notes', i, 'scale.y', getProGroup(strum, noteData, 'scale.y'))
        end
        setProGroup('notes', i, 'scale.x', getProGroup(strum, noteData, 'scale.x'))
    end
end

function getProGroup(data,i,string)
    return getPropertyFromGroup(data,i,string)
end

function setProGroup(data,i,string,value)
    return setPropertyFromGroup(data,i,string,value)
end

function missingno()
    local notemovewidth = (screenWidth/(4))
    for i = 0, 3 do
        local playerstrumwidth = getProGroup('playerStrums', i, 'width')
        local playerstrumheigth = getProGroup('playerStrums', i, 'height')
        setProGroup('playerStrums', i, 'x', missingNoStrumEvent(notemovewidth*i,notemovewidth*(i+1)-playerstrumwidth))
        setProGroup('playerStrums', i, 'y', missingNoStrumEvent(0,screenHeight-playerstrumheigth))
        setProGroup('playerStrums', i, 'scale.x', missingNoStrumEvent(scaleX[i+1]-2,scaleX[i+1]+2))
        setProGroup('playerStrums', i, 'scale.y', missingNoStrumEvent(scaleY[i+1]-2,scaleY[i+1]+2))
        scrollCheck('playerStrums',i)

        setProGroup('opponentStrums', i, 'alpha', 0.5)
        setProGroup('opponentStrums', i, 'x', getProGroup('playerStrums', i, 'x'))
        setProGroup('opponentStrums', i, 'y', getProGroup('playerStrums', i, 'y'))
        setProGroup('opponentStrums', i, 'scale.x', getProGroup('playerStrums', i, 'scale.x'))
        setProGroup('opponentStrums', i, 'scale.y', getProGroup('playerStrums', i, 'scale.y'))
        setProGroup('opponentStrums', i, 'downScroll', not getProGroup('playerStrums', i, 'downScroll'))
    end
end

function missingNoStrumEvent(min,max)
    return getRandomFloat(min, max)
end

function scrollCheck(strum,i)
    local strumY = getProGroup(strum, i, 'y')
    if strumY > (screenHeight/2 - 100) then
        setProGroup(strum, i, 'downScroll', true)
    else
        setProGroup(strum, i, 'downScroll', false)
    end
end