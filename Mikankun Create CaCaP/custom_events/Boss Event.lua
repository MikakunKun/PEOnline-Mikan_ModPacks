function onCreate()
    luaDebugMode=true
    for i=0,2 do precacheImage('tigerShark/events/sharks/SHARK'..i) end
    
end
function onEvent(eventName, value1, value2, strumTime)
    if eventName=='Boss Event' then
        createSharks(value1, 720+100);
    end
end

local anyCount=0

function createSharks(sharkNumber, yy)
    for i=0,sharkNumber-1 do
        local offsetx = getRandomInt(280, 1000);
        local angle = -90;
        local anglemod = 20;
    
        local speed = getRandomInt(-1400, 2200);
        local speedmod = 100;
    
        local grav = 3000;
        local gravmod = 100;
    
        local mult = 2;

        local scale = 1.6
        local shark=getRandomInt(0,3)-1
        local particle='shark_particle'..anyCount

        if shark~=1 then pictureCreate(particle,'tigerShark/events/sharks/SHARK'..shark,'other')
        else otherPictureCreate(particle,'tigerShark/events/sharks/SHARK'..shark,'other') end
        setProperty(particle..'.antialiasing', false)
        local flip=getRandomBool()
        
        if flip==true then setProperty(particle..'.flipX', true)anglemod=-anglemod end
        setScale(particle,scale)
        setPosition(particle,offsetx,yy)
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

function otherPictureCreate(tag,image,cam)
    makeLuaSprite(tag, image, 0,0)
    loadGraphic(tag,image,165, 165)
    addAnimation(tag,'anim',{0,1,2,3},10,true)
    playAnim(tag, "anim", true)
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