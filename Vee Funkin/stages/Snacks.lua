function onCreate()
	-- background stuff

	makeLuaSprite('Floor', 'Snacks/Floor', -850, -300);
        addLuaSprite('Floor', false)

	makeLuaSprite('Wall', 'Snacks/Wall', -850, -300);
        addLuaSprite('Wall', false)

	makeLuaSprite('What', 'Snacks/What', -650, 650);
        addLuaSprite('What', true)

	setLuaSpriteScrollFactor('Floor', 1.1, 1);
        setLuaSpriteScrollFactor('Wall', 1.1, 1);
        setLuaSpriteScrollFactor('What', 1.25, 1);

end