local Path='stages/Glitchy/'
local FlipHealthbar=false
function onCreate()
	setProperty('camZooming',true)
	FlipHealthBar()
	
	addLuaScript('scripts/missingno-lua/CameraMove.lua')
	setGlobalFromScript('scripts/missingno-lua/CameraMove','DADZoom',0.15)
	if string.lower(songName)=='monotone attack'then
		setGlobalFromScript('scripts/missingno-lua/CameraMove','DADZoom',0.20)
		setGlobalFromScript('scripts/missingno-lua/CameraMove','BFZoom',0.35)
	end

	makeLuaSprite('BG',Path..'glitch_City', -1400, -725)
	setScrollFactor('BG', 0.8, 0.8)
	scaleObject('BG', 0.625, 0.625,false)

	makeLuaSprite('Tiles',Path..'tiles', -1400, -725)
	setScrollFactor('Tiles', 0.9, 0.9)
	scaleObject('Tiles', 0.625, 0.625,false)

	makeLuaSprite('Haze',Path..'haze', -1400, -725)
	setScrollFactor('Haze', 0.9, 0.9)
	scaleObject('Haze', 0.625, 0.625,false)
	

	addLuaSprite('BG', false);
	addLuaSprite('Tiles', false);
	addLuaSprite('Haze', false);
	
--[[
	"boyfriend": [-1000, 100],
	"girlfriend": [-200, 130],
	"opponent": [0, -325]
]]
addLuaScript("data/LoadSecondJson.lua")
end
function onMoveCamera(char)
	if string.lower(songName)=='monotone attack'then
		if char=='boyfriend' then
			setGlobalFromScript('scripts/missingno-lua/CameraMove','OffsetCam',{100,127})
		elseif char=='dad'then
			setGlobalFromScript('scripts/missingno-lua/CameraMove','OffsetCam',{-100,125})
		end
	end
end
local alphaChange={'healthBar','healthBarBG','iconP1','iconP2','scoreTxt'}
function onCreatePost()
	if string.lower(songName)=='monotone attack'then
		for i,v in ipairs(alphaChange)do
			if downscroll==false then setProperty(v..'.y',getProperty(v..'.y')-500) end
			setProperty(v..'.alpha',0.3)
			setObjectCamera(v, 'game')
			setObjectOrder(v, 3)
		end
	end
for i=0,7 do 
    if i<4 then
		if not middlescroll then
		    setPropertyFromGroup('strumLineNotes',i,'x',_G['defaultPlayerStrumX'..i])
		end
		
	else
		if not middlescroll then
		    setPropertyFromGroup('strumLineNotes',i,'x',_G['defaultOpponentStrumX'..i-4])
		end
	end
end
end
function onUpdatePost(elapsed)
    setProperty('iconP1.flipX',FlipHealthbar)
    setProperty('iconP2.flipX', FlipHealthbar)
    setProperty('healthBar.flipX',FlipHealthbar)
    if FlipHealthbar then
        local healthBarWidth= getProperty('healthBar.width')
        local healthBarX = getProperty('healthBar.x')
        local healthBarPercent = getProperty('healthBar.percent')
        local XoffsetP2=healthBarX+(healthBarWidth*healthBarPercent*0.01)+(150 *getProperty('iconP1.scale.x') - 150) / 2 - 26
        local XoffsetP1=healthBarX+(healthBarWidth*healthBarPercent*0.01)-(150 *getProperty('iconP2.scale.x')) / 2 - 26* 2
        setProperty('iconP2.x',XoffsetP2)
        setProperty('iconP1.x',XoffsetP1) 
    end
end
function FlipHealthBar()
    FlipHealthbar = not FlipHealthbar
end
function onEvent(eventName, value1, value2)
	if eventName=='Better Character Change' then
		setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',0.175)
	end
end