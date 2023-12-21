function onCreatePost()
	makeLuaSprite('sky', 'cartriding/skylmao', -1900, -900)
	addLuaSprite('sky', false)
	setScrollFactor('sky', 1, 1);
	scaleObject('sky', 0.8, 0.8);

	makeAnimatedLuaSprite('rails1', 'cartriding/rails1', -1700, 380)
	addAnimationByPrefix('rails1','bounce','rails1 go', 24,true)
	addLuaSprite('rails1',false)
	objectPlayAnimation('rails1','bounce',true)
	scaleObject('rails1', 1, 1);
	setScrollFactor('rails1', 1, 1);
	setProperty('rails1.alpha', 1)

	makeAnimatedLuaSprite('rails2', 'cartriding/rails2', -2200, 640)
	addAnimationByPrefix('rails2','bounce','rails2 go', 24,true)
	addLuaSprite('rails2',false)
	objectPlayAnimation('rails2','bounce',true)
	scaleObject('rails2', 1, 1);
	setScrollFactor('rails2', 1, 1);
	setProperty('rails1.alpha', 1)

	makeAnimatedLuaSprite('rails3', 'cartriding/rails3', -700, -280)
	addAnimationByPrefix('rails3','bounce','rails3 go', 48,true)
	addLuaSprite('rails3',false)
	objectPlayAnimation('rails3','bounce',true)
	scaleObject('rails3', 1, 1);
	setScrollFactor('rails3', 1, 1);
	setProperty('rails3.alpha', 0)

	makeAnimatedLuaSprite('rails4', 'cartriding/rails4', 700, -280)
	addAnimationByPrefix('rails4','bounce','rails4 go', 48,true)
	addLuaSprite('rails4',false)
	objectPlayAnimation('rails4','bounce',true)
	scaleObject('rails4', 1, 1);
	setScrollFactor('rails4', 1, 1);
	setProperty('rails4.alpha', 0)
end

function onBeatHit()
	if curBeat == 232 then
		setProperty('rails1.alpha', 0)
		setProperty('rails2.alpha', 0)
		setProperty('rails3.alpha', 1)
		setProperty('rails4.alpha', 1)
	end

	if curBeat == 360 then
		setProperty('rails1.alpha', 1)
		setProperty('rails2.alpha', 1)
		setProperty('rails3.alpha', 0)
		setProperty('rails4.alpha', 0)
	end
end