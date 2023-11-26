local roasted = false
local walllenght = 7
local speed = 35
local witgh = 0

local dadOther0 = 'dad.otherCharacters[0]'
local dadOther1 = 'dad.otherCharacters[1]'

function onCreate()
    luaDebugMode = true
	if string.lower(songName) == 'roasted' then
		roasted = true
	end
	addHaxeLibrary('CoolUtil')
	addHaxeLibrary('HealthIcon')

	bgSprite('walls','tigerShark/walls',480,500, 1, 1,11,11,false);
	bgSprite('water','tigerShark/nonoWater', 480, 450, 1, 1,11,11,false);
    if roasted then
        witgh = getProperty('walls.width')
        for i = 1, walllenght do
            bgSprite('walls'..i,'tigerShark/walls',(witgh+getProperty('walls.scale.x'))+480*i,500, 1, 1,11,11,false);
        end
        bgSprite('water2','tigerShark/nonoWater', getProperty('water.width')+getProperty('water.scale.x')+480, 450, 1, 1,11,11,false);
        bgSprite('water2','tigerShark/nonoWater', getProperty('water.width')+getProperty('water.scale.x')-480, 450, 1, 1,11,11,false);
    end
	if roasted then
        --colin
		bgSprite('boxescolin','tigerShark/alt-standingPlatforms', 0,0,1,1,8,8,false);
        -- sodg and tiger
		bgSprite('boxes-sdogandtiger','tigerShark/alt-standingPlatforms', 0,0,1,1,12,12,false);
	else
		bgSprite('boxes','tigerShark/standingPlatforms', 400, 500,1,1,8,8,false);
	end
	bgSprite('tubes','tigerShark/tubes', 480, 400, 1.2, 1,12,11,true);
end

function onCreatePost()
    -- Mikan Engine Event
	if roasted then
        runHaxeCode([[
            var iconP3 = getVar('iconP3');
    
            game.healthBar.cameras = [game.camGame];
            game.healthBar.scrollFactor.set(1,1);
    
            game.healthBar.bg.cameras = [game.camGame];
            game.healthBar.bg.scrollFactor.set(1,1);
            
            game.iconP1.cameras = [game.camGame];
            game.iconP1.scrollFactor.set(1,1);
    
            game.iconP2.cameras = [game.camGame];
            game.iconP2.scrollFactor.set(1,1);
    
            iconP3.cameras = [game.camGame];
            iconP3.scrollFactor.set(1,1);
        ]])
    end
end

function bgSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,front)
	makeLuaSprite(tag, folder, x, y)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
	addLuaSprite(tag,front)
	setProperty(tag..'.antialiasing', false)
end

local a = 0
local window = 120

function onUpdate(elapsed)
	if roasted then
        setProperty('tubes.x', getProperty('tubes.x')-0.1)
        for i = 1, walllenght do
            local deb = 'walls'..i
            if (getProperty(deb..'.x') < (witgh+getProperty('walls.scale.x')+480) * -4) then
                setProperty(deb..'.x', (witgh+getProperty('walls.scale.x')+480) * (walllenght-4))
            end
            setProperty(deb..'.x', getProperty(deb..'.x') - speed)
        end
        a = a + (elapsed * 1.5)
        -- colin datas
        -- box
        setPos(getProperty('boyfriend.x')+getProperty('boyfriend.width')/3,getProperty('boyfriend.y')+getProperty('boyfriend.height')+100,'boxescolin')
        -- move
        setPos(990 + ((math.cos(a) * 2) * (window/4)), 200 + (math.sin(2 * a) * (window/2)), "boyfriend")
        -- -----------------------------------------------------------------------------------------------
        -- sodg and tiger datas
        -- box
        setPos(getProperty(dadOther1..'.x')+getProperty(dadOther1..'.width')/1.5,getProperty(dadOther1..'.y')+getProperty(dadOther1..'.height')+200,'boxes-sdogandtiger')
        -- move
        setPos((-350 + ((math.cos(a) * 1.5 + 1) * (window/4)))-(getPos('healthBar','percent')*3), -125 + (math.sin(3 * a + 1) * (window/2)), dadOther0)
        dad0Pose = {getPos(dadOther0,'x'),getPos(dadOther0,'y')}
        setPos(dad0Pose[1]+positionArray('dad',1,0)*0.7,dad0Pose[2]-positionArray('dad',1,1)*1.5, dadOther1)
        -- -----------------------------------------------------------------------------------------------
        -- healthBar Pose Set
        setPos((getPos(dadOther0,'x')+getPos('boyfriend','x'))/2,(getPos(dadOther0,'y')/2+getPos('boyfriend','y'))/2,'healthBar.bg')
        setPos(getPos('healthBar.bg','x')+4,getPos('healthBar.bg','y')+4,'healthBar')
	end
end

function onUpdatePost(elapsed)
	if roasted then
        -- iconP1(Colin Icon) Pose Set
        setPos(getPos('boyfriend','x')-150,getPos('boyfriend','y')+getPos('boyfriend','height')-110,'iconP1')
    
        -- iconP2(Sdog Icon) Pose Set
        setPos(getPos(dadOther1,'x')+getPos(dadOther1,'width')-150,getPos(dadOther0,'y')+getPos(dadOther0,'height')/2,'iconP2')

        -- iconP3(TigerShark Icon) Pose Set
        runHaxeCode([[
            var iconP3 = getVar('iconP3');
            var dad0 = game.dad.otherCharacters[0];
            var dad1 = game.dad.otherCharacters[1];

            iconP3.x = dad1.x+dad1.width-400;
            iconP3.y = dad1.y+dad1.height/2;
        ]])
        setPos(getPos(dadOther1,'x')+getPos(dadOther1,'width')-150,getPos(dadOther0,'y')+getPos(dadOther0,'height')/2,'iconP2')
    end
end

function positionArray(chara,int,Pose)
    local data = 0
    if type(Pose) == 'string' then
        if Pose == 'y' then
            data = 1
        end
    end
    if type(Pose) == 'number' then
        if Pose <= 1 then
            data = Pose
        end
    end
    return getProperty(chara..'.otherCharacters['..int..'].positionArray['..data..']')
end

function setPos(x,y,chara)
    setProperty(chara..'.x',x)
    setProperty(chara..'.y',y)
end

function getPos(chara,data)
    return getProperty(chara..'.'..data)
end

function onSectionHit()
    if roasted then triggerEvent('Boss Event Fish', 2, '') end
	if mustHitSection then
		if roasted then
            setProperty('defaultCamZoom', 0.9)
		else
            setProperty('defaultCamZoom', 1.05)
		end
    else
        setProperty('defaultCamZoom', 0.7)
	end
end

function onStepHit()
    if roasted then
        if curStep == 1568 then triggerEvent('Up Down Wave','','') end
        if curStep == 1952 then triggerEvent('Up Down Wave','','') end
    end
end

---
--- @param eventName string
--- @param value1 string
--- @param value2 string
---
function onEvent(eventName, value1, value2)
    if eventName == 'Boss Toggle' then
        if songName == 'drippin-boss' then
            triggerEvent('Up Down Wave',value1,value2)
        else
            triggerEvent('Normal Wave',value1,value2)
        end
    end
    if eventName == 'Boss Event' then
        if songName == 'drippin-boss' then
            triggerEvent('Boss Event Drippin',value1,value2)
        else
            triggerEvent('Boss Event Fish',value1,value2)
        end
    end
end