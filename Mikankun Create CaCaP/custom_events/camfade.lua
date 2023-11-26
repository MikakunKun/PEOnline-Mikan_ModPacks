function onEvent(name, val1, val2)
    if name == 'camfade' then
        doTweenAlpha('camerafade', 'camGame', val1, val2, 'linear')
    end
end

function onPause()
    cancelTween('camerafade')
end