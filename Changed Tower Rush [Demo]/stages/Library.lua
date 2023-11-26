function onCreate()
	makeLuaSprite('stage1', 'stages/Library/Library-BG', -500, 0)
	addLuaSprite('stage1')
	
	makeLuaSprite('stage10', 'stages/Library/Library-FG', -500, 0)
	setScrollFactor('stage10', 0.8, 0.8)
	addLuaSprite('stage10', true)
end