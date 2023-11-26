function onCreate()
    -- background stuff

    makeLuaSprite('Sky', 'PerkieBG/Sky', -1300, -450);
        addLuaSprite('Sky', false)

    makeLuaSprite('Hills', 'PerkieBG/Hills', -1300, 50);
        addLuaSprite('Hills', false)

        makeAnimatedLuaSprite('Waterfall', 'PerkieBG/Waterfall', 100, 50)
    addAnimationByPrefix('Waterfall','Waterfall','Waterfall', 24, true)
    objectPlayAnimation('Waterfall', 'Waterfall');
        addLuaSprite('Waterfall', false);

    makeLuaSprite('Ground', 'PerkieBG/Ground', -1500, 600);
        addLuaSprite('Ground', false)

    makeLuaSprite('Trees', 'PerkieBG/Trees', -700, -0);
        addLuaSprite('Trees', false)

    makeLuaSprite('BehindBush', 'PerkieBG/BehindBush', -100, 200);
        addLuaSprite('BehindBush', false)

    makeLuaSprite('BigBush', 'PerkieBG/BigBush', 100, 200);
        addLuaSprite('BigBush', false)

        makeAnimatedLuaSprite('The Sun', 'PerkieBG/The Sun', 1000, -200)
    addAnimationByPrefix('The Sun','The Sun','The Sun', 24, false)
    objectPlayAnimation('The Sun', 'The Sun');
        addLuaSprite('The Sun', false);



        makeAnimatedLuaSprite('Aminals', 'PerkieBG/Aminals', 1200, 400)
    addAnimationByPrefix('Aminals','Aminals','Aminals', 24, false)
    objectPlayAnimation('Aminals', 'Aminals');
        addLuaSprite('Aminals', false);

        makeAnimatedLuaSprite('Bs', 'PerkieBG/Bs', 1300, 450)
    addAnimationByPrefix('Bs','Bs','Bs', 24, true)
    objectPlayAnimation('Bs', 'Bs');
        addLuaSprite('Bs', false);


    makeLuaSprite('Bushels', 'PerkieBG/Bushels', -650, 800);
        addLuaSprite('Bushels', false)


    makeLuaSprite('Rock', 'PerkieBG/Rock', -1200, 700);
        addLuaSprite('Rock', false)

        setLuaSpriteScrollFactor('Sky', 1, 1);
        setLuaSpriteScrollFactor('Hils', 1, 1);
        setLuaSpriteScrollFactor('Waterfall', 1, 1);
        setLuaSpriteScrollFactor('Ground', 1, 1);
        setLuaSpriteScrollFactor('Trees', 1, 1);
        setLuaSpriteScrollFactor('Behind Bush', 1.08, 1);
        setLuaSpriteScrollFactor('BigBush', 1, 1);
        setLuaSpriteScrollFactor('Flores', 1, 1);
        setLuaSpriteScrollFactor('Aminals', 1.1, 1);
        setLuaSpriteScrollFactor('Bs', 1.1, 1);
        setLuaSpriteScrollFactor('Bushels', 1.09, 1);
        setLuaSpriteScrollFactor('The Sun', 1, 1);
        setLuaSpriteScrollFactor('Rock', 1.1, 1);

    setObjectOrder('BigBush', 6);
    setObjectOrder('gfGroup', 7);
    setObjectOrder('gfGroup', 7);
    setObjectOrder('Bushels', 9);

end


function onBeatHit()
    if curBeat % 2 == 0 then
            objectPlayAnimation('Aminals', 'Aminals');
            objectPlayAnimation('Flores', 'Flores');
            objectPlayAnimation('The Sun', 'The Sun');
    end
end