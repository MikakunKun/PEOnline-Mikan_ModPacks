local stage={x=225,y=215,scalex=7.5,scaley=7.5}
camzoom = 0.7

function onCreate()
    createStage('sky','BG_Assets',stage.x,stage.y,'ocean','Bg Sky',stage.scalex,stage.scaley,1,1)
    createStage('ocean','BG_Assets',stage.x,stage.y,'ocean','Ocean',stage.scalex,stage.scaley,1,1)
    createStage('floor','BG_Assets',stage.x,stage.y,'wave','Bg Wave',stage.scalex,stage.scaley,1,1)
end

function onCreatePost()
    setProperty('gf.visible', false)
    setProperty('showRating',false)
    setProperty('showComboNum',false)
    setProperty('dad.x', -50)
    setProperty('dad.y', 50)
end

function createStage(tag,file,x,y,animname,xmlanim,scax,scay,scrx,scry)
    makeAnimatedLuaSprite(tag, 'missingno/'..file, x, y)
    addAnimationByPrefix(tag, animname, xmlanim, 24, true)
    setScale(tag,scax,scay)
    setScroll(tag,scrx,scry)
	objectPlayAnimation(tag, animname, true);
    setProperty(tag..'.antialiasing',true)
    addLuaSprite(tag)
end

function setScale(tag,x,y)
    setProperty(tag..'.scale.x', x)
    setProperty(tag..'.scale.y', y)
end

function setScroll(tag,x,y)
    setProperty(tag..'.scrollFactor.x', x)
    setProperty(tag..'.scrollFactor.y', y)
end

function onUpdate(elapsed)
    if mustHitSection then
        setProperty('defaultCamZoom', camzoom)
    else
        setProperty('defaultCamZoom', camzoom+0.05)
    end
end

function onEvent(eventName, value1, value2)
    if eventName == 'camzoom' then
        camzoom = value1
    end
end