function onCreate()
	makeLuaSprite("sky", "forest/sky", -350, -240)
	scaleObject("sky", 0.75, 0.75)
	setScrollFactor("sky", 0.1, 0.1)
	addLuaSprite("sky", false)
	
	makeAnimatedLuaSprite("trees", "forest/trees", -790, -810)
	addAnimationByPrefix("trees", "default", "default", 12, true)
	scaleObject("trees", 0.9, 1.05)
	setScrollFactor("trees", 0.5, 1)
	addLuaSprite("trees", false)
	
	makeAnimatedLuaSprite("brush_2", "forest/brush_2", -820, -360)
	addAnimationByPrefix("brush_2", "default", "default", 13, true)
	scaleObject("brush_2", 0.9, 1)
	setScrollFactor("brush_2", 0.7, 0.975)
	addLuaSprite("brush_2", false)
	
	makeAnimatedLuaSprite("brush_1", "forest/brush_1", -960, 00)
	addAnimationByPrefix("brush_1", "default", "default", 14, true)
	scaleObject("brush_1", 0.95, 1)
	setScrollFactor("brush_1", 0.85, 1)
	addLuaSprite("brush_1", false)
end

function onUpdatePost()
	setProperty("trees.angle", -getProperty("camFollow.x") / 220)
	setProperty("brush_2.angle", -getProperty("camFollow.x") / 240)
	setProperty("brush_1.angle", -getProperty("camFollow.x") / 260)
end