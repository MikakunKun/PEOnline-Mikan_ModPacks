function onCreate()
        shader_onCreate()
        --Snowy
	makeLuaSprite('Snowysky', 'stages/vee-funkin/Snowysky', -850, -300); precacheImage("stages/vee-funkin/Snowysky")
	makeLuaSprite('Snowystuff', 'stages/vee-funkin/Snowystuff', -800, 100); precacheImage("stages/vee-funkin/Snowystuff")
	makeLuaSprite('Snowyfloor', 'stages/vee-funkin/Snowyfloor', -1300, 800); precacheImage("stages/vee-funkin/Snowyfloor")

	luaSpriteScrollFactor('Snowyfloor', 1, 1);
        luaSpriteScrollFactor('Snowystuff', 1.1, 1);
        luaSpriteScrollFactor('Snowysky', 1.25, 1);

        -- Forest
	makeLuaSprite('Trees', 'stages/vee-funkin/Trees', -850, -300);
	makeLuaSprite('Grass', 'stages/vee-funkin/Grass', -1500, 800);
	makeLuaSprite('Bushes', 'stages/vee-funkin/Bushes', -650, 530);

	luaSpriteScrollFactor('Grass', 1, 1);
        luaSpriteScrollFactor('Bushes', 1.1, 1);
        luaSpriteScrollFactor('Trees', 1.25, 1);

        -- Volcan
	makeLuaSprite('Volcan-BG', 'stages/vee-funkin/Volcan-BG', -1500, -800); precacheImage("stages/vee-funkin/Volcan-BG")
	makeLuaSprite('Volcan-Cano', 'stages/vee-funkin/Volcan-Cano', -1000, -1300); precacheImage("stages/vee-funkin/Volcan-Cano")
	makeLuaSprite('Volcan-Ground', 'stages/vee-funkin/Volcan-Ground', -1500, 700); precacheImage("stages/vee-funkin/Volcan-Ground")
	makeLuaSprite('Volcan-Smoke', 'stages/vee-funkin/Volcan-Smoke', -1500, 230); precacheImage("stages/vee-funkin/Volcan-Smoke")

        makeAnimatedLuaSprite('Volcan-Lava', 'stages/vee-funkin/Volcan-Lava', -1000, -570) precacheImage("stages/vee-funkin/Volcan-Lava")
	addAnimationByPrefix('Volcan-Lava','Volcan-Lava','Volcan-Lava', 24, true)
	playAnim('Volcan-Lava', 'Volcan-Lava', true);

	luaSpriteScrollFactor('Volcan-Ground', 1, 1);
        luaSpriteScrollFactor('Volcan-Cano', 1.1, 1);
        luaSpriteScrollFactor('Volcan-Lava', 1.1, 1);
        luaSpriteScrollFactor('Volcan-BG', 1.25, 1);

        -- Beath
	makeLuaSprite('BeachSky', 'stages/vee-funkin/BeachSky', -1600, -300); precacheImage("stages/vee-funkin/BeachSky")
	makeLuaSprite('Land', 'stages/vee-funkin/Land', 500, 500); precacheImage("stages/vee-funkin/Land")

        makeAnimatedLuaSprite('BeachOcean', 'stages/vee-funkin/BeachOcean', -1500, 550) precacheImage("stages/vee-funkin/BeachOcean")
	addAnimationByPrefix('BeachOcean','BeachOcean','BeachOcean', 24, true)
	playAnim('BeachOcean', 'BeachOcean', true);

        makeAnimatedLuaSprite('Sylveon Beach', 'stages/vee-funkin/Sylveon Beach', 1700, 500) precacheImage("stages/vee-funkin/Sylveon Beach")
	addAnimationByPrefix('Sylveon Beach','Sylveon Beach','Sylveon Beach', 24, true)

	makeLuaSprite('BeachForeground', 'stages/vee-funkin/BeachForeground', -1000, 500); precacheImage("stages/vee-funkin/BeachForeground")

        luaSpriteScrollFactor('Sylveon Beach', 1.1, 1);
        luaSpriteScrollFactor('BeachSky', 1.25, 1);
        luaSpriteScrollFactor('Land', 1.1, 1);
	luaSpriteScrollFactor('BeachForeground', 1, 1);
        luaSpriteScrollFactor('BeachOcean', 1.1, 1);

        -- woods
        --[[
	makeLuaSprite('far back', 'swampert-stage/far back', -950, -600); precacheImage("swampert-stage/far back")
	makeLuaSprite('back plants', 'swampert-stage/back plants', -950, -550); precacheImage("swampert-stage/back plants")
	makeLuaSprite('ground', 'swampert-stage/ground', -880, 220); precacheImage("swampert-stage/ground")
	makeLuaSprite('front plants', 'swampert-stage/front plants', -870, 480); precacheImage("swampert-stage/front plants")

	setScrollFactor('far back', 0.6, 0.6);
	setScrollFactor('back plants', 0.8, 0.8);
	setScrollFactor('ground', 1.0, 1.0);
	setScrollFactor('front plants', 0.8, 0.8);]]

        -- Black Screen
        makeLuaSprite('blackScr1', nil, 0.0, 0.0)
        makeGraphic('blackScr1', 1, 1, '000000')
        setGraphicSize('blackScr1', 1280,720)
        setObjectCamera('blackScr1', 'hud')
        setProperty('blackScr1.alpha',0)
        addLuaSprite('blackScr1')
        
        addLuaSprite('Snowysky', false)
        addLuaSprite('Snowystuff', false)
        addLuaSprite('Snowyfloor', false)
        addLuaSprite('Trees', false)
        addLuaSprite('Grass', false)
        addLuaSprite('Bushes', false)
        addLuaSprite('Volcan-BG', false)
        addLuaSprite('Volcan-Cano', false)
        addLuaSprite('Volcan-Ground', false)
        addLuaSprite('Volcan-Smoke', true)
        addLuaSprite('Volcan-Lava',false);
        addLuaSprite('BeachSky', false)
        addLuaSprite('Land', false)
        addLuaSprite('BeachOcean',false);
        addLuaSprite('Sylveon Beach',false);
        addLuaSprite('BeachForeground', false)
        --[[
        addLuaSprite('far back', false);
        addLuaSprite('back plants', false);
        addLuaSprite('ground', false);
        addLuaSprite('front plants', true);]]

        stageResetAndCreate('forest')

        makeLuaSprite('zoom', nil, -1, -1)
        makeGraphic('zoom', 1, 1, '000000')
        setObjectCamera('zoom', 'hud')
        setProperty('zoom.alpha',0.7)
        addLuaSprite('zoom')
        setProperty('maxhealth',3)
end

local stageName = 'forest'
local stageCameraZoom = 0.7

function stageResetAndCreate(name)
        setProperty('health',getProperty('maxhealth')/2)
        name = string.lower(name)
        -- Snowy Stage
        if luaSpriteExists("Snowysky") then removeLuaSprite("Snowysky",false) end
        if luaSpriteExists("Snowystuff") then removeLuaSprite("Snowystuff",false) end
        if luaSpriteExists("Snowyfloor") then removeLuaSprite("Snowyfloor",false) end
        -- Forest Stage
        if luaSpriteExists("Trees") then removeLuaSprite("Trees",false) end
        if luaSpriteExists("Grass") then removeLuaSprite("Grass",false) end
        if luaSpriteExists("Bushes") then removeLuaSprite("Bushes",false) end
        -- Volcan Stage
        if luaSpriteExists("Volcan-BG") then removeLuaSprite("Volcan-BG",false) end
        if luaSpriteExists("Volcan-Cano") then removeLuaSprite("Volcan-Cano",false) end
        if luaSpriteExists("Volcan-Ground") then removeLuaSprite("Volcan-Ground",false) end
        if luaSpriteExists("Volcan-Smoke") then removeLuaSprite("Volcan-Smoke",false) end
        if luaSpriteExists("Volcan-Lava") then removeLuaSprite("Volcan-Lava",false) end
        -- Beath Stage
        if luaSpriteExists("BeachSky") then removeLuaSprite("BeachSky",false) end
        if luaSpriteExists("Land") then removeLuaSprite("Land",false) end
        if luaSpriteExists("BeachOcean") then removeLuaSprite("BeachOcean",false) end
        if luaSpriteExists("Sylveon Beach") then removeLuaSprite("Sylveon Beach",false) end
        if luaSpriteExists("BeachForeground") then removeLuaSprite("BeachForeground",false) end
        -- Woods Stage
        --[[
        if luaSpriteExists("far back") then removeLuaSprite("far back",false) end
        if luaSpriteExists("back plants") then removeLuaSprite("back plants",false) end
        if luaSpriteExists("ground") then removeLuaSprite("ground",false) end
        if luaSpriteExists("front plants") then removeLuaSprite("front plants",false) end  ]]

        if name=='snowy' then
                addLuaSprite('Snowysky', false)
                addLuaSprite('Snowystuff', false)
                addLuaSprite('Snowyfloor', false)
        
                setActor('boyfriend',800, 200)
                setActor('girlfriend',200, 300)
                setActor('opponent',-300, 230)
                stageCameraZoom=0.7
        elseif name=='forest' then
                addLuaSprite('Trees', false)
                addLuaSprite('Grass', false)
                addLuaSprite('Bushes', false)

                setActor('boyfriend',800, 200)
                setActor('girlfriend',200, 300)
                setActor('opponent',-300, 200)
                stageCameraZoom=0.7
        elseif name=='volcan' then
                addLuaSprite('Volcan-BG', false)
                addLuaSprite('Volcan-Cano', false)
                addLuaSprite('Volcan-Ground', false)
                addLuaSprite('Volcan-Smoke', true)
                addLuaSprite('Volcan-Lava',false);

                setActor('boyfriend',800, 100)
                setActor('girlfriend',200, 200)
                setActor('opponent',-300, 100)
                stageCameraZoom=0.55
        elseif name=='beath' then
                addLuaSprite('BeachSky', false)
                addLuaSprite('Land', false)
                addLuaSprite('BeachOcean',false);
                addLuaSprite('Sylveon Beach',false);
                addLuaSprite('BeachForeground', false)

                setActor('boyfriend',900, 200)
                setActor('girlfriend',1000, 400)
                setActor('opponent',-600, 250)
                stageCameraZoom=0.6
        --[[
        elseif name=='woods' then
                addLuaSprite('far back', false);
                addLuaSprite('back plants', false);
                addLuaSprite('ground', false);
                addLuaSprite('front plants', true);

                setActor('boyfriend',800, 100)
                setActor('girlfriend',280, 130)
                setActor('opponent',50, 100)
                stageCameraZoom=0.6]]
        else
                debugPrint('Not Exist '..name..' stage')
                debugPrint('Hey!!')
                debugPrint('\n\n\n\n')
        end
        doTweenAlpha("stageCameraZoomChange", "zoom", stageCameraZoom, 0.7, "elasticinout")
        stageName = name
end

function opponentNoteHit(notePoseID, noteData, noteType, isSustainNote)
        setProperty("health", getProperty('health')-((getPropertyFromGroup('notes',notePoseID,'hitHealth')/1.08) * getProperty('healthGain')))
end

function onEvent(eventName, value1, value2, strumTime)
        if eventName=='Change Character' then
                if value1=='dad' then
                        if value2=='Glaceon'or value2=='Lazuli' then stageResetAndCreate('snowy')
                        elseif value2=='Sylveon'or value2=='Speed' or value2=='poke-mas-vees' then stageResetAndCreate('forest')
                        elseif value2=='Flareon' then stageResetAndCreate('volcan')
                        elseif value2=='Vaporeon' then stageResetAndCreate('beath')
                        --[[  elseif value2=='poke-mas-vees' then stageResetAndCreate('woods')  ]] end
                        if not(value2=='Lazuli smile' or value2=='poke-mas-vees') then
                                local dadColor=getProperty('dad.healthColorArray')
                                local dadtextcolor = getColorFromRGB(dadColor[1],dadColor[2],dadColor[3],false)
                                cameraFlash("game", dadtextcolor, 0.4, true)
                        elseif (value2=='poke-mas-vees') then
                                cameraFlash("game", 'FF0000', 0.2, true)
                        end
                end
        end
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    if RR>255 then RR="255" end
    if GG>255 then GG="255" end
    if BB>255 then BB="255" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end

function onBeatHit()
        if stageName == 'beath' then playAnim('Sylveon Beach', 'Sylveon Beach', true); end
end

function luaSpriteScrollFactor(tag,scrollX,scrollY)
        setProperty(tag..'.scrollFactor.x', scrollX)
        setProperty(tag..'.scrollFactor.y', scrollY)
end

function setActor(chara,x,y)
        setCharacterX(chara,x)
        setCharacterY(chara,y)
end

-- Shader Setting

local shaderName = "pixel"
function shader_onCreate()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("pixel")
    makeGraphic("shaderImage", screenWidth, screenHeight)

   setSpriteShader("shaderImage", "pixel")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.getLuaObject("pixel").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
    ]])
end

function onStepHit()
        if (curStep>=512 and curStep<=576) or (curStep>=640 and curStep<=704) or (curStep>=1056 and curStep<=1268) then
                runHaxeCode([[
                        var shaderName = "]] .. shaderName .. [[";
                        game.initLuaShader(shaderName);
                        var shader0 = game.createRuntimeShader(shaderName);
                        game.camGame.setFilters([new ShaderFilter(shader0)]);
                ]])
        elseif (curStep>=1616) then
                if curStep==1616 then cameraFlash("hud", "FFFFFF", 0.4, true) end
                setProperty("blackScr1.alpha", 1)
        else
                runHaxeCode([[
                        game.camGame.setFilters([]);
                ]])
        end
end

function onUpdate(elapsed)
        setProperty('defaultCamZoom',getProperty('zoom.alpha'))
        setShaderFloat("pixel", "iTime", os.clock())
 end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end