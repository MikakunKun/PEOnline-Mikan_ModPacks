function onCreate()
	-- background stuff

	makeLuaSprite('Volcan-BG', 'Volcan-BG', -1500, -500);
        addLuaSprite('Volcan-BG', false)

	makeLuaSprite('Volcan-Cano', 'Volcan-Cano', -1000, -1000);
        addLuaSprite('Volcan-Cano', false)

	makeLuaSprite('Volcan-Ground', 'Volcan-Ground', -1500, 1000);
        addLuaSprite('Volcan-Ground', false)

	makeLuaSprite('Volcan-Smoke', 'Volcan-Smoke', -1500, 530);
        addLuaSprite('Volcan-Smoke', true)

        makeAnimatedLuaSprite('Volcan-Lava', 'Volcan-Lava', -1000, -270)
	addAnimationByPrefix('Volcan-Lava','Volcan-Lava','Volcan-Lava', 24, true)
        addLuaSprite('Volcan-Lava',false);
	objectPlayAnimation('Volcan-Lava', 'Volcan-Lava', true);

	setLuaSpriteScrollFactor('Volcan-Ground', 1, 1);
        setLuaSpriteScrollFactor('Volcan-Cano', 1.1, 1);
        setLuaSpriteScrollFactor('Volcan-Lava', 1.1, 1);
        setLuaSpriteScrollFactor('Volcan-BG', 1.25, 1);


end