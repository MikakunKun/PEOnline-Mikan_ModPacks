local missingno = true
local useStrums='opponentStrums'

function onCreate()
    if (not runHaxeCode('return PlayState.playsAsBF();')==true) then
        useStrums='playerStrums'
    end
    if stringStartsWith(string.lower(difficultyName), 'cover') then
        missingno = false
    end
    if missingno then
        precacheSound('missingnospawn')
        setProperty('dad.visible', false)
    end
end

function onBeatHit()
    if missingno then
        if curBeat == 59 then
            playSound('missingnospawn', 1, 'spawnmissing')
            setProperty('dad.visible', true)
            playAnim('dad', 'Intro', true)
            setProperty('dad.specialAnim', true)
        end
        if curBeat >= 59 then
            setProperty('dad.visible', true)
        end
        if curBeat == 264 then
            for i = 0, 3 do
                noteTweenAlpha('opponentStrumsMove'..i..'Y', i, 0.5, 1, "")
            end
        end
        if curBeat >= 272 then
            for i = 0, 3 do
                setPropertyFromGroup(useStrums, i, 'alpha', 0.5)
            end
        end
    end
end