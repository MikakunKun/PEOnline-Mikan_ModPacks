function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end


function onCreatePost()
	luaDebugMode=true
makeAnimatedLuaSprite('HBA', 'healthBarAnim', 0, 0)
addAnimationByPrefix('HBA', 'moven', 'healthmove', 24, true)
setObjectCamera('HBA', 'hud')
addLuaSprite('HBA', false)
setObjectOrder('healthBar.bg', 1)
setObjectOrder('healthBar.leftBar', 1)
setObjectOrder('healthBar.rightBar', 1)
setObjectOrder('HBA', 100)
setObjectOrder('iconP1', 101)
setObjectOrder('iconP2', 102)
end



function onUpdate(elapsed)
setProperty('HBA.x', getProperty('healthBar.bg.x'))
setProperty('HBA.y', getProperty('healthBar.bg.y'))
setProperty('HBA.alpha', getProperty('healthBar.bg.alpha'))
setProperty('HBA.visible', getProperty('healthBar.bg.visible'))
setProperty('HBA.angle', getProperty('healthBar.bg.angle'))

setProperty('HBA.offset.x', getProperty('healthBar.bg.offset.x'))
setProperty('HBA.offset.y', getProperty('healthBar.bg.offset.y'))
end