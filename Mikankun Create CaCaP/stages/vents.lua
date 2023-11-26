function onCreate()
    luaDebugMode = true

	bgSprite('walls','snep/WALLS',-200,100, 1, 1,3,3,false,false);
	bgSprite('floor','snep/FLOOR',gP('walls.x'),gP('walls.y')+gP('walls.height'), 1, 1,3,4,false,false);
    addLuaSprite('floor') addLuaSprite('walls')
	bgSprite('water','snep/PUDDLE',-250,700, 1, 1,3,3,true,false);
	bgSprite('wires','snep/WIRES',200,100, 1.2, 1.2,3,3,true,true);
	bgSprite('boxes','snep/BOXES',700,600, 1.4, 1.4,3,3,true,true);
end

function onCreatePost()
    makeLuaSprite('blackScreen',nil,0,0)
    makeGraphic('blackScreen', screenWidth*2, screenHeight*2, '000000')
    sP('blackScreen.alpha',0.6)
    setBlendMode('blackScreen', 'overlay')
	setProperty('blackScreen.scrollFactor.x',1)
	setProperty('blackScreen.scrollFactor.y',1)
    addLuaSprite('blackScreen',true)
	bgSprite('vignette','snep/vignettepixel',-250,100, -0.6, 1.2,1.4,1.4,true,true);
	setProperty('vignette.antialiasing', true)
end

function bgSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,create,front)
	makeLuaSprite(tag, folder, x, y)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
    updateHitbox(tag)
    if create == true then addLuaSprite(tag,front) end
	setProperty(tag..'.antialiasing', false)
end

function gP(variable) return getProperty(variable) end
function sP(variable,value) return setProperty(variable,value) end