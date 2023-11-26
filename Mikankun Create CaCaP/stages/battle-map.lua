local nowStageSprites={}
local camPosition={x=0,y=0}
function onCreate()
    luaDebugMode=true
    stageSelect('forest')
end
function stageSelect(name)
    local stageData={
        ['camPosition']={x=0,y=0},
        ['defaultZoom']=0.9,
        ['boyfriend']={x=250, y=200},
        ['opponent']={x=-300, y=200},
    }
    if name=='' then
    else
        stageData={
            ['camPosition']={x=640,y=500},
            ['defaultZoom']=0.7,
            ['boyfriend']={x=800, y=200},
            ['opponent']={x=-300, y=200},
        }
        makeSprite('Trees', 'stages/vee-funkin/Trees', -850, -300,false)
        makeSprite('Grass', 'stages/vee-funkin/Grass', -1500, 800,false)
        makeSprite('Bushes', 'stages/vee-funkin/Bushes', -650, 530,false)

        setLuaScrollFactor('Grass', 1, 1);
        setLuaScrollFactor('Bushes', 1.1, 1);
        setLuaScrollFactor('Trees', 1.25, 1);
    end
    setStages(stageData)
end

function setStages(stageData)
    camPosition={x=stageData['camPosition'].x,y=stageData['camPosition'].y}
    local defaultZoom=stageData['defaultZoom']
    local boyfriend={x=stageData['boyfriend'].x,y=stageData['boyfriend'].y}
    local dad={x=stageData['opponent'].x,y=stageData['opponent'].y}

    setProperty('defaultCamZoom',defaultZoom)
    setPosition('boyfriend',boyfriend.x,boyfriend.y)
    setPosition('dad',dad.x,dad.y)
end

function onUpdate(elapsed)
    setPosition('camFollow',camPosition.x,camPosition.y)
end

function stageReset(name)
    for i, v in ipairs(nowStageSprites) do removeLuaSprite(v, false) end
    stageSelect(name)
end

function makeSprite(tag,image,x,y,front)
    makeLuaSprite(tag, image, x, y)
    table.insert(nowStageSprites,tag)
    addLuaSprite(tag,front)
end

function setPosition(tag,x,y)
    setProperty(tag..'.x',x)
    setProperty(tag..'.y',y)
end

function setLuaScrollFactor(tag,x,y)
    setProperty(tag..'.scrollFactor.x',x)
    setProperty(tag..'.scrollFactor.y',y)
end