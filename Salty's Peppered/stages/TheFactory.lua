function onCreate()
	-- background shit
        makeAnimatedLuaSprite('factoryBricksnPipes', 'factoryNew/factoryBricksnPipes', -2200, -340);
        setLuaSpriteScrollFactor('factoryBricksnPipes', 0.5, 0.5);
        scaleObject('factoryBricksnPipes', 1.4, 1.6);
        
        makeAnimatedLuaSprite('Lights', 'factoryNew/Lights', -2200, -340);
        setLuaSpriteScrollFactor('Lights', 0.6, 0.6);
        scaleObject('Lights', 1.4, 1.4);
		
		makeAnimatedLuaSprite('conveyor3', 'factoryNew/conveyor3', -300, -500);
        setLuaSpriteScrollFactor('conveyor3', 0.5, 0.5);
        scaleObject('conveyor3', 1.3, 1.3)
		
		makeAnimatedLuaSprite('conveyor1', 'factoryNew/conveyor1', -2000, 0);
        setLuaSpriteScrollFactor('conveyor1', 0.5, 0.5);
        scaleObject('conveyor1', 1.8, 1.3);
		
		makeAnimatedLuaSprite('conveyor2', 'factoryNew/conveyor2', -2000, 300);
        setLuaSpriteScrollFactor('conveyor2', 0.5, 0.5);
        scaleObject('conveyor2', 1.8, 1.3);
		
		makeAnimatedLuaSprite('Boogie', 'factoryNew/Boogie', -3000, -300);
        setLuaSpriteScrollFactor('Boogie', 0.5, 0.5);
        scaleObject('Boogie', 1.3, 1.3);
		
		
        makeAnimatedLuaSprite('tunnelRail', 'tunnel/tunnelRail', -1200, 100);
        setLuaSpriteScrollFactor('tunnelRail', 0.8, 0.8);
        scaleObject('tunnelRail', 2.2, 1.2);
        
	makeAnimatedLuaSprite('Minecart', 'tunnel/Minecart', -600, -70);
        setLuaSpriteScrollFactor('Minecart', 1, 1);
        scaleObject('Minecart', 1.4, 1.3);
  
        makeLuaSprite('minecartFront', 'tunnel/minecartFront', -600, 0);
        setLuaSpriteScrollFactor('minecartFront', 1, 1);
        scaleObject('minecartFront', 1.4, 1.3);

        makeLuaSprite('vigne', 'tunnel/vignette', -500, -20);
        setLuaSpriteScrollFactor('vignette', 1, 1);
        scaleObject('vignette', 1.8, 1.8);

        makeAnimatedLuaSprite('tunnelLight', 'tunnel/tunnelLight', -400, -20);
        setLuaSpriteScrollFactor('tunnelLight', 1, 1);
        scaleObject('tunnelLight', 1.6, 1.2);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
        makeAnimatedLuaSprite('light-retro', 'light-retro', -1300, -700);
        setLuaSpriteScrollFactor('light-retro', 1, 1);
        scaleObject('light-retro', 2, 2);
	end
	
        addLuaSprite('factoryBricksnPipes', false);
        addLuaSprite('Lights', false);
		addAnimationByPrefix('Lights', 'LG', 'LG', 24, true);
		addLuaSprite('conveyor3', false);
		addAnimationByPrefix('conveyor3', 'BOX3', 'BOX3', 24, true);
		addLuaSprite('conveyor2', false);
		addAnimationByPrefix('conveyor2', 'BOX2', 'BOX2', 24, true);
		addLuaSprite('conveyor1', false);
		addAnimationByPrefix('conveyor1', 'BOX1', 'BOX1', 24, true);
		addLuaSprite('Boogie', false);
		addAnimationByPrefix('Boogie', 'DANCE', 'DANCE', 24, true);
	    addAnimationByPrefix('factoryBricksnPipes', 'BG', 'BG', 24, true);
        addLuaSprite('tunnelRail', false);
	addAnimationByPrefix('tunnelRail', 'idle', 'idle', 24, true);
	addLuaSprite('Minecart', false);
	addAnimationByPrefix('Minecart', 'idle', 'idle', 20, true);
        addLuaSprite('minecartFront', true);
        addLuaSprite('vignette', true);
        addLuaSprite('tunnelLigt', true);
        addAnimationByPrefix('tunnelLight', 'idle', 'idle', 20, true);

   end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end
