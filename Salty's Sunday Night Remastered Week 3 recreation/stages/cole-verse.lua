function onCreate()
	makeLuaSprite('bgWalls','christmas/bgWalls',-500,-250)
	addLuaSprite('bgWalls',false)
	setScrollFactor('bgWalls',0.6,0.6)
	scaleObject('bgWalls', 0.7, 0.7);

	makeLuaSprite('bgEscalator','W5/bgEscalator',-1350,-850)
	addLuaSprite('bgEscalator',false)
	setScrollFactor('bgEscalator',0.6,0.6)
	scaleObject('bgEscalator', 5.0, 5.0);

	makeAnimatedLuaSprite('upperBop','W5/upperBop',-250,160)
	addLuaSprite('upperBop',false)
	setScrollFactor('upperBop',0.6,0.6)
	addAnimationByPrefix('upperBop','idle','Upper Crowd Bop',24,false)
	scaleObject('upperBop', 2.0, 2.0);

	makeLuaSprite('christmasTree','W5/christmasTree',300,-350)
	addLuaSprite('christmasTree',false)
	setScrollFactor('christmasTree',0.65,0.65)
	scaleObject('christmasTree', 5.0, 5.0);

	makeAnimatedLuaSprite('bottomBop','christmas/bottomBop',-100,200)
	addLuaSprite('bottomBop',false)
	addAnimationByPrefix('bottomBop','idle','Bottom Level Boppers',24,false)

	makeLuaSprite('fgSnow','christmas/fgSnow',-400,90)
	addLuaSprite('fgSnow',false)
	scaleObject('fgSnow', 0.6, 0.6);

	makeAnimatedLuaSprite('santa','W5/santa',-900,220)
	addLuaSprite('santa',false)
	addAnimationByPrefix('santa','idle','santa idle in fear',24,false)
	scaleObject('santa', 2.0, 2.0);
end
function onBeatHit()
	if curBeat%2 == 0 and songName == 'Green Eggs' then
		objectPlayAnimation('upperBop','idle',true)
		objectPlayAnimation('bottomBop','idle',true)
		objectPlayAnimation('santa','idle',true)
	end
	if curBeat % 1 == 0 and songName == 'ham' then
		objectPlayAnimation('upperBop','idle',true)
		objectPlayAnimation('bottomBop','idle',true)
		objectPlayAnimation('santa','idle',true)
	end
end