local floor = math.floor

--

local flashing = true

local shake_radius = 8

local eyes_flashing = false
local solo = false

--

local function fract(x)
	return x - floor(x)
end

local function fsin(x)
	x = 2 * fract(x / 2)
	if x <= 1.0 then
		return -4 * x * (x - 1)
	else
		return 4 * (x - 1) * (x - 2)
	end
end

local function fsin_r(x) -- yeah
	return (
		fsin(x * 0.94726) +
		fsin(x * 1.82552) +
		fsin(x * 2.41835) +
		fsin(x * 3.38626) +
		fsin(x * 3.79467) +
		fsin(x * 4.91653) +
		fsin(x * 5.28461)
	) / 7;
end

--

function onCreate()
	precacheImage("NOTE_assets_monochrome")
	
	setGlobalFromScript("scripts/neocam", "pos_speed", 8)
	setGlobalFromScript("scripts/neocam", "offset_radius", 16)

	callScript("scripts/neocam", "set_target", {"opp", 230, -170})
	callScript("scripts/neocam", "set_target", {"plr", -70, -50})
	callScript("scripts/neocam", "set_target", {"center", 0, -90})
	
	callScript("scripts/neocam", "set_target", {"die_already", 350, -240})
	callScript("scripts/neocam", "set_target", {"solo", -140, 0})

	makeLuaSprite("hue_shift_shader", "", 0, 0)
	makeLuaSprite("contrast_shader", "", 0, 0)
	makeLuaSprite("shimmer_shader", "", 0, 0)
end

function onCreatePost()
	
	makeLuaSprite("denja_flying_eyes_alpha", "", 0, 0)
	makeLuaSprite("doraemon_head_alpha", "", 0, 0)
	
	makeLuaSprite("black_bg_zoom_in", "", -2000, -2000)
	makeGraphic("black_bg_zoom_in", 4000, 4000, "000000")
	setProperty("black_bg_zoom_in.alpha", 0.00001)
	addLuaSprite("black_bg_zoom_in", false)
	
	makeLuaSprite("black_bg_solo", "", -2000, -2000)
	makeGraphic("black_bg_solo", 4000, 4000, "000000")
	setProperty("black_bg_solo.alpha", 0.00001)
	addLuaSprite("black_bg_solo", true)
	
	makeLuaSprite("black_bg", "", -2000, -2000)
	makeGraphic("black_bg", 4000, 4000, "000000")
	setProperty("black_bg.alpha", 0.00001)
	addLuaSprite("black_bg", true)
	
	local order_start = getObjectOrder("black_bg") + 1
	setObjectOrder("denja_flying_eyes", order_start)
	setObjectOrder("doraemon_legs", order_start + 1)
	setObjectOrder("doraemon_legs_monochrome", order_start + 2)
	setObjectOrder("boyfriendGroup", order_start + 3)
	setObjectOrder("doraemon_head", order_start + 4)
	
	
	
	setShaderFloat("hue_shift_shader", "u_shift", 0)
	setShaderFloat("contrast_shader", "u_contrast", 1.2)
	setShaderFloat("shimmer_shader", "u_elapsed", 0)
	setShaderFloat("shimmer_shader", "u_scale", 12)
	setShaderFloat("shimmer_shader", "u_intensity", 0)
	
	setSpriteShader("sky", "hue_shift")
	setShaderFloat("sky", "u_shift", 0)
	
	for i = 0, 3 do
		setPropertyFromGroup("opponentStrums", i, "x", _G["defaultPlayerStrumX" .. i])
		setPropertyFromGroup("playerStrums", i, "x", _G["defaultOpponentStrumX" .. i])
	end
end

function onStartCountdown()
	callScript("scripts/neocam", "shake", {"game", 1, shake_radius * 2, 0.25, "cubeout"})
	callScript("scripts/neocam", "shake", {"hud", 1, shake_radius, 0.25, "cubeout"})
end

function onCountdownTick()
	callScript("scripts/neocam", "shake", {"game", 1, shake_radius * 2, 0.25, "cubeout"})
	callScript("scripts/neocam", "shake", {"hud", 1, shake_radius, 0.25, "cubeout"})
end

function onSongStart()
	callScript("scripts/neocam", "zoom", {"game", mustHitSection and 0.75 or 0.9, 0.75, "cubeout"})
end

local timer_stuff = {
	die_already = function()
		playAnim("dad", "die_already", true)
		setProperty("dad.specialAnim", true)
		
		setProperty("denja_flying_eyes_alpha.x", 1)
	end
}

function onTimerCompleted(tag)
	if timer_stuff[tag] then
		timer_stuff[tag](loops, remaining)
	end
end

local beat_stuff = {
	[32] = function()
		if flashing then
			cameraFlash("other", "f8fcff", 1, true)
		end
	end,
	
	[228] = function()
		callScript("scripts/neocam", "focus", {"die_already", 0.5, "cubeout", true})
		callScript("scripts/neocam", "zoom", {"game", 1.25, 0.5, "cubeout", true})
		
		doTweenAlpha("show_black_bg_zoom_in", "black_bg_zoom_in", 0.35, 0.5, "cubeinout")
	end,
	
	[231] = function()
		setGlobalFromScript("scripts/neocam", "locked_pos", false)
		setGlobalFromScript("scripts/neocam", "locked_zoom", false)
	end,
	
	[232] = function()
		cancelTween("show_black_bg_zoom_in")
		doTweenAlpha("hide_black_bg_zoom_in", "black_bg_zoom_in", 0.00001, 0.5, "cubeinout")
	end,
	
	[287] = function()
		doTweenAlpha("hide_hud", "camHUD", 0.00001, 0.75, "cubeinout")
		
		callScript("scripts/neocam", "focus", {"die_already", 1.5, "quartinout", true})
		callScript("scripts/neocam", "zoom", {"game", 1.2, 1.25, "quartinout", true})
	end,
	
	[289] = function()
		runTimer("die_already", 0.1)
		
		callScript("scripts/caption", "show_caption", {"Die already!", 1})
	end,
	
	[291] = function()
		setGlobalFromScript("scripts/neocam", "locked_pos", false)
		setGlobalFromScript("scripts/neocam", "locked_zoom", false)
	end,
	
	[292] = function()
		setShaderFloat("hue_shift_shader", "u_shift", 0.5)
		setShaderFloat("sky", "u_shift", 0.9)
		
		setProperty("camHUD.alpha", 1)
		
		if flashing then
			cameraFlash("other", "f8fcff", 1, true)
		end
		
		eyes_flashing = true
	end,
	
	[352] = function()
		doTweenX("show_doraemon_head", "doraemon_head_alpha", 0.5, 1.5, "cubeinout")
	end,
	
	[353] = function()
		doTweenAlpha("show_black_bg_solo", "black_bg_solo", 0.75, 1.5, "cubeinout")
		
		callScript("scripts/neocam", "focus", {"solo", 1.25, "quartinout", true})
		callScript("scripts/neocam", "zoom", {"game", 1, 1.25, "quartinout", true})
	end,
	
	[354] = function()
		doTweenAlpha("hide_icon_1", "iconP1", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_icon_2", "iconP2", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_healthbar_bg", "healthBarBG", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_healthbar", "healthBar", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_score_text", "scoreTxt", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_timebar_bg", "timeBarBG", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_timebar", "timeBar", 0.00001, 6, "sineinout")
		doTweenAlpha("hide_time_txt", "timeText", 0.00001, 6, "sineinout")
		
		for i = 0, 3 do
			noteTweenAlpha("opponent_solo_alpha" .. i, i, 0.00001, 4, "sineinout")
			
			noteTweenX("opponent_solo_x" .. i, i, getPropertyFromGroup("opponentStrums", i, "x") + 150, 4, "sineinout")
			noteTweenX("player_solo_x" .. (i + 4), i + 4, getPropertyFromGroup("playerStrums", i, "x") + 320, 4, "sineinout")
		end
	end,
	
	[356] = function()
		shake_radius = 2
		
		setShaderFloat("hue_shift_shader", "u_shift", 0)
		setShaderFloat("shimmer_shader", "u_intensity", 0.3)
		setShaderFloat("sky", "u_shift", 0)
		
		if flashing then
			cameraFlash("other", "f8fcff", 1, true)
		end
		
		cancelTween("show_doraemon_head")
		setProperty("doraemon_head_alpha.x", 0.9)
		
		cancelTween("show_black_bg_solo")
		setProperty("black_bg_solo.alpha", 0.85)
		
		setProperty("doraemon_legs.alpha", 0.00001)
		setProperty("doraemon_legs_monochrome.alpha", 1)
		triggerEvent("Change Character", "bf", "doraemon_monochrome")
		
		callScript("scripts/note_tex", "change", {"NOTE_assets_monochrome"})
		
		solo = true
	end,
	
	[417] = function()
		setGlobalFromScript("scripts/neocam", "locked_zoom", false)
		callScript("scripts/neocam", "zoom", {"game", 0.9, 1.25, "quartinout", true})
	end,
	
	[420] = function()
		shake_radius = 8
		
		setProperty("iconP1.alpha", 1)
		setProperty("iconP2.alpha", 1)
		setProperty("healthBarBG.alpha", 1)
		setProperty("healthBar.alpha", 1)
		setProperty("scoreTxt.alpha", 1)
		setProperty("timeBarBG.alpha", 1)
		setProperty("timeBar.alpha", 1)
		setProperty("timeText.alpha", 1)
		
		doTweenX("denja_flying_offs_x", "denja_flying_offs", -30, 20, "cubeinout")
		doTweenY("denja_flying_offs_y", "denja_flying_offs", -10, 20, "cubeinout")
		doTweenX("denja_flying_offs_scale_x", "denja_flying_offs_scale", -0.1, 20, "cubeinout")
		doTweenY("denja_flying_offs_scale_y", "denja_flying_offs_scale", -0.1, 20, "cubeinout")
		
		setShaderFloat("shimmer_shader", "u_intensity", 0)
		
		if flashing then
			cameraFlash("other", "f8fcff", 1, true)
		end
		
		setProperty("black_bg_solo.alpha", 0.00001)
		
		setProperty("doraemon_legs.alpha", 1)
		setProperty("doraemon_legs_monochrome.alpha", 0.00001)
		triggerEvent("Change Character", "bf", "doraemon")
		
		callScript("scripts/note_tex", "change", {"noteSkins/NOTE_assets"})
		
		setGlobalFromScript("scripts/neocam", "locked_pos", false)
		setGlobalFromScript("scripts/neocam", "locked_zoom", false)
		callScript("scripts/neocam", "focus", {"center", 17.5, "linear", true})
		callScript("scripts/neocam", "zoom", {"game", 0.725, 20, "linear", true})
		
		solo = false
	end,
	
	[488] = function()
		doTweenX("hide_doraemon_head", "doraemon_head_alpha", 0.00001, 1.5, "cubeinout")
	end
}

function onBeatHit()
	if beat_stuff[curBeat] then
		beat_stuff[curBeat]()
	end
	
	if flashing then
		if eyes_flashing then
			if curBeat % 2 == 0 then
				cancelTween("denja_flying_eyes_flash")
				setProperty("denja_flying_eyes_alpha.x", 1)
				doTweenX("denja_flying_eyes_flash", "denja_flying_eyes_alpha", solo and 0.2 or 0.00001, 0.5, "cubeinout")
			end
		end
		
		callScript("scripts/neocam", "shake", {"game", 1, shake_radius * 2, 0.25, "cubeout"})
		callScript("scripts/neocam", "shake", {"hud", 1, shake_radius, 0.25, "cubeout"})
	end
end

function onSectionHit()
	callScript("scripts/neocam", "zoom", {"game", mustHitSection and 0.75 or 0.9, 0.75, "cubeout"})
end
function onUpdatePost()
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('iconP2.flipX',true)
	setProperty('healthBar.flipX',true)
	
	local song_pos = getSongPosition() / 1000
	setShaderFloat("shimmer_shader", "u_elapsed", song_pos)
	
	setProperty("denja_flying_eyes.alpha", getProperty("denja_flying_eyes_alpha.x"))
	setProperty("doraemon_head.alpha", ((fsin_r(song_pos) - 1) / 4 + 1) * getProperty("doraemon_head_alpha.x"))
end