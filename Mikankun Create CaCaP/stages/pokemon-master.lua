local pixel = false
local keybindshow = false
local death = false
function onCreate()
	precacheSound('Flame')
	precacheSound('Thunder')
	makeLuaSprite('PokemonhealthBar', 'vs_reds/red-healthBar', -25, 510);
	setProperty('PokemonhealthBar.scale.x', 0.4)
	setProperty('PokemonhealthBar.scale.y', 0.4)
	if (downscroll) then
		setProperty('PokemonhealthBar.x', -25)
		setProperty('PokemonhealthBar.y', 510)
	else
		setProperty('PokemonhealthBar.x', 250)
		setProperty('PokemonhealthBar.y', 470)
	end
	setObjectCamera('PokemonhealthBar', 'camhud')
	addLuaSprite('PokemonhealthBar', true)

	-- Normal curStage
	makeLuaSprite('redbg', 'vs_reds/fondo_pokemon_1', 0, 0);
	setProperty('redbg.x', 0)
	setProperty('redbg.y', 0)
	setProperty('redbg.antialiasing', true)
	setProperty('redbg.active', false)
	setProperty('redbg.scale.x', 1.2)
	setProperty('redbg.scale.y', 1.2)
	addLuaSprite('redbg', false)
	
	makeAnimatedLuaSprite('chadizard', 'vs_reds/charizard', 650, -250)
	setProperty('chadizard.x', 650)
	setProperty('chadizard.y', -250)
	setProperty('chadizard.scale.x', getProperty('chadizard.scale.x') * 0.7)
	setProperty('chadizard.scale.y', getProperty('chadizard.scale.y') * 0.7)
	addAnimationByPrefix('chadizard', 'idle', 'chari idle', 24, false) 
	addAnimationByPrefix('chadizard', 'atack', 'charizard atack', 24, false)
	setProperty('chadizard.antialiasing', true)
	setProperty('chadizard.visible', true)
	addLuaSprite('chadizard', false)

	makeAnimatedLuaSprite('pikachu', 'vs_reds/pikachu', 1300, 200)
	setProperty('pikachu.x', 1300)
	setProperty('pikachu.y', 200)
	setProperty('pikachu.scale.x', getProperty('pikachu.scale.x') * 0.7)
	setProperty('pikachu.scale.y', getProperty('pikachu.scale.y') * 0.7)
	addAnimationByPrefix('pikachu', 'idle', 'PIKACHU IDLE', 24, false) 
	addAnimationByPrefix('pikachu', 'atack', 'pikaatack', 24, false)
	setProperty('pikachu.antialiasing', true)
	setProperty('pikachu.visible', true)
	addLuaSprite('pikachu', true)
end
function onStartCountdown()
	if (getPropertyFromClass('ClientPrefs', 'showKeybindsOnStart') == true) then
		keybindshow = true
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', false)
	else
		keybindshow = false
	end
end

function onPause()
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
end

function onEndSong()
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
end

function onCountdownStarted()
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
end

function onCreatePost()
	addHaxeLibrary('FlxRect', 'flixel.math');
	addHaxeLibrary('Note');

	setHealth(2)
	setCharacterX('boyfriend', 70)
	setCharacterY('boyfriend', 570)

	setCharacterX('dad', 1130)
	setCharacterY('dad', -150)

	setProperty('boyfriend.scale.x', 1.3)
	setProperty('boyfriend.scale.y', 1.3)

	setProperty('dad.scale.x', 0.8)
	setProperty('dad.scale.y', 0.8)

	for i=0,mania do
		setPropertyFromGroup('playerStrums',i,'x',_G['defaultOpponentStrumX'..i])
		setPropertyFromGroup('opponentStrums',i,'x',-114514)
	end
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			for i=0,mania do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'pixel_NOTE_assets'); --Change texture
				setPropertyFromGroup('playerStrums', i, 'texture', 'pixel_NOTE_assets'); --Change texture
				runHaxeCode([[
					game.opponentStrums.members[]]..i..[[].reloadNote();
					game.playerStrums.members[]]..i..[[].reloadNote();
				]])
			end
			pixel = true
			setProperty('defaultCamZoom', 0.9);
			setCharacterX('boyfriend', 170)
			setCharacterY('boyfriend', 500)

			setProperty('boyfriend.scale.x', 1)
			setProperty('boyfriend.scale.y', 1)

			setProperty('redbg.visible', false)
			setProperty('chadizard.visible', false)
			setProperty('pikachu.visible', false)

			setProperty('pixelbg.visible', true)
			setProperty('pixelchadizard.visible', true)
			setProperty('pixelpikachu.visible', true)
		end
		if (value2 == 'bf-pokemon-master') then
			for i=0,mania do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets'); --Change texture
				setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets'); --Change texture
				runHaxeCode([[
					game.opponentStrums.members[]]..i..[[].reloadNote();
					game.playerStrums.members[]]..i..[[].reloadNote();
				]])
			end
			pixel = false
			setProperty('defaultCamZoom', 0.7);
			setProperty('boyfriend.scale.x', 1.3)
			setProperty('boyfriend.scale.y', 1.3)
			setCharacterX('boyfriend', 70)
			setCharacterY('boyfriend', 570)

			setProperty('redbg.visible', true)
			setProperty('chadizard.visible', true)
			setProperty('pikachu.visible', true)

			setProperty('pixelbg.visible', false)
			setProperty('pixelchadizard.visible', false)
			setProperty('pixelpikachu.visible', false)
		end
		if (value2 == 'pixel-red-pokemon-master') then
			setCharacterX('dad', 1130)
			setCharacterY('dad', -50)

			setProperty('dad.scale.x', 0.8)
			setProperty('dad.scale.y', 0.8)
		end
		if (value2 == 'red-pokemon-master') then
			setCharacterX('dad', 1130)
			setCharacterY('dad', -150)

			setProperty('dad.scale.x', 0.8)
			setProperty('dad.scale.y', 0.8)
		end
	end
end

function onUpdate(elapsed)
	if not death then
		if mustHitSection == false then
			if (not pixel) then
				setProperty('camFollow.y', getMidpointY('dad') + 230)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			else
				setProperty('camFollow.y', getMidpointY('dad') + 120)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			end
		end
		if mustHitSection == true then
			if (not pixel) then
				setProperty('camFollow.y', getMidpointY('dad') + 230)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			else
				setProperty('camFollow.y', getMidpointY('dad') + 120)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			end
		end
	end
	setProperty('healthBarBG.visible', false)

	setHealthBarColors('FF0000', '66FF33')
	setProperty('showRating',false)
	setProperty('showComboNum',false)
	setObjectCamera('healthBar', 'camhud')
	setProperty('healthBar.scale.x', 0.4)
	setProperty('healthBar.scale.y', 0.4)

	setProperty('healthBar.x', getProperty('PokemonhealthBar.x') + 223)
	setProperty('healthBar.y', getProperty('PokemonhealthBar.y') + 86)
end

function onUpdatePost(elapsed)
	if getProperty('chadizard.animation.curAnim.name') == 'idle' then
		setProperty('chadizard.offset.x',0)
		setProperty('chadizard.offset.y',0)
		
	
	elseif getProperty('chadizard.animation.curAnim.name') == 'atack' then
		setProperty('chadizard.offset.x',300)
		setProperty('chadizard.offset.y',30)
	end
end

function onBeatHit()
    if ((curBeat % 2) == 0) then
        if (getHealth() <= 0.5 and getHealth() > 0) then
            playSound('lowhp', 1)
        end
        -- if not (getProperty('chadizard.animation.curAnim.name') ~= 'idle' and not getProperty('chadizard.animation.curAnim.finished')) then
        if not (not getProperty('chadizard.animation.curAnim.finished')) then
            objectPlayAnimation('chadizard','idle');
        end
        -- if not (getProperty('pikachu.animation.curAnim.name') ~= 'idle' and not getProperty('pikachu.animation.curAnim.finished')) then
        if not (not getProperty('pikachu.animation.curAnim.finished')) then
            objectPlayAnimation('pikachu','idle');
        end
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	NoteHit(noteType)
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	NoteHit(noteType)
end

function NoteHit(noteType)
	if (stringStartsWith(noteType, 'Pika')) then
		objectPlayAnimation('pikachu','atack',true);
	end
	if (stringStartsWith(noteType, 'Liza')) then
		objectPlayAnimation('chadizard','atack',true);
	end
	setHealth(getHealth()-0.023)
end

function onGameOver()
	death = true
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
	setProperty('camFollow.y', getMidpointY('boyfriend') - 100)
	setProperty('camFollow.x', getMidpointX('boyfriend') - 100)
end