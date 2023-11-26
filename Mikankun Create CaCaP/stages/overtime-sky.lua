--have fun understanding this lol
local defaultZoom = 0.65

--floating debris
local debrisData = {
    {300, -800, 'norm', 0.4, 1, 0, 1},
    {600, -300, 'tiny', 0.4, 1.5, 0, 1},
    {-150, -400, 'spike', 0.4, 1.1, 0, 1},
    {-750, -850, 'small', 0.4, 1.5, 0, 1},
    {-300, -1700, 'norm', 0.75, 1, 0, 1},
    {-1000, -1750, 'rect', 0.75, 2, 0, 1},
    {-600, -1100, 'tiny', 0.75, 1.5, 0, 1},
    {900, -1850, 'spike', 0.75, 1.2, 0, 1},
    {1500, -1300, 'small', 0.75, 1.5, 0, 1},
    {-600, -800, 'spike', 0.75, 1.3, 0, 1},
    {-1000, -900, 'small', 0.75, 1.7, 0, 1},
	{-1000, -900, 'small', 0.75, 1.7, 0, 1}
};
--debris from cutscene explosion
local debrisShit = {
    {-300, -120, 'ceil', 1, 1, -4, -40},
    {0, -120, 'ceil', 1, 1, -4, -51},
    {200, -120, 'ceil', 1, 1, -4, 40}
};
function lerp(a, b, ratio) return a + ratio * (b - a); end
function onCreate()
	setProperty('maxhealth',10)
    setProperty('defaultCamZoom',defaultZoom)
	--make bg and sthi
	makeAnimatedLuaSprite('sky', 'bgs/god_bg', -950, -850);
	addAnimationByPrefix('sky', 'idle', "blue bg", 30)
	playAnim('sky','idle');
	--manual setgraphicsize because psych forces an updatehitbox fuck you (now is optional but psych didnt have that when i made this lol)
	local width = math.floor(getProperty('sky.width') * 4.5)	
	setProperty('sky.scale.x', width/getProperty('sky.frameWidth'))
	setProperty('sky.scale.y', width/getProperty('sky.frameWidth'))
	setScrollFactor('sky', 0, 0)
	screenCenter('sky')
	addLuaSprite('sky', false);

	makeAnimatedLuaSprite('bgthing', 'bgs/god_bg', -950, -850);
	addAnimationByPrefix('bgthing', 'idle', "abg", 30)
	playAnim('bgthing','idle');
	local width = math.floor(getProperty('bgthing.width') * 0.85)	
	setProperty('bgthing.scale.x', width/getProperty('bgthing.frameWidth'))
	setProperty('bgthing.scale.y', width/getProperty('bgthing.frameWidth'))
	setScrollFactor('bgthing', 0.1, 0.1)
	addLuaSprite('bgthing', false);

	makeAnimatedLuaSprite('bgcloud', 'bgs/god_bg', -850, -1250);
	addAnimationByPrefix('bgcloud', 'idle', "cloud_smol", 30)
	playAnim('bgcloud','idle');
	setScrollFactor('bgcloud', 0.3, 0.3)
	addLuaSprite('bgcloud', false);

	makeAnimatedLuaSprite('bgcloud2', 'bgs/god_bg', -1050, -3000);
	addAnimationByPrefix('bgcloud2', 'idle', "cloud_smol", 30)
	playAnim('bgcloud2','idle');
	setScrollFactor('bgcloud2', 0.45, 0.45)
	addLuaSprite('bgcloud2', false);

	--do mansion debris shit here

	for i = 0,#debrisData-1 do 
		local deb = 'debris'..i
		makeAnimatedLuaSprite(deb, 'bgs/god_bg', debrisData[i+1][1], debrisData[i+1][2]);
		addAnimationByPrefix(deb, 'idle', 'deb_'..debrisData[i+1][3], 30)
		playAnim(deb,'idle');
		--debris.frameWidth * (debrisData[i][3] / 0.75)
		local width = math.floor(getProperty(deb..'.frameWidth') * (debrisData[i+1][4]/0.75))	
		setProperty(deb..'.scale.x', width/getProperty(deb..'.frameWidth'))
		setProperty(deb..'.scale.y', width/getProperty(deb..'.frameWidth'))
		setScrollFactor(deb, debrisData[i+1][4], debrisData[i+1][4])
		addLuaSprite(deb, false);
		updateHitbox(deb)
	end

	makeAnimatedLuaSprite('fgcloud', 'bgs/god_bg', -1150, -2900);
	addAnimationByPrefix('fgcloud', 'idle', "cloud_big", 30)
	playAnim('fgcloud','idle');
	setScrollFactor('fgcloud', 0.9, 0.9)
	addLuaSprite('fgcloud', false);

	makeAnimatedLuaSprite('fgcloud2', 'bgs/god_bg', -1350, -5000);
	addAnimationByPrefix('fgcloud2', 'idle', "cloud_big", 30)
	playAnim('fgcloud2','idle');
	setScrollFactor('fgcloud', 0.75, 0.75)
	addLuaSprite('fgcloud2', false);

	makeLuaSprite('bg', 'bgs/bg_lemon', -400, -160);
	local width = math.floor(getProperty('bg.width') * 1.5)	
	setProperty('bg.scale.x', width/getProperty('bg.frameWidth'))
	setProperty('bg.scale.y', width/getProperty('bg.frameWidth'))
	setScrollFactor('bg', 0.95, 0.95)
	addLuaSprite('bg', false);

	makeAnimatedLuaSprite('techo', 'bgs/god_bg', 0, 450);
	addAnimationByPrefix('techo', 'idle', "broken_techo", 30)
	playAnim('techo','idle');
	local width = math.floor(getProperty('techo.width') * 1.5)	
	setProperty('techo.scale.x', width/getProperty('techo.frameWidth'))
	setProperty('techo.scale.y', width/getProperty('techo.frameWidth'))
	setScrollFactor('techo', 0.95, 0.95)
	addLuaSprite('techo', false);

	for i = 1,2 do 
		makeAnimatedLuaSprite('rock'..i, 'bgs/god_bg', -1000, -1000);
		addAnimationByPrefix('rock'..i, 'idle', "rock", 30)
		playAnim('rock'..i,'idle');
		scaleObject('rock'..i,0.75,0.75,true)
		setScrollFactor('rock'..i, 1,1)
		addLuaSprite('rock'..i, false);
	end
    
    addLuaScript('data/CreateSecondJson')
end

function onCreatePost()
	addCharacterToList('saiyan-bf', 'boyfriend')
	triggerEvent('Change Character', 'dad', 'airbf-and-cusbf')
end

local moveBF,fastmove,camZoom,csbfsAttack = false,false,false,false
local lerpedsh_r,lerpedsbf_r = 0,0
local time = 0

function onBeatHit()
	if curBeat == 96 then cameraFlash('game', 'FFFFFF', 2) end
	if curBeat >= 96 then
		if boyfriendName ~= 'saiyan-bf' then triggerEvent('Change Character', 'boyfriend', 'saiyan-bf') end
		if moveBF == false then moveBF=true end
		if camZoom == false then camZoom = true end
		if csbfsAttack == false then csbfsAttack = true end
	end
	if curBeat >= 100 and curBeat < 452 then lerpedsh_r = 300 lerpedsbf_r = 300
	elseif curBeat >= 452 and curBeat < 772 then
		if fastmove == false then fastmove = true end
		if lerpedsh_r ~= 500 then lerpedsh_r = 500 end
		if lerpedsbf_r ~= 650 then lerpedsbf_r = 650 end
	elseif curBeat >= 772 then
		if lerpedsh_r ~= 350 then lerpedsh_r = 350 end
		if curBeat <= 834 then if lerpedsbf_r ~= 450 then lerpedsbf_r = 450 end else if lerpedsbf_r ~= 800 then lerpedsbf_r = 800 end end
	end
end
function opponentNoteHit(noteid, noteData, noteType, isSustainNote,char) if csbfsAttack == true then nothealthhealth(noteid,'hit',0.5) end end
function nothealthhealth(noteid,basehealthvar,sus)
	local movex = 'Loss' if (string.lower(basehealthvar) == 'hit') then movex = 'Gain' end
	setHealth(getHealth() - (getPropertyFromGroup('notes', noteid, basehealthvar..'Health') * getProperty('health'..movex))*sus)
end
local yPotision = 0
function onUpdate(elapsed)
	local rotRate = curStep * 0.25;
	local rotRateSb = curStep / 9.5;
	if fastmove == true then rotRateSb = rotRateSb*1.15 yPotision=-1000 end
	local sbf_tox = 870 + math.sin(rotRateSb) * lerpedsbf_r local sbf_toy = (-2000+yPotision) + -math.sin(rotRateSb * 2) * lerpedsbf_r * 0.45
	local cubf_toy = (-1850+yPotision) + -math.sin(rotRateSb * 2) * lerpedsh_r * 0.45;
	local cubf_tox = -330 -math.cos(rotRateSb) * lerpedsh_r;

	local sabf_toy = (-2700+yPotision) - -math.sin(rotRateSb * 2) * lerpedsh_r * 0.75;
	local sabf_tox = -630 - -math.cos(rotRateSb) * lerpedsh_r*0.75;

	if moveBF == true then
		-- Saiyan Boyfriend Pose Sets
		setProperty('boyfriend.x', getProperty('boyfriend.x') + (sbf_tox-getProperty('boyfriend.x'))/12);
		setProperty('boyfriend.y', getProperty('boyfriend.y') + (sbf_toy-getProperty('boyfriend.y'))/12);
		-- Custom Boyfriend Pose Sets
		setProperty('dad.otherCharacters[0].x', getProperty('dad.otherCharacters[0].x') + (cubf_tox-getProperty('dad.otherCharacters[0].x'))/12)
		setProperty('dad.otherCharacters[0].y', getProperty('dad.otherCharacters[0].y') + (cubf_toy-getProperty('dad.otherCharacters[0].y'))/12)
		setProperty('rock1.x', getProperty('dad.otherCharacters[0].x') - 100);
		setProperty('rock1.y', getProperty('dad.otherCharacters[0].y') + 300);
		-- Saster Boyfriend Pose Sets
		setProperty('dad.otherCharacters[1].x', getProperty('dad.otherCharacters[1].x') + (sabf_tox-getProperty('dad.otherCharacters[1].x'))/12)
		setProperty('dad.otherCharacters[1].y', getProperty('dad.otherCharacters[1].y') + (sabf_toy-getProperty('dad.otherCharacters[1].y'))/12)
		setProperty('rock2.x', getProperty('dad.otherCharacters[1].x') - 100);
		setProperty('rock2.y', getProperty('dad.otherCharacters[1].y') + 250);
	end

	time = time + (120 * elapsed); --for debris
	for i = 0,#debrisData-1 do 
		local deb = 'debris'..i
		setProperty(deb..'.x', debrisData[i+1][1]);
		setProperty(deb..'.y', debrisData[i+1][2] + math.sin((time + debrisData[i+1][6]) /50 * debrisData[i+1][5]) * 50 * debrisData[i+1][7]);
	end

	if camZoom == true then
		if mustHitSection then setProperty('defaultCamZoom',0.4)
		else setProperty('defaultCamZoom',0.35)
		end
	end
end