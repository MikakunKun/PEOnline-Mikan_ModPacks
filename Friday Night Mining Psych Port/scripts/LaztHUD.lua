                   --[[                    Credits                    ]]--
--[[boping head on beat : Form BBPanzu
	playOpponent + sick notes hud : Form Plotsh [Modified by: Lazt/Mochaama]
	funnybf/ squishable bf : Form 4k_funny
	maniaMode : Form ???  [Psych Discord]
	
	all thing except that form credit : Form Lazt/Mochaama(myself ;>)  [If you use this on your mod please atleast credit me?]
	                                                                       ]]--
	
 
				--[[ THE KEY ]]--								   

	local ExtrasHUD = true; --[default: true]
-- This is The Key. if you set it to false well then theres no extra thing in the hud

                             --[ FEATURE ]--

local camFolChar = true;  -- REWORKED NOW IT WORK PROPERLY ON ALL SONG/MODS -- Thanks to Teniente Mantequilla#0139  [psych discord]
local maniaMode = false;  -- make the hud completely like Osu!Mania [default: false]
local noteBop = true; --the note boping when pressed [85% reworked] [default: true]
local emote = true; --- bf do animation. press SPACE to emote  [default: true]
local playOpponent = false; -- play as opponent[75% reworked] [default: false]
local healthdrain = false; --- everytime opponent hit notes your health get drained like boyfriend do to opponent [default: true]
-- more coming
                            --[ CONFIG ]--
 local spen = true; -- if true at every 25 beat hit, the note do spin 
 dacountdown = "hide" -- [FOR NOW ONLY SKIP] put 'skip' to skip countdown put 'hide' to hide countdown
 daemote = ""  -- put the name of bf animation. [leave blank for hey/peace sign. if the bf is not the original one it will not playing]
	
                            --[ SETTINGS ]--
local noCountdown = true; --sometimes broke some script
local hideP2Notes = false;  --hide the opponent notes

                       --[ Extras ]--
local funnybf = false; --- thing that make bf squishable [default: false]





--------------------------------------------------------------------------------------------------
------------- >Deep Down Below Until End is the script< -------------
---------------------------------------------------------------------------------------------------
                --the thing lolollolololol--
local defaultNotePos = {};
--form bbpanzu
local dadsingL = 4
local bfsingL = 4
realAnimdad = 'idle'
realAnimbf = 'idle'
function getAnim(char,prop)
prop = prop or 'name'
	return getProperty(char .. '.animation.curAnim.' .. prop)

end
-----------------------
--form Plotsh
cmoffset = -4
cmy = 20
tnhx = -5
---------------------  arrow thingy
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end
---------------
local posS = {-100, 720}
local posV = {0, 620}
function onCreate()
	if noCountdown then
	  if dacountdown == "skip" then
	   setProperty('skipCountdown',true)
	  end
end
 if maniaMode then
	addLuaScript('ExtraScript/manmod')
	noteBop = false;
	spen = false;
 end

if ExtrasHUD then
    makeLuaText("tnh", '', 250, tnhx, 200);
    makeLuaText("cm", '', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
    makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
    makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
    makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
    makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
	makeLuaText("songTimer",'',0,590,0);
	makeLuaSprite('wot','songbarAlt',420, -200);
	scaleObject('wot', 0.8, 0.65);
	setObjectCamera('wot','other');
	addLuaSprite('wot',true);
	makeLuaText('wtf2',"Playing:", 0, 10, getProperty('wot.y')+0);
	addLuaText('wtf2');
	setObjectCamera('wtf2','other');
	setTextSize('wtf2', 30);
	makeLuaText('wtf', songName .. " | " .. curBpm , 0, 20, getProperty('wot.y') + 0);
	setTextSize('wtf', 25);
	setObjectCamera('wtf','other');
	addLuaText('wtf');
	setTextAlignment('wtf', 'left')
    addLuaText('songTimer');
	setTextSize('songTimer',32);
	addLuaText('tnh');
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextAlignment('sick', 'left')
    setTextSize('good', 20);
    addLuaText("good");
    setTextAlignment('good', 'left')
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextAlignment('bad', 'left')
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextAlignment('shit', 'left')
	makeLuaText('newScoreAcc','hey vsauce here',0, 410, 0);
	makeLuaText('theRating','?',0,5,getProperty('shit.y')+ 30);
	setTextSize('theRating',20);
	setTextSize('newScoreAcc',20);
if downscroll then
	makeLuaText('sogn', songName, 0, 3, 695);
	makeLuaText('stor', '', 0,1146, 695);
  elseif not downscroll then
		makeLuaText('sogn', songName, 0, 3, 2);
		makeLuaText('stor', '', 0, 1146, 2);
		end
		setTextSize('sogn', 20);
		setTextSize('stor', 20);
		setTextAlignment('sogn', 'left');
		setTextAlignment('stor', 'right');
		setTextColor('sogn', 'E5E7E9');
		setTextAlignment('theRating', 'left');
		addLuaText('sogn');
		addLuaText('stor');
		addLuaText('newScoreAcc');
		addLuaText('theRating');
	   if isStoryMode then
		setTextString('stor','(StoryMode)');
		else
		setTextString('stor','(FreePlay)');
	   end
	setProperty('wot.alpha', 1* 0)
	setProperty('tnh.alpha',0)
	setProperty('sogn.alpha',0)
   end
if playOpponent then
	if difficulty == 0 then 
	 setTextString('sogn',songName .. ' - Easy (Opponent)');
	elseif difficulty == 1 then
	 setTextString('sogn',songName .. ' - Normal (Opponent)');
	elseif difficulty == 2 then
	setTextString('sogn',songName .. ' - Hard (Opponent)');
	elseif difficulty == 3 then
	setTextString('sogn',songName .. ' - Custom (Opponent)');
	end
   else
	 if difficulty == 0 then 
	 setTextString('sogn',songName .. ' - Easy');
	elseif difficulty == 1 then
	 setTextString('sogn',songName .. ' - Normal');
	elseif difficulty == 2 then
	setTextString('sogn',songName .. ' - Hard');
	elseif difficulty == 3 then
	setTextString('sogn',songName .. ' - Custom');
	end
 end
end

yValuebotPlay = 0;
woosh = -69420
assetTag = {'sogn','wot','tnh','wtf','wtf2','sick','good','bad','shit','scoreTxt'} --idk why it doesnt work maybe cus am not good at lua yet
function onCreatePost()
if playOpponent then
	if not middlescroll then
		for i=0, getProperty('playerStrums.length')-1 do 
			setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x'))
		end
		for i=0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'x', 732 + i*112)
		end
	end

	for i=0, getProperty('unspawnNotes.length') do 
		setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress'))
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
			setPropertyFromGroup('unspawnNotes', i, 'noteType', 'No Animation')
		end
	end
end
	if not camFolChar then
	setProperty('cameraSpeed', 2.1)
	end
  if hideP2Notes then
  	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y', woosh)
		setPropertyFromGroup('opponentStrums',i,'x', woosh)
	end
end
if ExtrasHUD then
setProperty('scoreTxt.visible',false)
setProperty('timeBarBG.visible',false)
setProperty('timeBar.visible',false)
setProperty('timeTxt.visible',false)
setProperty('healthBarBG.scale.x',1.2)
setProperty('healthBar.scale.x',1.2)
   if downscroll then
  setProperty('healthBar.y', 50)
  setProperty('iconP1.y', -25)
  setProperty('iconP2.y', -25)
  setProperty('scoreTxt.y',80)
  setProperty('songTimer.y', 680)
for i = 0,7 do
	setPropertyFromGroup('strumLineNotes', i, 'y', 900)
end
end
   if not downscroll then
   setProperty('songTimer.y', 10)
   setProperty('scoreTxt.y',690)
   setProperty('healthBar.y', 670)
   setProperty('iconP1.y', 585)
   setProperty('iconP2.y', 585)
   for i = 0,7 do
	setPropertyFromGroup('strumLineNotes', i, 'y', -200)
end
end
end
if downscroll then
	yValuebotPlay = 50;
 else
	yValuebotPlay = -120
 end
 if noCountdown then
	if dacountdown == "hide" then
		setProperty('countdownReady.visible', false)
		setProperty('countdownSet.visible', false)
		setProperty('countdownGo.visible', false)
	  end
	end
if maniaMode then
	setProperty('sogn.visible', false) -- so many xd 2
	setProperty('wot.visible', false)
	setProperty('tnh.visible', false)
	setProperty('wtf.visible', false)
	setProperty('wtf2.visible', false)
	setProperty('sick.visible', false)
	setProperty('good.visible', false)
	setProperty('bad.visible', false)
	setProperty('shit.visible', false)
	setProperty('stor.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('scoreTxt.visible',false)
	camFolChar = false;
	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 600 + 0)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		setProperty('healthBar.y', 300)
	elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('healthBar.y', 410)
	end
end
end

-- form 4k_funny
accel_x = 0
accel_x2 = 0
bounce = 0
bf_flip = 1
pos_x = 800
------------
-- form [psych discord]
local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 30
local velocity = 1.6
	
function onMoveCamera(focus)
 if camFolChar then
	if focus == 'boyfriend' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = true
	elseif focus == 'dad' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = false
	setProperty('cameraSpeed', 1.3)
	end
 end
end
-------------
function onCountdownTick(counter)
	if counter == 1 then
       for nutsO = 0,3 do
		noteTweenY('het'..nutsO, nutsO, defaultOpponentStrumY0, 0.8 ,"circInOut")
	   end
	   for nutsP = 4,7 do
		noteTweenY('hetew'..nutsP, nutsP, defaultPlayerStrumY0, 0.8 ,"circInOut")
	   end
	end
end

function onUpdate()
if not maniaMode then
  if boyfriendName == 'bf' then
	makeLuaSprite('wii', 'bf-win', getProperty('iconP1.x'), getProperty('iconP1.y'))
	setObjectCamera('wii', 'hud')
	setObjectOrder('wii', getObjectOrder('iconP1') + 1)
	addLuaSprite('wii', true)
	setProperty('wii.flipX', true)
	setProperty('wii.visible', false)
    setProperty('wii.x', getProperty('iconP1.x'))
	setProperty('wii.angle', getProperty('iconP1.angle'))
	setProperty('wii.y', getProperty('iconP1.y'))
	setProperty('wii.scale.x', getProperty('iconP1.scale.x'))
	setProperty('wii.scale.y', getProperty('iconP1.scale.y'))
  else
	setProperty('wii.visible',false)
	setProperty('iconP1.visible',true)
  end
end

if emote then
 if daemote == '' then
     if keyJustPressed('space') then
        triggerEvent('Hey!','BF', '0.6')
		playSound('hey', 1.5, 'heydo')
	end
 else
	  if keyJustPressed('space') then
      triggerEvent('Play Animation',daemote, 'BF')
   end
  end
end

 if botPlay then
  doTweenAlpha('tx','scoreTxt', 0, 0.3, 'linear')
 end

if ExtrasHUD then
	setProperty('songTimer.angle',getProperty('timeTxt.angle'))
	setTextString('songTimer',"" .. milliToHuman(math.floor(songLength - (getPropertyFromClass('Conductor', 'songPosition') - noteOffset))) .. "")
	setProperty('wtf.y', getProperty('wot.y') + 90)
    setProperty('wtf.x', getProperty('wot.x') + 70)
    setProperty('wtf2.y', getProperty('wot.y') + 10)
	setProperty('wtf2.x', getProperty('wot.x') + 60)
	setProperty('wtf.alpha', getProperty('wot.alpha'))
    setProperty('wtf2.alpha', getProperty('wot.alpha'))
	setProperty('stor.alpha', getProperty('sogn.alpha'))
	setTextString('theRating','[' .. ratingFC .. ']')
	setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
	setTextString('newScoreAcc','Score: '..score..' | Note Missed: '..misses..' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%')
    setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
    setTextString('good', 'Goods: ' .. getProperty('goods'))
    setTextString('bad', 'Bads: ' .. getProperty('bads'))
    setTextString('shit', 'Shits: ' .. getProperty('shits'))
	setProperty('sick.alpha', getProperty('tnh.alpha'))
    setProperty('good.alpha', getProperty('tnh.alpha'))
	setProperty('bad.alpha', getProperty('tnh.alpha'))
	setProperty('shit.alpha', getProperty('tnh.alpha'))
	setProperty('songTimer.alpha',getProperty('tnh.alpha'))
	setProperty('theRating.alpha',getProperty('tnh.alpha'))
end

if funnybf then
  if keyPressed("left") then
		bounce = (1 - math.abs(accel_x)/5)
		bf_flip = 1
	elseif keyPressed("up") then
		bounce = bounce*0.8 + 0.25
	elseif keyPressed("down") then
		bounce = bounce*0.7 + 0.25
	elseif keyPressed("right") then
		bounce = (1 - math.abs(accel_x)/5)
		bf_flip = -1
	else
		accel_x2 = accel_x2 + (1 - bounce)/5
		bounce = (bounce*0.8 + 0.2) + accel_x2
	end
 
	if keyPressed("left") then
		accel_x = accel_x*0.75 - 1*0.25
	elseif keyPressed("right") then
		accel_x = accel_x*0.75 + 1*0.25
	else
		accel_x = (accel_x)*0.8
	end
 
	pos_x = pos_x + accel_x*6
	setProperty('boyfriend.x', pos_x - 1/bounce * 150)
    setProperty('boyfriend.y', 100 + 1/bounce * 350)
	scaleObject('boyfriend', bf_flip/bounce, bounce)
end

   if getProperty('health') > 1.6 then
	if boyfriendName == 'bf' then
     setProperty('iconP1.visible', false)
	 setProperty('wii.visible', true)
	end
     setTextColor('scoreTxt', '00DB45')
  elseif getProperty('health') < 0.4 then
	if boyfriendName == 'bf' then
     setProperty('iconP1.visible', true)
	 setProperty('wii.visible', false)
	end
     setTextColor('scoreTxt', 'FF0000')
  else
     setTextColor('scoreTxt', 'FFFFFF')
	 if boyfriendName == 'bf' then
	 setProperty('iconP1.visible', true)
	 setProperty('wii.visible', false)
	 end
   end
end

function onStepHit()
   if curStep == 1 and ExtrasHUD then
  	doTweenAlpha('wota', 'wot', 1 , 0.8, 'quadInOut')
	doTweenY('wote', 'wot', 0 , 0.8, 'quadInOut')
end


if curStep == 25 and ExtrasHUD then 
	doTweenAlpha('wota', 'wot', 0 , 1, 'quadInOut')
	doTweenY('wote', 'wot', -200 , 0.8, 'quadInOut')
	doTweenAlpha('shog', 'sogn', 1 , 1, 'quadInOut')
	doTweenAlpha('shoge', 'tnh', 1 , 1, 'quadInOut')
	end
end

function onBeatHit()
	
	if getProperty('curBeat') % 1 == 0 then
	        setProperty('timeTxt.angle',1*-10)
			doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
		if getProperty('health') > 1.6 then
			setProperty('iconP1.angle',1*15)
			setProperty('iconP2.angle',1*0)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
		elseif getProperty('health') < 0.4 then
		    setProperty('iconP1.angle',1*0)
			setProperty('iconP2.angle',1*15)
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
		else
			setProperty('iconP1.angle',1*15)
			setProperty('iconP2.angle',1*-15)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
	    end
	end

	if getProperty('curBeat') % 2 == 0 then
		setProperty('newScoreAcc.scale.x',1.05)
		setProperty('newScoreAcc.scale.y',1.05)
		doTweenX('scorexet','newScoreAcc.scale', 1, 0.5, 'quadInOut')
		doTweenY('scoreyet','newScoreAcc.scale', 1, 0.5, 'quadInOut')
	        setProperty('timeTxt.angle',1*10)
			doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
	    if getProperty('health') > 1.6 then
			setProperty('iconP1.angle',1*-15)
			setProperty('iconP2.angle',1*0)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
		elseif getProperty('health') < 0.4 then
		    setProperty('iconP1.angle',1*0)
			setProperty('iconP2.angle',1*-15)
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
		else
			setProperty('iconP1.angle',1*-15)
			setProperty('iconP2.angle',1*15)
			doTweenAngle('re', 'iconP1', 0, 0.5, 'quintOut')
			doTweenAngle('ree', 'iconP2', 0, 0.5, 'quintOut')
		end
   end
   
if newBeat then 
   if curBpm < 210 then
         if getProperty('curBeat')% 1 == 0 then
	      if getAnim("dad") == "idle"..getProperty('dad.idleSuffix') then
		     characterPlayAnim("dad","idle"..getProperty('dad.idleSuffix'),true)
	        end
		end
	        if getAnim("boyfriend") == "idle"..getProperty('boyfriend.idleSuffix') then
		     characterPlayAnim("boyfriend","idle"..getProperty('boyfriend.idleSuffix'),true)
	      end
     end
    if curBpm > 210 then
		if getProperty('curBeat')% 2 == 0 then
		 if getAnim("dad") == "idle"..getProperty('dad.idleSuffix') then
			characterPlayAnim("dad","idle"..getProperty('dad.idleSuffix'),true)
		   end
		   if getAnim("boyfriend") == "idle"..getProperty('boyfriend.idleSuffix') then
			characterPlayAnim("boyfriend","idle"..getProperty('boyfriend.idleSuffix'),true)
		 end
	end
end
   if spen then
	if getProperty('curBeat')%  25 == 0 then
		for i = 4,7 do 
		setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
		noteTweenAngle("yez " .. i, i, 360, 0.2, "quadInOut")
		end
		for i = 0,3 do 
			setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
			noteTweenAngle("yezz " .. i, i, -360, 0.2, "quadInOut")
			end
	  end
  end
  end
end
local directions = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}



function opponentNoteHit(id, direction, noteType, isSustainNote)
	newBeat = true
if playOpponent then
	triggerEvent('Play Animation',directions[direction + 1], 'BF')
	runTimer('bfIdle',0.55)
end
  if camFolChar then 
	if not bfturn then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
		setProperty('cameraSpeed', velocity)
	elseif bfturn and playOpponent then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
	end
end
  if noteBop then
	if downscroll then
	 if direction == 0 then
		setPropertyFromGroup('strumLineNotes', 0, 'y', defaultOpponentStrumY0 + 23)
		noteTweenY('lolpart', 0, defaultOpponentStrumY0, 0.3 ,"bounceOut")
	 elseif direction == 1 then
		setPropertyFromGroup('strumLineNotes', 1, 'y', defaultOpponentStrumY1 + 23)
		noteTweenY('lolpart2', 1, defaultOpponentStrumY1, 0.3 ,"bounceOut")
	 elseif direction == 2 then
		setPropertyFromGroup('strumLineNotes', 2, 'y', defaultOpponentStrumY2 + 23)
		noteTweenY('lolpart3', 2, defaultOpponentStrumY2, 0.3 ,"bounceOut")
	 elseif direction == 3 then
		setPropertyFromGroup('strumLineNotes', 3, 'y', defaultOpponentStrumY3 + 23)
		noteTweenY('lolpart4', 3, defaultOpponentStrumY3, 0.3 ,"bounceOut")
	 end
	else
		if direction == 0 then
			setPropertyFromGroup('strumLineNotes', 0, 'y', defaultOpponentStrumY0 - 23)
			noteTweenY('lolpart', 0, defaultOpponentStrumY0, 0.3 ,"bounceOut")
		 elseif direction == 1 then
			setPropertyFromGroup('strumLineNotes', 1, 'y', defaultOpponentStrumY1 - 23)
			noteTweenY('lolpart2', 1, defaultOpponentStrumY1, 0.3 ,"bounceOut")
		 elseif direction == 2 then
			setPropertyFromGroup('strumLineNotes', 2, 'y', defaultOpponentStrumY2 - 23)
			noteTweenY('lolpart3', 2, defaultOpponentStrumY2, 0.3 ,"bounceOut")
		 elseif direction == 3 then
			setPropertyFromGroup('strumLineNotes', 3, 'y', defaultOpponentStrumY3 - 23)
			noteTweenY('lolpart4', 3, defaultOpponentStrumY3, 0.3 ,"bounceOut")
   end
 end
end
  if healthdrain then
	if getProperty('health') > 0.2 then
	setProperty('health',getProperty('health')-0.02)
	end
  end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if ExtrasHUD then
	setProperty('newScoreAcc.x',350)
end
if playOpponent then
	triggerEvent('Play Animation',directions[direction + 1], 'DAD')
	runTimer('dadIdle',0.55)
end
if camFolChar then
	if bfturn then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
		setProperty('cameraSpeed', velocity)
	elseif not bfturn and playOpponent then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
	end
end
if noteBop then
	if downscroll then
		if direction == 0 then
		setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0 + 23)
		noteTweenY('lol', 4, defaultPlayerStrumY0, 0.3 ,"bounceOut")
	 elseif direction == 1 then
		setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY1 + 23)
		noteTweenY('lol2', 5, defaultPlayerStrumY1, 0.3 ,"bounceOut")
	 elseif direction == 2 then
		setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY2 + 23)
		noteTweenY('lol3', 6, defaultPlayerStrumY2, 0.3 ,"bounceOut")
	 elseif direction == 3 then
		setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY3 + 23)
		noteTweenY('lol4', 7, defaultPlayerStrumY3, 0.3 ,"bounceOut")
	 end
	end
	   if not downscroll then
		if direction == 0 then
			setPropertyFromGroup('strumLineNotes', 4, 'y', defaultPlayerStrumY0 - 23)
			noteTweenY('lol', 4, defaultPlayerStrumY0, 0.3 ,"bounceOut")
		 elseif direction == 1 then
			setPropertyFromGroup('strumLineNotes', 5, 'y', defaultPlayerStrumY1 - 23)
			noteTweenY('lol2', 5, defaultPlayerStrumY1, 0.3 ,"bounceOut")
		 elseif direction == 2 then
			setPropertyFromGroup('strumLineNotes', 6, 'y', defaultPlayerStrumY2 - 23)
			noteTweenY('lol3', 6, defaultPlayerStrumY2, 0.3 ,"bounceOut")
		 elseif direction == 3 then
			setPropertyFromGroup('strumLineNotes', 7, 'y', defaultPlayerStrumY3 - 23)
			noteTweenY('lol4', 7, defaultPlayerStrumY3, 0.3 ,"bounceOut")
       end
	 end
  end

end

function onTweenCompleted(t)
	for nuts = 0,7 do
	  if t == 'speen'..nuts then
		  setPropertyFromGroup('strumLineNotes', nuts, 'angle', 0)
	  end
	 end 
end

function onTimerCompleted(t) 
   if t == 'dadIdle' then
	characterPlayAnim('dad', 'danceLeft',true);
	characterPlayAnim('dad', 'idle',true);
   elseif t == 'bfIdle' then
	characterPlayAnim('boyfriend', 'danceLeft',true);
	characterPlayAnim('boyfriend', 'idle',true);
   end
end
  

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function resetNote(time)
    for i = 0,7 do
        noteTweenX("Xdo " .. i, i, defaultNotePos[i + 1][1], time, "linear")
        noteTweenY("Ydo " .. i, i, defaultNotePos[i + 1][2], time, "linear")
        noteTweenAngle("Angledo " .. i, i, 360, time, "linear")
    end
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end