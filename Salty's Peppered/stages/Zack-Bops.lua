function onCreate()
	-- background shit
	makeLuaSprite('ophee-sky', 'Zack-Bees/ophee-sky', -600, -1000);
	setLuaSpriteScrollFactor('ophee-sky', 0.2, 0.2);
        scaleObject('ophee-sky', 0.4, 0.4);
	
	makeLuaSprite('mountains', 'Zack-Bees/mountains', -1000, -600);
	setLuaSpriteScrollFactor('mountains', 0.4, 0.4);
	scaleObject('mountains', 0.5, 0.5);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('back-light', 'Zack-Bees/', -1200, -600);
		setLuaSpriteScrollFactor('back-light', 0.6, 0.6);
		scaleObject('back-light', 1, 1);
		
		makeLuaSprite('ground', 'Zack-Bees/ground', -1600, -600);
		setLuaSpriteScrollFactor('ground', 1, 1);
		scaleObject('ground', 0.6, 0.6);

		makeLuaSprite('front-sign', 'Zack-Bees/front-sign', -1900, -600);
		setLuaSpriteScrollFactor('front-sign', 1.8, 1.8);
		scaleObject('front-sign', 0.7, 0.7);
		
		makeLuaSprite('vignette', 'Zack-Bees/vignette', -1900, -600);
		setLuaSpriteScrollFactor('vignette', 1.8, 1.8);
		scaleObject('vignette', 12, 12);

               makeAnimatedLuaSprite('light', 'mall2/light', -600, -1000);
        setLuaSpriteScrollFactor('light', 1, 1);
        scaleObject('light', 2, 2); 

	end

	addLuaSprite('ophee-sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('back', false);
	addLuaSprite('ground', false);
	addLuaSprite('front-sign', true);
	addLuaSprite('vignette', true);

end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);

    end
end