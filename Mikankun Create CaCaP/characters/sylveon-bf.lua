function onCreate()
    if boyfriendName == 'sylveon-bf' then
        setProperty('iconP2.visible', false)
        setProperty('iconP2.alpha', 0)
    end
    if dadName == 'sylveon-bf' then
        setProperty('iconP1.visible', false)
        setProperty('iconP1.alpha', 0)
    end
end

function onEvent(eventName, value1, value2)
    if eventName == 'Change Character' then
        if boyfriendName == 'bf' then
            setProperty('iconP2.visible', false)
            setProperty('iconP2.alpha', 0)
        end
        if dadName == 'sylveon-bf' then
            setProperty('iconP1.visible', false)
            setProperty('iconP1.alpha', 0)
        end
    end
end