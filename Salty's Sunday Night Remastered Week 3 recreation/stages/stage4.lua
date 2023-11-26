
function onCreate()
    setProperty('defaultCamZoom',0.65)
    makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1280,100,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,650)
    makeGraphic('barbot',1280,100,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    makeLuaSprite('bg4', 'stage4/ground', -2030, -1200)
    addLuaSprite('bg4', false)
    scaleObject('bg4', 1.76, 1.7)
if not lowQuality then
    makeLuaSprite('bg7', 'stage4/bushes', -2030, -1200)
    addLuaSprite('bg7', true)
    scaleObject('bg7', 1.76, 1.7)
	setLuaSpriteScrollFactor('bg7', 1.1, 1.1)
end
end
