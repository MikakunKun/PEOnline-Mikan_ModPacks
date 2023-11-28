function onCreate()
	-- background shit
	makeLuaSprite('sky', 'Zack-Bees/sky', -1600, -1000);
	setLuaSpriteScrollFactor('sky', 0.2, 0.2);
        scaleObject('sky', 0.7, 0.7);
	
	makeLuaSprite('mountains', 'Zack-Bees/mountains', -1000, -600);
	setLuaSpriteScrollFactor('mountains', 0.4, 0.4);
	scaleObject('mountains', 0.5, 0.5);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('back-light', 'Zack-Bees/back-light', -1200, -600);
		setLuaSpriteScrollFactor('back-light', 0.6, 0.6);
		scaleObject('back-light', 1, 1);
		
		makeLuaSprite('ground', 'Zack-Bees/ground', -1600, -600);
		setLuaSpriteScrollFactor('ground', 1, 1);
		scaleObject('ground', 0.6, 0.6);

           makeAnimatedLuaSprite('ManagerExe', 'Zack-Bees/ManagerExe', -700, 400);
		setLuaSpriteScrollFactor('ManagerExe', 1, 1);
		scaleObject('ManagerExe', 1.1, 1.1);

		makeLuaSprite('front-sign', 'Zack-Bees/front-sign', -1900, -600);
		setLuaSpriteScrollFactor('front-sign', 1.8, 1.8);
		scaleObject('front-sign', 0.7, 0.7);
		
		makeLuaSprite('vignette', 'Zack-Bees/vignette', -1900, -600);
		setLuaSpriteScrollFactor('vignette', 1.8, 1.8);
		scaleObject('vignette', 12, 12);

               makeAnimatedLuaSprite('light', 'mall2/light', -1300, -700);
        setLuaSpriteScrollFactor('light', 1, 1);
        scaleObject('light', 2, 2); 

	end

	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('back-light', false);
	addLuaSprite('ground', false);
        addAnimationByPrefix('ManagerExe','Move','Exe Idle0',24,true)
        addLuaSprite('ManagerExe',false)
	addLuaSprite('front-sign', true);
	addLuaSprite('vignette', true);

end
function onBeatHit()
    objectPlayAnimation('ManagerExe','Move',true)

end