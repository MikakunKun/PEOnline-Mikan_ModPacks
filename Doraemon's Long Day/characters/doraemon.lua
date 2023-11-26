local floor = math.floor
local sin = math.sin
local abs = math.abs
local sqrt = math.sqrt
local pi = math.pi

--

local doraemon_head_offs = {
	idle = {x = -395, y = 45},
	singLEFT = {x = -357, y = 25},
	singDOWN = {x = -374, y = -55},
	singUP = {x = -549, y = 122},
	singRIGHT = {x = -530, y = 34}
}

local legs_offs = {x = 220, y = 500}

--

local function step_sin(x, steps)
	return floor(abs(steps * sin(pi * x)) + 0.5) / steps
end

--

function onCreatePost()
	addCharacterToList("doraemon_monochrome", "bf")
	
	makeAnimatedLuaSprite("doraemon_head", "characters/doraemon_head", defaultBoyfriendX, defaultBoyfriendY)
	
	for anim, offs in pairs(doraemon_head_offs) do
		addAnimationByPrefix("doraemon_head", anim, anim, 24, false)
		addOffset("doraemon_head", anim, offs.x, offs.y)
	end
	
	for _, anim in pairs({"LEFT", "DOWN", "UP", "RIGHT"}) do
		addAnimationByPrefix("doraemon_head", "sing" .. anim .. "miss", "miss_sing" .. anim, 24, false)
	end
	
	scaleObject("doraemon_head", 0.93, 0.93)
	setProperty("doraemon_head.alpha", 0.00001)
	addLuaSprite("doraemon_head", true)
	
	makeAnimatedLuaSprite("doraemon_legs", "characters/doraemon_legs", getProperty("boyfriendGroup.x") + legs_offs.x, getProperty("boyfriendGroup.y") + legs_offs.y)
	addAnimationByPrefix("doraemon_legs", "run", "run", 25 + 1 / 3, false)
	scaleObject("doraemon_legs", 0.93, 0.93)
	addLuaSprite("doraemon_legs", false)
	
	makeAnimatedLuaSprite("doraemon_legs_monochrome", "characters/doraemon_legs_monochrome", getProperty("doraemon_legs.x") or 0, getProperty("doraemon_legs.y") or 0)
	addAnimationByPrefix("doraemon_legs_monochrome", "run", "run", 25 + 1 / 3, false)
	scaleObject("doraemon_legs_monochrome", 0.5 * 0.93, 0.5 * 0.93)
	setProperty("doraemon_legs_monochrome.alpha", 0.00001)
	addLuaSprite("doraemon_legs_monochrome", false)
		playAnim("boyfriend", "idle", true)
	
	playAnim("doraemon_legs", "run", true)
	playAnim("doraemon_legs_monochrome", "run", true)
end



function onCountdownTick(tick)
	if (tick + 1) % 2 == 0 then
		playAnim("doraemon_legs", "run", true)
		playAnim("doraemon_legs_monochrome", "run", true)
	end
end

function onBeatHit()
	if (curBeat + 1) % 2 == 0 then
		playAnim("doraemon_legs", "run", true)
		playAnim("doraemon_legs_monochrome", "run", true)
	end
end

function onUpdatePost()
	local song_pos = getSongPosition() / 1000
	
	local offs = step_sin(song_pos / (crochet / 1000), 1)
	setProperty("boyfriendGroup.x", defaultBoyfriendX - 12 * offs)
	setProperty("boyfriendGroup.y", defaultBoyfriendY - 32 * offs)
	
	setProperty("doraemon_head.x", getProperty("boyfriendGroup.x"))
	setProperty("doraemon_head.y", getProperty("boyfriendGroup.y"))
	playAnim("doraemon_head", getProperty("boyfriend.animation.name") or "idle", true, false, getProperty("boyfriend.animation.curAnim.curFrame") or 0)
	
	setProperty("doraemon_legs.x", getProperty("boyfriendGroup.x") + legs_offs.x)
	setProperty("doraemon_legs.y", getProperty("boyfriendGroup.y") + legs_offs.y)
	
	setProperty("doraemon_legs_monochrome.x", getProperty("doraemon_legs.x"))
	setProperty("doraemon_legs_monochrome.y", getProperty("doraemon_legs.y"))
	
	setProperty("boyfriend.animation.curAnim.frameRate", getProperty("boyfriend.animation.name") == "idle" and (25 + 1 / 3) or 24)
end