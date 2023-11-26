function onCreate()
    bgSprite('boxingnight1','boxingnight1',-1050,-650,0.1,0.1,2,2,false)
    bgSprite('boxingnight2','boxingnight2',-1050,-640,0.3,0.3,2,2,false)
    bgSprite('boxingnight3','boxingnight3',-1600,400,1,1,1.4,1.4,false)
end

function onUpdate(elapsed)
    setProperty('gf.alpha',0)
    setProperty('camFollow.y',1280)
end

function onUpdatePost(elapsed) setProperty('camFollow.y',1280) end

function bgSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,front)
	makeLuaSprite(tag, 'stages/miiboxingarena2/'..folder, x, y)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
	addLuaSprite(tag,front)
	setProperty(tag..'.antialiasing', true)
end