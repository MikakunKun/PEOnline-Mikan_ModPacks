local tiger=false
local camSpeed=0.2
function onUpdate(elapsed)
	setProperty('isCameraOnForcedPos',true)
	local camFollow={x=0,y=0}
	local defaultCamZoom=1.05
	if tiger==true then defaultCamZoom=0.5 end
	if mustHitSection then
		camFollow={x=getMidpointX('boyfriend')-100,y=getMidpointY('boyfriend')-100}
		if (runHaxeCode('return (game.boyfriend.otherCharacters == null ? true : false);')==false) then
			camFollow={x=getMidpointX('boyfriend.otherCharacters[0]')-100,y=getMidpointY('boyfriend.otherCharacters[0]')-100}
		end
		camFollow.x = camFollow.x - getProperty('boyfriend.cameraPosition[0]')
		camFollow.y = camFollow.y + getProperty('boyfriend.cameraPosition[1]')
		if tiger==true then
			camFollow.x = camFollow.x  - 400
			camFollow.y = camFollow.y  - 100
		end
	else
		camFollow={x=getMidpointX('dad') + 150,y=getMidpointY('dad')-100}
		if (runHaxeCode('return (game.dad.otherCharacters == null ? true : false);')==false) then
			camFollow={x=getMidpointX('dad.otherCharacters[0]') + 250,y=getMidpointY('dad.otherCharacters[0]')-100}
		end
		camFollow.x = camFollow.x - getProperty('dad.cameraPosition[0]')
		camFollow.y = camFollow.y + getProperty('dad.cameraPosition[1]')
		if tiger==true then
			camFollow.x = camFollow.x  + 400
			camFollow.y = camFollow.y  + 100
		end
	end
	--setProperty('defaultCamZoom', defaultCamZoom)
	startTween('camFollow', '_camFollow', {x = camFollow.x,y = camFollow.y,alpha=(defaultCamZoom-0.5)}, camSpeed,{ease = 'backout',onUpdate='moveCamera'})
	--doTweenX('camFollow_X', camFollow.x, 'camFollow', 1, '')
	--doTweenY('camFollow_Y', camFollow.y, 'camFollow', 1, '')
end

function onSongStart()
	camSpeed=0.75
	doTweenAlpha('black_Visible_false', 'black', 0, 0.5, 'sineinout')
end

function moveCamera(tag,vars)
	setProperty('camFollow.x',getProperty('_camFollow.x')) setProperty('camFollow.y',getProperty('_camFollow.y')) setProperty('defaultCamZoom', getProperty('_camFollow.alpha')+0.5)
end

function onCreate()
	makeLuaSprite('black',nil,0,0) makeGraphic('black',screenWidth,screenHeight,'000000') setObjectCamera('black','hud') addLuaSprite('black')
	makeLuaSprite('_camFollow',nil,0,0) addLuaSprite('_camFollow')
    luaDebugMode = true
	stageCreate('snep')
end
local nowStageSprites={}
function stageCreate(name)
    for i, v in ipairs(nowStageSprites) do removeLuaSprite(v, false) end
	if name=='snep' then
		tiger=false
		bgSprite('walls','snep/WALLS',-200,100, 1, 1,3,3,false,false,true);
		bgSprite('floor','snep/FLOOR',gP('walls.x'),gP('walls.y')+gP('walls.height'), 1, 1,3,4,false,false,true);
		addLuaSprite('floor') addLuaSprite('walls')
		bgSprite('water','snep/PUDDLE',-250,700, 1, 1,3,3,true,false,true);
		bgSprite('wires','snep/WIRES',200,100, 1.2, 1.2,3,3,true,true,true);
		bgSprite('boxes','snep/BOXES',700,600, 1.4, 1.4,3,3,true,true,true);
		
		makeLuaSprite('blackScreen',nil,-1000,0)
		makeGraphic('blackScreen', screenWidth*3, screenHeight*2, '000000')
		sP('blackScreen.alpha',0.6)
		setBlendMode('blackScreen', 'overlay')
		setProperty('blackScreen.scrollFactor.x',1)
		setProperty('blackScreen.scrollFactor.y',1)
		table.insert(nowStageSprites,'blackScreen')
		addLuaSprite('blackScreen',true)
		bgSprite('vignette','snep/vignettepixel',-450,0, -0.3, 1.2,1.7,1.7,true,true,true);
		setProperty('vignette.antialiasing', true)
		potisionSet({
			['boyfriend']={x=770, y=100},
			['opponent']={x=100, y=100},
		})
	elseif name=='tiger' then
		tiger=true
		bgSprite('walls','tigerShark/walls',480,500, 1, 1,11,11,true,false,false);
		bgSprite('water','tigerShark/nonoWater', 480, 450, 1, 1,11,11,true,false,false);
		bgSprite('boxes','tigerShark/standingPlatforms', 400, 500,1,1,8,8,true,false,false);
		bgSprite('tubes','tigerShark/tubes', 480, 400, 1.2, 1,12,11,true,true,false);
		potisionSet({
			['boyfriend']={x=990, y=100},
			['opponent']={x=-500, y=100},
		})
	else stageCreate('snep')
	end
end

function onEvent(eventName, value1, value2, strumTime)
	if eventName=='Change Character' then
		cameraFlash("hud", "ffffff", 1.5, true)
		if value1=='dad' then
			if value2=='tigershark'or value2=='snep-and-tiger' then stageCreate('tiger') else stageCreate('snep') end
		end
	end
end

function potisionSet(stageData)
    local boyfriend={x=stageData['boyfriend'].x,y=stageData['boyfriend'].y}
    local dad={x=stageData['opponent'].x,y=stageData['opponent'].y}

    setPosition('boyfriend',boyfriend.x,boyfriend.y)
    setPosition('dad',dad.x,dad.y)
end

function setPosition(tag,x,y)
	setCharacterX(tag, x)
	setCharacterY(tag, y)
end

function bgSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,create,front,update)
	makeLuaSprite(tag, folder, x, y)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
    if(update==true) then updateHitbox(tag) end
    table.insert(nowStageSprites,tag)
    if create == true then addLuaSprite(tag,front) end
	setProperty(tag..'.antialiasing', false)
end

function gP(variable) return getProperty(variable) end
function sP(variable,value) return setProperty(variable,value) end