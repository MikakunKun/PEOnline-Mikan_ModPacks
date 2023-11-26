function onCreate()
    luaDebugMode=true
    setProperty('defaultCamZoom',0.93)

    makeLuaSprite('sky','roboStage/sky',-660,-70)
    addLuaSprite('sky')
    scale_set('sky',0.8,0.8)

    flxSprite_anim('buildings',-350,-57,'rolldog/roll_dog_buildings',"loop", "buildings")
    addLuaSprite('buildings')

    makeLuaSprite('bg','rolldog/dog bg',-252,-117)
    addLuaSprite('bg')

    makeLuaSprite('seats','rolldog/bg chairs',0,0)
    addLuaSprite('seats')
    
    flxSprite_anim('wheel',815, 335,'rolldog/wheel crazy',"loop", "wheel")
    setProperty('wheel.visible',false)
end

function onCreatePost()
    for i = 0,getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'noteType', '')
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
            if getPropertyFromGroup('unspawnNotes', i, 'character') ~= 10 then
                setPropertyFromGroup('unspawnNotes', i, 'noteType', 'phone Sing')
                setPropertyFromGroup('unspawnNotes', i, 'character', 0)
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            end
        end
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
            if getPropertyFromGroup('unspawnNotes', i, 'character') == 1 then
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
                setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
                setPropertyFromGroup('unspawnNotes', i, 'noteType', 'dog Sing')
            end
        end
    end

    setProperty('dad.y',320)
    runHaxeCode('game.boyfriend.setPosition(660,-85);')
    setObjectOrder("gfGroup", getObjectOrder('seats'))
    setProperty('gf.x',440)
    setProperty('gf.y',getProperty('gf.y')+10)
    character('arm',590,270,'fever-arm')
    setObjectOrder('wheel',getObjectOrder('arm')+1)
    addLuaSprite('wheel')
    setObjectOrder('boyfriendGroup',getObjectOrder('arm')-1)
    runHaxeCode('getVar("arm").playAnim("wheel",true);')
    
    makeAnimatedLuaSprite('bubble', 'rolldog/bubble', 350,-51)
    addAnimationByPrefix('bubble', "appear", "bubble pop up", 33, false)
    addAnimationByPrefix('bubble', "idle", "bubble0", 24, true)
    addAnimationByPrefix('bubble', "disappear", "bubble pop out", 24, false)
    runHaxeCode([[
        var bubble=game.getLuaObject('bubble',false);

        bubble.animation.finishCallback = function(anim)
        {
            var bubbleIcon=game.getLuaObject('bubbleIcon',false);
            if (anim == "appear")
            {
                bubble.animation.play("idle");
                if (bubbleIcon != null)
                    bubbleIcon.visible = true;
    
                new FlxTimer().start(1.1, function(t)
                {
                    bubble.animation.play("disappear");
                    game.callOnLuas('remove_bubbleIcon',[]);
                });
            }
            else if (anim == "disappear")
            {
                bubble.visible = false;
            }
        }
    ]])
    setProperty('bubble.visible',false)
    setObjectOrder('bubble',getObjectOrder('arm')+2)
    addLuaSprite('bubble')
end

function remove_bubbleIcon()
    removeLuaSprite('bubbleIcon', true)
end

function opponentNoteHit(noteIndex, noteData, noteType, isSustainNote)
    if noteType=='phone Sing' then
        addHaxeLibrary('EKdata','backend')
        runHaxeCode('getVar("arm").playAnim(game.singAnimations[Note.gfxHud[EKdata.mania][Std.int(Math.abs('..noteData..'))]],true);')
    end
end

function goodNoteHit(noteIndex, noteData, noteType, isSustainNote)
    if noteType=='dog Sing' then
        addHaxeLibrary('EKdata','backend')
        runHaxeCode('game.dad.playAnim(game.singAnimations[Note.gfxHud[EKdata.mania][Std.int(Math.abs('..noteData..'))]],true);')
        runHaxeCode('game.dad.holdTimer=0;')
    end
end

function onUpdate(elapsed)
    runHaxeCode('game.camFollow.setPosition(game.gf.getGraphicMidpoint().x + 25, game.gf.getGraphicMidpoint().y);')
    setProperty('arm.holdTimer',0)
    if (getProperty('arm.animation.curAnim.name')=='idle'and getProperty('boyfriend.animation.curAnim.name')=='idle') then
        if (getProperty('arm.animation.curAnim.curFrame')~=getProperty('boyfriend.animation.curAnim.curFrame')) then
            setProperty('arm.animation.curAnim.curFrame',getProperty('boyfriend.animation.curAnim.curFrame'))
        end
    end
end

function onBeatHit()
    if (runHaxeCode('if (getVar("arm").animation.curAnim.name.charAt(0) != "w" && getVar("arm").animation.finished) return true; else return false;')) then
        runHaxeCode('getVar("arm").playAnim("idle");')
    end
end

function flxSprite_anim(tag,x,y,graphic,animName,animJson)
    makeAnimatedLuaSprite(tag, graphic, x, y)
    addAnimationByPrefix(tag, animName, animJson)
    playAnim(tag,animName)
end

function scale_set(tag,x,y)
    setProperty(tag..'.scale.x',x)
    setProperty(tag..'.scale.y',y)
end

function character(tag,x,y,charaName)
    addHaxeLibrary('objects.Character')
    runHaxeCode([[
        var arm = new Character(]]..x..[[,]]..y..[[,"]]..charaName..[[");
        game.add(arm);
        setVar(']]..tag..[[',arm);
    ]])
end