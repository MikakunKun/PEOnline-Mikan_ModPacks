local missingno = true

function onCreate()
    setProperty('skipCountdown',true)
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
            for i = 0, mania do
                noteTweenAlpha('opponentStrumsMove'..i..'Y', i, 0.5, 1, "")
            end
        end
        if curBeat >= 272 then
            for i = 0, mania do
                setPropertyFromGroup('opponentStrums', i, 'alpha', 0.5)
            end
        end
    end
end

function onUpdate(elapsed)
    if getSongPosition() <= 15500 then
        if keyJustPressed('space') then
            runHaxeCode('game.setSongTime(15501);')
        end
    end
end