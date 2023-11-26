-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Zoom_Camera' then
		local values = string.split(value1, ', ')
		local zoom, duration = tonumber(values[1]), tonumber(values[2])
		if duration < 0 then duration = 0 end

		zoomCam(value2, zoom, duration)
	end
end

function zoomCam(cam, zoom, dur)
	if dur == 0 then
		setProperty(cam..'.zoom', zoom)
		if cam == 'camGame' then setProperty('defaultCamZoom', zoom) end
	else
		doTweenZoom('tweenCamera'..cam..curStep, cam, zoom, dur, 'circInOut')
	end
end

function string.split(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end