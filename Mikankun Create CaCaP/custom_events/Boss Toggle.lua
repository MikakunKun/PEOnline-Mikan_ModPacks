local bossToggle=false
function onCreate()
    luaDebugMode=true
    precacheImage('tigerShark/events/squogWater')
end
function onEvent(eventName, value1, value2, strumTime)
    if eventName=='Boss Toggle' then
        bossToggle=not bossToggle
        if bossToggle==true then
            local waveoffset = 10
            local wavetimerdef = 0.06
            local waveamm = 1
            local wavetime = wavetimerdef
            runTimer('wavetimer '..wavetime..' '..waveamm..' '..(720+waveoffset), wavetime, 1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if stringStartsWith(tag, 'wavetimer') then
        if bossToggle==true then
            createWaves(stringSplit(tag, ' ')[3],stringSplit(tag, ' ')[4],false)
            runTimer(tag, stringSplit(tag, ' ')[2], 1)
        end
    end
end
local anyCount=0

function createWaves(waveNumber, yy, flip)
    local offsetx = getRandomInt(-200, 1480);
    local angle = -90;
    local anglemod = 20;

    local speed = 400;
    local speedmod = 100;

    local grav = 850;
    local gravmod = 100;

    local mult = 2;
    --local offsety = 800;

    if(flip == true) then
        anglemod = -anglemod;
        angle = -angle;
        --speed = -speed;
        --speedmod = -speedmod;
        grav = -grav;
        gravmod = -gravmod;
        --mult = -mult;
    end
    for i=0,waveNumber-1 do
        local scale = getRandomFloat(3, 3.2)
        local particle='wave_particle'..anyCount

        pictureCreate(particle,'tigerShark/events/squogWater','other')
        if flip==true then setProperty(particle..'.flipY', true) end
        setScale(particle,scale)
        setPosition(particle,offsetx,yy)
        setProperty(particle..'.alpha',getRandomFloat(0.7,0.9))
        setProperty(particle..'.acceleration.y',grav+(gravmod*mult))
        setProperty(particle..'.velocity.y',-grav/1.5)
        setProperty(particle..'.velocity.x',speed/10)
        anyCount=anyCount+1
    end
end

function pictureCreate(tag,image,cam)
    makeLuaSprite(tag, image,0,0)
    setObjectCamera(tag, cam)
    addLuaSprite(tag)
end

function setScale(tag,scale)
    setProperty(tag..'.scale.x',scale)
    setProperty(tag..'.scale.y',scale)
end

function setPosition(tag,x,y)
    setProperty(tag..'.x',x)
    setProperty(tag..'.y',y)
end