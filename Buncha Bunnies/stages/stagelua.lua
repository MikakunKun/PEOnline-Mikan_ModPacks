function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'Stagestuff/stageback', -600, -300)
	setScrollFactor('stageback', 0.9, 0.9)
	
	makeLuaSprite('stagefront', 'Stagestuff/stagefront', -650, 600)
	setScrollFactor('stagefront', 0.9, 0.9)
	scaleObject('stagefront', 1.1, 1.1)

	makeLuaSprite('Concept', 'Stagestuff/Concept', 520, 120)
	setScrollFactor('Concept', 0.9, 0.9)
	scaleObject('Concept', 0.5, 0.5)
	setObjectCamera('Concept', 'other')
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'Stagestuff/stage_light', -125, -100)
		setScrollFactor('stagelight_left', 0.9, 0.9)
		scaleObject('stagelight_left', 1.1, 1.1)
	
		makeLuaSprite('stagelight_right', 'Stagestuff/stage_light', 1225, -100)
		setScrollFactor('stagelight_right', 0.9, 0.9)
		scaleObject('stagelight_right', 1.1, 1.1)
		setProperty('stagelight_right.flipX', true) --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'Stagestuff/stagecurtains', -500, -300)
		setScrollFactor('stagecurtains', 1.3, 1.3)
		scaleObject('stagecurtains', 0.9, 0.9)
	end

	addLuaSprite('stageback', false)
	addLuaSprite('stagefront', false)
	addLuaSprite('stagelight_left', false)
	addLuaSprite('stagelight_right', false)
	addLuaSprite('stagecurtains', false)
	addLuaSprite('Concept', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end