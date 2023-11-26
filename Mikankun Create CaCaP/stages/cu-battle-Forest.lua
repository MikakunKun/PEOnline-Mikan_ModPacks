function onCreate()
	-- background stuff

	makeLuaSprite('Trees', 'stages/vee-funkin/Trees', -850, -300);
        addLuaSprite('Trees', false)

	makeLuaSprite('Grass', 'stages/vee-funkin/Grass', -1500, 800);
        addLuaSprite('Grass', false)

	makeLuaSprite('Bushes', 'stages/vee-funkin/Bushes', -650, 530);
        addLuaSprite('Bushes', false)

	setLuaSpriteScrollFactor('Grass', 1, 1);
        setLuaSpriteScrollFactor('Bushes', 1.1, 1);
        setLuaSpriteScrollFactor('Trees', 1.25, 1);

end