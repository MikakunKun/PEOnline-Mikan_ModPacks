local yourStep = 800;

local myStep = 1072;


function onCreate()

	makeLuaSprite('flash', 'White Screen', 0, 0);
	setObjectCamera('flash', 'other');
	setScrollFactor('flash', 0, 0);

	setPropertyFromClass('states.GameOverSubstate', 'characterName', 'patirisu-bf');
	setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');


	makeLuaSprite('pixel2', 'MapPixel2', -700, -600); --edit the X and Y values
	setProperty('pixel2.antialiasing', false);
	scaleObject('pixel2', 2, 2)

end



function onUpdate(elapsed)

	if curStep == yourStep then
	    removeLuaSprite('Trueback', false);
	    removeLuaSprite('Back', false);
	    removeLuaSprite('Mid', false);
	    removeLuaSprite('Front', true);
		addLuaSprite('pixel2', false);
		addLuaSprite('pixel1', true);
	    setPropertyFromClass('states.GameOverSubstate', 'characterName', 'patirisu-bf');
	    setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	    setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	    setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');
		addLuaSprite('flash', true);
		doTweenAlpha('flashin', 'flash', 0, 1, 'linear');

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'PIXELNOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'PIXELNOTE_assets');
	    end
	end

	if curStep == yourStep - 16 then

        for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
		    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Swift Note' then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Swift_Note_Pixel_assets');
		    	    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Swift_Splash_Pixel_assets');
			else
		        setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXELNOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'PIXELnoteSplashes');
			end
        end
	end

	if curStep == myStep then
	    removeLuaSprite('pixel1', false);
		removeLuaSprite('pixel2', true);
	    addLuaSprite('Trueback', false);
	    addLuaSprite('Back', false);
	    addLuaSprite('Mid', false);
	    addLuaSprite('Front', true);
	    setPropertyFromClass('states.GameOverSubstate', 'characterName', 'patirisu-bf');
	    setPropertyFromClass('states.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	    setPropertyFromClass('states.GameOverSubstate', 'loopSoundName', 'gameOver');
	    setPropertyFromClass('states.GameOverSubstate', 'endSoundName', 'gameOverEnd');
		makeLuaSprite('flash', 'White Screen', 0, 0);
		setObjectCamera('flash', 'other');
		setScrollFactor('flash', 0, 0);

		addLuaSprite('flash', true);
		doTweenAlpha('flashin', 'flash', 0, 1, 'linear');


	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == myStep - 16 then
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Swift Note' then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Swift_Note_assets');
		    	    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Swift_Splash_assets');
			else
		        setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
			        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'noteSplashes');
			end
        end
	end
end
