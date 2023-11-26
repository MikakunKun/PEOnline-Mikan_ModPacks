local sin = math.sin
local floor = math.floor
local tau = math.pi * 2

--

local origin = {x = 0, y = 0}

--

function onCreatePost()
	origin = {x = defaultOpponentX, y = defaultOpponentY}
	
	makeLuaSprite("denja_flying_offs", "", 0, 0)
	makeLuaSprite("denja_flying_offs_scale", "", 0, 0)
	
	makeAnimatedLuaSprite("denja_flying_eyes", "characters/denja_flying_eyes", origin.x, origin.y)
	addAnimationByPrefix("denja_flying_eyes", "idle", "idle", 24, false)
	addOffset("denja_flying_eyes", "idle", 0, 0)
	addAnimationByPrefix("denja_flying_eyes", "idle-loop", "idle-loop", 24, true)
	addOffset("denja_flying_eyes", "idle-loop", 0, 0)
	addAnimationByPrefix("denja_flying_eyes", "singLEFT", "singLEFT", 24, false)
	addOffset("denja_flying_eyes", "singLEFT", 150, 22)
	addAnimationByPrefix("denja_flying_eyes", "singDOWN", "singDOWN", 24, false)
	addOffset("denja_flying_eyes", "singDOWN", -2, -28)
	addAnimationByPrefix("denja_flying_eyes", "singUP", "singUP", 24, false)
	addOffset("denja_flying_eyes", "singUP", -9, 101)
	addAnimationByPrefix("denja_flying_eyes", "singRIGHT", "singRIGHT", 24, false)
	addOffset("denja_flying_eyes", "singRIGHT", -59, 40)
	addAnimationByPrefix("denja_flying_eyes", "die_already", "die_already", 24, false)
	addOffset("denja_flying_eyes", "die_already", -2, 82)
	setBlendMode("denja_flying_eyes", "add")
	setProperty("denja_flying_eyes.alpha", 0.00001)
	addLuaSprite("denja_flying_eyes", true)
	
	setObjectOrder("boyfriendGroup", getObjectOrder("denja_flying_eyes") + 1)
end

function onUpdatePost()
	local song_pos = getSongPosition() / 1000
	
	local depth = sin((song_pos * 2.8) % tau)
	setProperty("dadGroup.x", origin.x + sin((song_pos * 1.5) % tau) * 15 - depth * 8 + getProperty("denja_flying_offs.x"))
	setProperty("dadGroup.y", origin.y + sin((song_pos * 3) % tau) * 20 - depth * 32 + getProperty("denja_flying_offs.y"))
	setProperty("dadGroup.scale.x", 0.8 + depth * 0.025 + getProperty("denja_flying_offs_scale.x"))
	setProperty("dadGroup.scale.y", 0.8 + depth * 0.025 + getProperty("denja_flying_offs_scale.y"))
	setScrollFactor("dadGroup", 0.65 + depth * 0.02, 0.8 + depth * 0.02)
	
	playAnim("denja_flying_eyes", getProperty("dad.animation.name") or "idle", true, false, getProperty("dad.animation.curAnim.curFrame") or 0)
	setProperty("denja_flying_eyes.x", getProperty("dadGroup.x"))
	setProperty("denja_flying_eyes.y", getProperty("dadGroup.y"))
	setProperty("denja_flying_eyes.scale.x", getProperty("dadGroup.scale.x"))
	setProperty("denja_flying_eyes.scale.y", getProperty("dadGroup.scale.y"))
	setScrollFactor("denja_flying_eyes", 0.65 + depth * 0.02, 0.8 + depth * 0.02)
end