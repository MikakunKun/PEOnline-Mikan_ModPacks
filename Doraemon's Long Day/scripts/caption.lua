local text_active = false

--

function show_caption(text, duration)
	setProperty("caption_bg.scale.x", (#text * 16 + 24) / 1280)
	
	setTextString("caption_text", text)
	
	if text_active then
		cancelTimer("caption_fadeout")
	else
		doTweenAlpha("caption_fadein_bg", "caption_bg", 0.2, 0.1, "cubeinout")
		doTweenAlpha("caption_fadein_text", "caption_text", 1, 0.1, "cubeinout")
	end
	
	runTimer("caption_fadeout", duration)
	
	text_active = true
end

--

function onCreatePost()
	makeLuaSprite("caption_bg", "", 0, 560)
	makeGraphic("caption_bg", 1280, 48, "000000")
	setObjectCamera("caption_bg", "other")
	setProperty("caption_bg.alpha", 0.00001)
	addLuaSprite("caption_bg", true)
	
	makeLuaText("caption_text", "", 1280, getMidpointX("caption_bg") - 640, 0)
	setTextFont("caption_text", "gandhi_sans_bold.otf")
	setTextAlignment("caption_text", "center")
	setTextSize("caption_text", 36)
	setTextBorder("caption_text", 3, "000000")
	setObjectCamera("caption_text", "other")
	setProperty("caption_text.y", getMidpointY("caption_bg") - 16)
	setProperty("caption_text.alpha", 0.00001)
	addLuaText("caption_text", true)
end

local timer_stuff = {
	caption_fadeout = function()
		doTweenAlpha("caption_fadeout_bg", "caption_bg", 0.00001, 0.1, "cubeinout")
		doTweenAlpha("caption_fadeout_text", "caption_text", 0.00001, 0.1, "cubeinout")
		
		runTimer("caption_deactivate", 0.1)
	end,
	
	caption_deactivate = function()
		text_active = false
	end
}

function onTimerCompleted(tag)
	if timer_stuff[tag] then
		timer_stuff[tag](loops, remaining)
	end
end