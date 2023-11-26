local Path='missingno/'
function onCreate()
	resizeBG=6
	consistentPosition={-670, -240}
	curFrame=0

	addLuaScript('scripts/missingno-lua/CameraMove.lua')
	setGlobalFromScript('scripts/missingno-lua/CameraMove','cameraCentred',true)
	setGlobalFromScript('scripts/missingno-lua/CameraMove','OffsetCam',{0,-80})
	setGlobalFromScript('scripts/missingno-lua/CameraMove.lua','DADZoom',-0.15)

	makeAnimatedLuaSprite('background',Path..'bg', consistentPosition[1]+30, consistentPosition[2]-2)
	setScrollFactor('background', 0.3, 0.3);
	addAnimationByPrefix('background','idle', 'sky', 24, true)
	scaleObject('background',resizeBG,resizeBG)
	setProperty('background.antialiasing',false)
	

	makeAnimatedLuaSprite('missingnoOcean',Path..'BG_Assets', consistentPosition[1], consistentPosition[2])
	setScrollFactor('missingnoOcean', 0.4, 0.4);
	addAnimationByPrefix('missingnoOcean','idle', 'Bg Ocean', 24, true)
	scaleObject('missingnoOcean',resizeBG,resizeBG)
	setProperty('missingnoOcean.antialiasing',false)
	

	makeAnimatedLuaSprite('ground',Path..'BG_Assets', consistentPosition[1], consistentPosition[2]+10)
	addAnimationByPrefix('ground','idle', 'Bg Wave', 24, true)
	scaleObject('ground',resizeBG,resizeBG)
	setProperty('ground.antialiasing',false)
	

	makeAnimatedLuaSprite('groundNoShadow',Path..'noshadow', consistentPosition[1], consistentPosition[2]+10)
	addAnimationByPrefix('groundNoShadow','idle', 'Bg Wave', 24, true)
	scaleObject('groundNoShadow',resizeBG,resizeBG)
    setProperty('groundNoShadow.antialiasing',false)

	addLuaSprite('background', false)
	addLuaSprite('missingnoOcean', false)
	addLuaSprite('ground', false)
	addLuaSprite('groundNoShadow', false)
end

function onCreatePost()
	setProperty('gf.visible', false)
	if not string.lower(songName) == 'missingno' then
		setProperty('showRating',false)
		setProperty('showComboNum',false)
		for i = 0,getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'visible', false)
			setPropertyFromGroup('opponentStrums', i, 'y', 1280)
		end
		for i = 0,getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes',i,'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'visible', false)
			end
		end
	end
end

camzoom = 0.6
local dadY=nil
function onUpdate(elapsed)
	if dadY~= nil then
		setProperty('dad.y',dadY + ((math.sin((getSongPosition() / 16000) * (180 / math.pi))) * 5))
	else
		dadY=getProperty('dad.y')
	end
	if string.lower(songName) == 'missingno' then
		if getProperty('dad.visible') == false then
			setProperty('defaultCamZoom', camzoom)
		else
			if mustHitSection then
				setProperty('defaultCamZoom', camzoom)
			else
				setProperty('defaultCamZoom', camzoom+0.02)
			end
		end
	else
		if mustHitSection then
			setProperty('defaultCamZoom', camzoom+0.05)
		else
			setProperty('defaultCamZoom', camzoom+0.1)
		end
	end
end
function onEvent(eventName, value1, value2)
    if eventName == 'camzoom' then
        camzoom = value1
		if not value2 == '' then
			setGlobalFromScript('scripts/missingno-lua/CameraMove','OffsetCam',{0,value2})
		end
    end
end