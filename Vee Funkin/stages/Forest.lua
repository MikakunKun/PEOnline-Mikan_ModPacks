function onCreate()
	-- background stuff

	makeLuaSprite('Trees', 'Trees', -850, -300);
        addLuaSprite('Trees', false)

	makeLuaSprite('Grass', 'Grass', -1500, 800);
        addLuaSprite('Grass', false)

	makeLuaSprite('Bushes', 'Bushes', -650, 530);
        addLuaSprite('Bushes', false)

	setLuaSpriteScrollFactor('Grass', 1, 1);
        setLuaSpriteScrollFactor('Bushes', 1.1, 1);
        setLuaSpriteScrollFactor('Trees', 1.25, 1);

end