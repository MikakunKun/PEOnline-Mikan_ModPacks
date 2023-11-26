local scales = {
    0.7,-- 1k
    0.7,--2k
    0.7,--3k
    0.7,--4k
    0.65,--5k
    0.6,--6k
    0.55,--7k
    0.5,--8k
    0.46,--9k
    0.4,--10k
    0.37,--11k
    0.36,--12k
    0.35,--13k
    0.32,--14k
    0.3,--15k
    0.28,--16k
    0.26,--17k
    0.24--18k
}
local scaleX = {}
local scaleY = {}

function onStartCountdown()
    return Function_Continue
end

function onCountdownStarted()
    for i = 0, mania do
        table.insert(scaleX,getProGroup('playerStrums',i,'scale.x'))
        table.insert(scaleY,getProGroup('playerStrums',i,'scale.y'))
    end
    debugPrint(scaleX..' '..scaleY)
end

function onChangeMania(mania, oldmania)
    scaleX = {}
    scaleY = {}
    for i = 0, mania do
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
        strum = 'opponentStrums'
        if getProGroup('notes',i,'mustPress') then strum = 'playerStrums' end
        noteData = getProGroup('notes', i, 'noteData')
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
    local notemovewidth = (screenWidth/(mania+1))
    for i = 0, mania do
        local playerstrumwidth = getProGroup('playerStrums', i, 'width')
        local playerstrumheigth = getProGroup('playerStrums', i, 'height')
        setProGroup('playerStrums', i, 'x', missingNoStrumEvent(notemovewidth*i,notemovewidth*(i+1)-playerstrumwidth))
        setProGroup('playerStrums', i, 'y', missingNoStrumEvent(0,screenHeight-playerstrumheigth))
        if runHaxeCode('return PlayState.isPixelStage') == true then
            setProGroup('playerStrums', i, 'scale.x', missingNoStrumEvent(scaleX[i+1]-2,scaleX[i+1]+2))
            setProGroup('playerStrums', i, 'scale.y', missingNoStrumEvent(scaleY[i+1]-2,scaleY[i+1]+2))
        else
            setProGroup('playerStrums', i, 'scale.x', missingNoStrumEvent(scales[mania+1]-0.2,scales[mania+1]+0.2))
            setProGroup('playerStrums', i, 'scale.y', missingNoStrumEvent(scales[mania+1]-0.2,scales[mania+1]+0.2))
        end
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