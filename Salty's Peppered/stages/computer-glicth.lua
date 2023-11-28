function onCreate()
	-- background shit
	makeLuaSprite('bg-computer', 'computer/bg-computer', -500, -250);
	setLuaSpriteScrollFactor('bg-computer', 0.1, 0.1);
        scaleObject('bg-computer', 3, 3);
		
		makeLuaSprite('fg', 'computer/fg', -500, -250);
	setLuaSpriteScrollFactor('fg', 0.3, 0.3);
        scaleObject('fg', 1.7, 1.3);

        makeAnimatedLuaSprite('DSBack', 'computer/DSBack', -1000, -750);
	setLuaSpriteScrollFactor('DSBack', 0.1, 0.1);
        scaleObject('DSBack', 7, 7);
	
	makeAnimatedLuaSprite('particle-column', 'computer/particle-column', -900, -250);
	setLuaSpriteScrollFactor('particle-column', 0.6, 0.6);
	scaleObject('particle-column', 12, 12);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
		makeLuaSprite('stagelight_right', 'Tutorial/stage_light', 1225, -100);
		setLuaSpriteScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setPropertyLuaSprite('stagelight_right', 'flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'Tutorial/stagecurtains', -500, -300);
		setLuaSpriteScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);

        makeAnimatedLuaSprite('GlitchFront', 'computer/GlitchFront', -500, -550);
	setLuaSpriteScrollFactor('GlitchFront', 0, 0);
        scaleObject('GlitchFront', 15, 15);

               makeAnimatedLuaSprite('light', 'mall2/light', -1300, -700);
        setLuaSpriteScrollFactor('light', 0.1, 0.1);
        scaleObject('light', 2, 2); 

	end

	addLuaSprite('bg-computer', false);
	addLuaSprite('fg', false);
        addLuaSprite('DSBack', false)
	addAnimationByPrefix('DSBack','Move', 'DSBack Anim', 2, true);
	addLuaSprite('particle-column', false);
	addAnimationByPrefix('particle-column','Move', 'PETALS ALL0', 24, true);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);


end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);

    end
end