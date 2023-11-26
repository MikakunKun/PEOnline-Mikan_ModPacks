local code16 = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}

function onCreate()
    --addHaxeLibrary('FunkinLua')
    runHaxeCode([[
        /*
        var folder = Paths.mods('Mikankun Create Charts and Covers' + '/custom_events/');
        var file = 'PhillyGlowLua';
        game.luaArray.push(new FunkinLua(folder + file));
        game.filesPushed.push(file);
        */
    ]])
    --addLuaScript('Mikankun Create Charts and Covers/custom_events/PhillyGlowLua')
end

function onCreatePost()
    --setProperty('boyfriend.color', getColorFromHex('0B'..'A1'..'FA'))
    for i = 0,getProperty('luaArray.length')-1 do
        --debugPrint(getProperty('luaArray['..i..'].scriptName'))
    end
    --setProperty('healthTxt.y',getProperty('scoreTxt.y')+getProperty('scoreTxt.size'))
end

---
--- @param elapsed float
---
function onUpdate(elapsed)
end

function aonBeatHit()
    if curBeat % 2 == 0 then
        --code = (code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)])
        code = ''
        for i=1,6 do
            code = code..code16[getRandomInt(1, #code16)]
            if i == 6 then
                code:gsub('0', code16[getRandomInt(2, #code16)])
            end
        end
        string.reverse(code)
        if curBeat == 2 then
            triggerEvent('PhillyGlowLua', '1', code)
        else
            triggerEvent('PhillyGlowLua', '2', code)
        end
    end
end

function onDestroy()
    removeLuaScript('Mikankun Create Charts and Covers/custom_events/PhillyGlowLua')
end

function aopponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not mustHitSection then
        code = (code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)])
        triggerEvent('PhillyGlowLua', '0', code)
        triggerEvent('PhillyGlowLua', '1', code)
    end
end

function agoodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if mustHitSection then
        code = (code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)]..code16[getRandomInt(1, 16)])
        triggerEvent('PhillyGlowLua', '0', code)
        triggerEvent('PhillyGlowLua', '1', code)
    end
end