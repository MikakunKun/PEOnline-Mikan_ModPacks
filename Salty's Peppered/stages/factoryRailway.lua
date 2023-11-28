function onCreate()
	-- background shit
        makeAnimatedLuaSprite('tunnelWalls', 'tunnel/tunnelWalls', -300, -80);
        setLuaSpriteScrollFactor('tunnelWalls', 0.6, 0.6);
        scaleObject('tunnelWalls', 1.4, 1);
        
        makeLuaSprite('thePipes', 'tunnel/bgPipes', -389800, -80);
        setLuaSpriteScrollFactor('thePipes', 0.6, 0.6);
        scaleObject('thePipes', 1, 1);
        setProperty('thePipes.visible', true)
 
        makeAnimatedLuaSprite('tunnelRail', 'tunnel/tunnelRail', -300, -100);
        setLuaSpriteScrollFactor('tunnelRail', 0.8, 0.8);
        scaleObject('tunnelRail', 1.6, 1.2);
        
	makeAnimatedLuaSprite('Minecart', 'tunnel/Minecart', -600, -150);
        setLuaSpriteScrollFactor('Minecart', 1, 1);
        scaleObject('Minecart', 1.4, 1.3);
  
        makeLuaSprite('minecartFront', 'tunnel/minecartFront', -600, 0);
        setLuaSpriteScrollFactor('minecartFront', 1, 1);
        scaleObject('minecartFront', 1.4, 1.3);

        makeLuaSprite('vignette', 'tunnel/vignette', -500, -80);
        setLuaSpriteScrollFactor('vignette', 1, 1);
        scaleObject('vignette', 1.8, 1.8);

        makeAnimatedLuaSprite('tunnelLight', 'tunnel/tunnelLight', -400, -80);
        setLuaSpriteScrollFactor('tunnelLight', 1, 1);
        scaleObject('tunnelLight', 1.6, 1.2);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
        makeAnimatedLuaSprite('light', 'mall2/light', -1300, -700);
        setLuaSpriteScrollFactor('light', 1, 1);
        scaleObject('light', 2, 2);
	end
	
        addLuaSprite('tunnelWalls', false);
        addLuaSprite('thePipes', false);
	addAnimationByPrefix('tunnelWalls', 'idle', 'idle', 24, true);
        addLuaSprite('tunnelRail', false);
	addAnimationByPrefix('tunnelRail', 'idle', 'idle', 24, true);
	addLuaSprite('Minecart', false);
	addAnimationByPrefix('Minecart', 'idle', 'idle', 20, true);
        addLuaSprite('minecartFront', true);
        addLuaSprite('vignette', true);
        addLuaSprite('tunnelLight', true);
        addAnimationByPrefix('tunnelLight', 'idle', 'idle', 20, true);
       


   end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
   end
end