function onEvent(name, value1, value2)
	if name == "Image Flash" then
		makeLuaSprite('image', value1, -600, 100);
		addLuaSprite('image', true);
		doTweenX('hello', 'image', 0, 0.5, 'quartout');
		setObjectCamera('image', 'other');
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenX('byebye', 'image', -600, 0.5, 'quartin');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end