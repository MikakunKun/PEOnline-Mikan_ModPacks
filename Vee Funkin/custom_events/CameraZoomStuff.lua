function onEvent(name, value1, value2)
    if name == 'CameraZoomStuff' then
        setProperty('defaultCamZoom', (value1));
        setProperty('cameraSpeed', (value2))
    end
end