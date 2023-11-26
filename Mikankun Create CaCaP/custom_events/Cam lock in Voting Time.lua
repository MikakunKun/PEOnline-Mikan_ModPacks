function onEvent(eventName, value1, value2)
    if eventName=='Cam lock in Voting Time' then
        if value1=='in' then
            setProperty('defaultCamZoom',1.2)
            setProperty('camGame.zoom',1.2)
            if value2=='dad' then
                setProperty('camFollowPos.x',460)
                setProperty('camFollowPos.y',700)
                setGlobalFromScript('data/voting-time/script/CameraMove','ManualPos',{460, 700})
            else
                setProperty('camFollowPos.x',1470)
                setProperty('camFollowPos.y',700)
                setGlobalFromScript('data/voting-time/script/CameraMove','ManualPos',{1470, 700})
            end
            setGlobalFromScript('data/voting-time/script/CameraMove','ForceCamPos',true)
        elseif value1=='close' then
            setProperty('defaultCamZoom',1.25)
            setProperty('camGame.zoom',1.25)
            if value2=='dad' then
                setProperty('camFollowPos.x',480)
                setProperty('camFollowPos.y',680)
                setGlobalFromScript('data/voting-time/script/CameraMove','ManualPos',{480, 680})
            else
                setProperty('camFollowPos.x',1450)
                setProperty('camFollowPos.y',680)
                setGlobalFromScript('data/voting-time/script/CameraMove','ManualPos',{1450, 680})
            end
            setGlobalFromScript('data/voting-time/script/CameraMove','ForceCamPos',true)
        else
            setProperty('defaultCamZoom',0.7)
            setProperty('camGame.zoom',0.7)
            setProperty('camFollowPos.x',960)
            setProperty('camFollowPos.y',540)
            setGlobalFromScript('data/voting-time/script/CameraMove','ManualPos',{960, 540})
            setGlobalFromScript('data/voting-time/script/CameraMove','ForceCamPos',true)
        end
    end
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end