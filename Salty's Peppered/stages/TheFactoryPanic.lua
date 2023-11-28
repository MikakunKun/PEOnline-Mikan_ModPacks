function onCreate()
	-- background shit
        makeAnimatedLuaSprite('factoryBricksnPipes', 'factoryNew/factoryBricksnPipes', -2200, -340);
        setLuaSpriteScrollFactor('factoryBricksnPipes', 0.5, 0.5);
        scaleObject('factoryBricksnPipes', 1.4, 1.6);
        
        makeAnimatedLuaSprite('LightsEmergency', 'factoryNew/LightsEmergency', -2200, -340);
        setLuaSpriteScrollFactor('LightsEmergency', 0.6, 0.6);
        scaleObject('LightsEmergency', 1.4, 1.4);
		
		makeAnimatedLuaSprite('conveyor3', 'factoryNew/conveyor3', -300, -500);
        setLuaSpriteScrollFactor('conveyor3', 0.5, 0.5);
        scaleObject('conveyor3', 1.3, 1.3)
		
		makeAnimatedLuaSprite('conveyor1', 'factoryNew/conveyor1', -2000, 0);
        setLuaSpriteScrollFactor('conveyor1', 0.5, 0.5);
        scaleObject('conveyor1', 1.8, 1.3);
		
		makeAnimatedLuaSprite('conveyor2', 'factoryNew/conveyor2', -2000, 300);
        setLuaSpriteScrollFactor('conveyor2', 0.5, 0.5);
        scaleObject('conveyor2', 1.8, 1.3);
		
		makeAnimatedLuaSprite('BoogieScared', 'factoryNew/BoogieScared', -3000, -300);
        setLuaSpriteScrollFactor('BoogieScared', 0.5, 0.5);
        scaleObject('BoogieScared', 1.3, 1.3);
		
		makeAnimatedLuaSprite('BoogieFall1', 'factoryNew/BoogieFall1', -4000, -2200);
        setLuaSpriteScrollFactor('BoogieFall1', 0.5, 0.5);
        scaleObject('BoogieFall1', 1.3, 1.3);
		
		makeAnimatedLuaSprite('BoogieFall2', 'factoryNew/BoogieFall2', -1000, -2200);
        setLuaSpriteScrollFactor('BoogieFall2', 0.5, 0.5);
        scaleObject('BoogieFall2', 1.3, 1.3);
		
		
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

        makeAnimatedLuaSprite('light-sunday', 'light-sunday', -1000, -700);
        setLuaSpriteScrollFactor('light-sunday', 1, 1);
        scaleObject('light-sunday', 4, 4);

        makeAnimatedLuaSprite('Red-Light', 'Zack-Bees/Red-Light', -1000, -700);
        setLuaSpriteScrollFactor('Red-Light', 1, 1);
        scaleObject('Red-Light', 4, 4);
	end
	
        addLuaSprite('factoryBricksnPipes', false);
        addLuaSprite('LightsEmergency', false);
		addAnimationByPrefix('LightsEmergency', 'LG', 'LG', 24, true);
		addLuaSprite('conveyor3', false);
		addAnimationByPrefix('conveyor3', 'BOX3', 'BOX3', 24, true);
		addLuaSprite('conveyor2', false);
		addAnimationByPrefix('conveyor2', 'BOX2', 'BOX2', 24, true);
		addLuaSprite('conveyor1', false);
		addAnimationByPrefix('conveyor1', 'BOX1', 'BOX1', 24, true);
		addLuaSprite('BoogieScared', false);
		addAnimationByPrefix('BoogieScared', 'DANCER', 'DANCER', 46, true);
		addLuaSprite('BoogieFall1', false);
		addAnimationByPrefix('BoogieFall1', 'DANCER FALLING', 'DANCER FALLING', 16, true);
		addLuaSprite('BoogieFall2', false);
		addAnimationByPrefix('BoogieFall2', 'DANCER FALLING 2', 'DANCER FALLING 2', 16, true);
	    addAnimationByPrefix('factoryBricksnPipes', 'BG', 'BG', 24, true);
        addLuaSprite('tunnelRail', false);
	addAnimationByPrefix('tunnelRail', 'idle', 'idle', 24, true);
	addLuaSprite('Minecart', false);
	addAnimationByPrefix('Minecart', 'idle', 'idle', 20, true);
        addLuaSprite('minecartFront', true);
        addLuaSprite('vignette', true);
        addLuaSprite('tunnelLigt', true);
        addAnimationByPrefix('tunnelLight', 'idle', 'idle', 20, true);

addLuaSprite('Red-Light', true)
	addAnimationByPrefix('Red-Light','Move', 'Red-Light Blink0', 23, true); 

   end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end
