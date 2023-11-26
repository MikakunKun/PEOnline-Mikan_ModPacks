--Code made by Drawoon_
--if you use this please give me credit
local Path='stage/Disabled/'
function onCreate()

	intensity=0.0125
	HoverNotes=false
	hoverFactor=0
	useTerror=false
	OriginalXNotes={}
	horizontalFactor=0
	runningAway=false
	addLuaScript('scripts/Stuff/PlayStuff.lua')
	addLuaScript('scripts/Mechanics/AmusiaStrum.lua')
	setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',-0.15)
	setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',0.05)
	setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',true)
	setGlobalFromScript('scripts/Stuff/CameraMove','ManualPos',{screenWidth/2,screenHeight/2})
	callScript('scripts/Stuff/LuaHypnosRating','SetOffsets',{-256,-128})
addCharacterToList('Ponyta_Perspective','bf')
addCharacterToList('Disabled','dad')
	setProperty('skipCountdown',true)
	if shadersEnabled then initLuaShader('pincushion') end
	makeLuaSprite('background',Path..'background', 0, 0)
	screenCenter('background','xy')
	scaleObject('background',1.5,1.5,false)
	setScrollFactor('background', 0.125, 0.5)

	makeLuaSprite('background2',Path..'background2', 0, 0);
	scaleObject('background2',1.5,1.5)
	screenCenter('background2','xy')
	setScrollFactor('background2', 0.125, 0.5);

	makeLuaSprite('QuestionareBackground',Path..'questionare', 0,0);
	scaleObject('QuestionareBackground',0.25,0.25,false)
	screenCenter('QuestionareBackground','xy')
	setScrollFactor('QuestionareBackground',1,1)
	setProperty('QuestionareBackground.x',getProperty('QuestionareBackground.x')+16)


	makeAnimatedLuaSprite('WigglesQuest',Path..'wiggles_questionare',0,0)
	screenCenter('WigglesQuest','xy')
	setProperty('WigglesQuest.x',getProperty('WigglesQuest.x')+7)
	setProperty('WigglesQuest.y',getProperty('WigglesQuest.y')-15)
	setScrollFactor('QuestionareBackground',1,1)
    addAnimationByPrefix('WigglesQuest','idle','questionnaire idle',24,true)
    addAnimationByPrefix('WigglesQuest','give','Give me your sing',24,false)
    addAnimationByPrefix('WigglesQuest','angry','angry',24,true)


	makeAnimatedLuaSprite('WigglesQuestClose',Path..'Givemeyoursing',0,0)
	screenCenter('WigglesQuestClose','xy')
	setProperty('WigglesQuestClose.x',getProperty('WigglesQuestClose.x')+50)
	setProperty('WigglesQuestClose.y',getProperty('WigglesQuestClose.y')-100)
	setScrollFactor('QuestionareBackground',1,1)
    addAnimationByPrefix('WigglesQuestClose','glitch','Upfront',24,false)
	addAnimationByPrefix('WigglesQuestClose','loop','stareLoop',24,true)
	
    
	
	makeLuaSprite('plateL',Path..'Purple_place', 0, 0);
	setProperty('plateL.offset.y',getProperty('plateL.offset.y')-64)
	
	makeLuaSprite('plateR',Path..'Purple_place', 0, 0);
	
	setGraphicSize('plateR',getProperty('plateR.width')/ 1.75,getProperty('plateR.height')/ 1.75,false)
	setProperty('plateR.offset.y',-16-40)
	setProperty('plateR.offset.x',-32-20)

	

	
	

setSpriteShader('background','pincushion')
setSpriteShader('background2','pincushion')
setShaderFloat('background','distort',1.5)


makeLuaSprite('iconWiggly','icons/icon-wigglytuff',0,0)
setObjectCamera('iconWiggly','hud')
loadGraphic('iconWiggly','icons/icon-wigglytuff',151,173)
for i=0,3 do
    addAnimation('iconWiggly',i,{i},24,true)
end
addLuaSprite('iconWiggly',true)

makeLuaSprite('White',nil,-500,-500)
makeGraphic('White',screenWidth*2,screenHeight*2,'FFFFFF')


makeLuaSprite('Black',nil,-500,-500)
makeGraphic('Black',screenWidth*2,screenHeight*2,'000000')

makeAnimatedLuaSprite('Static',Path..'static',0,0)
addAnimationByPrefix('Static','idle','static',8,true)
setGraphicSize('Static',screenWidth* 1.01,screenHeight* 1.01)
screenCenter('Static','xy')
setObjectCamera('Static','other')
setProperty('Static.alpha',0)

makeAnimatedLuaSprite('StaticOverlay',Path..'static-overlay',0,0)
addAnimationByPrefix('StaticOverlay','idle','static-overlay',8,true)
setGraphicSize('StaticOverlay',screenWidth* 1.01,screenHeight* 1.01)
screenCenter('StaticOverlay','xy')
setObjectCamera('StaticOverlay','other')
setProperty('StaticOverlay.alpha',0)
setProperty('StaticOverlay.blend',9)



	addLuaSprite('background', false);
	addLuaSprite('background2', false);
	setProperty('background2.visible',false)
	addLuaSprite('QuestionareBackground', false);
	setProperty('QuestionareBackground.visible',false)
	addLuaSprite('WigglesQuest',false)
	setProperty('WigglesQuest.visible',false)
	addLuaSprite('WigglesQuestClose',false)
	setProperty('WigglesQuestClose.visible',false)
	addLuaSprite('plateL', false);
	addLuaSprite('plateR', false);
	addLuaSprite('White', false);
	addLuaSprite('Black', false);
	addLuaSprite('Static', true);
	addLuaSprite('StaticOverlay', true);

end
function ChangeZoom(NewZoom,Character)
if Character=='dad' then
	setGlobalFromScript('scripts/Stuff/CameraMove','DADZoom',NewZoom)
elseif Character=='bf' then
	setGlobalFromScript('scripts/Stuff/CameraMove','BFZoom',NewZoom)
end

end
function ChangeIntensity(New)
	intensity=New
end
function onUpdate(elapsed)
setProperty('iconWiggly.x',getProperty('iconP2.x'))
setProperty('iconWiggly.y',getProperty('iconP2.y')-40)
setProperty('iconWiggly.scale.x',getProperty('iconP2.scale.x'))
setProperty('iconWiggly.scale.y',getProperty('iconP2.scale.y'))
if shadersEnabled then
setShaderFloat('background','time',getSongPosition() / (stepCrochet * 8))
setShaderFloat('background','prob',intensity)
end

if curStep<32 and curStep>0 then
setProperty('Black.alpha',1 - math.abs(math.sin(((getSongPosition()) / (stepCrochet * 8)) * math.pi) * 0.5))
end
if HoverNotes then
if hoverFactor<24 then
	hoverFactor=hoverFactor+(elapsed / (1 / 60))
end
for i=0,1 do
for j=0,3 do
	if i==0 then
		setPropertyFromGroup('strumLineNotes',j,'y',OriginalYNote + (hoverFactor / 2)-math.sin((getSongPosition() / ((stepCrochet * 8) - j)) * math.pi) * hoverFactor)
	else
setPropertyFromGroup('playerStrums',j,'y',OriginalYNote + (hoverFactor / 2)-math.sin((getSongPosition() / ((stepCrochet * 8) - j)) * math.pi) * hoverFactor)
	end
end
end
end
if finishedRotating then
	currenti=0
	if horizontalFactor<64 then
		horizontalFactor=horizontalFactor+(elapsed / (1 / 60))
	end
	for i=0,1 do
		for j=0,3 do
			if i==0 then
				setPropertyFromGroup('strumLineNotes',j,'x',OriginalXNotes[currenti] -math.cos((getSongPosition() / ((stepCrochet * 16))) * math.pi) * horizontalFactor)
			else
		        setPropertyFromGroup('playerStrums',j,'x',OriginalXNotes[currenti] -math.cos((getSongPosition() / ((stepCrochet * 16))) * math.pi) * horizontalFactor)
			end
			currenti=currenti+1
		end
	end



end
end
function onUpdatePost(elapsed)
	setProperty('plateL.x',getProperty('dad.x')+(getProperty('dad.width')/ 2)-(getProperty('plateL.width')/ 2))
	setProperty('plateL.y',getProperty('dad.y')+getProperty('dad.height')-(getProperty('plateL.height')/ 2))
	if not runningAway then
	setProperty('plateR.x',(getProperty('boyfriend.x')+(getProperty('boyfriend.width')/ 2)-(getProperty('plateR.width')/ 2)))
	setProperty('plateR.y',(getProperty('boyfriend.y')+getProperty('boyfriend.height')-(getProperty('plateR.height')/ 2)))
	else
        setProperty('boyfriend.x',getProperty('boyfriend.x')-(elapsed / (1 / 60)) * 16)
	end
	if curStep>32 and luaSpriteExists('Black') then
		removeLuaSprite('Black',true)
		removeLuaSprite('White',true)
	end
	if curStep % 32 == 0 and useTerror and not runningAway then
		finishedRotating=true
		for i=0,7 do
			noteTweenAngle('Rotation'..i,i,360,8*(stepCrochet/1000),'cubeInOut')
		end
	end
end
function onCreatePost()
setObjectOrder('iconWiggly',getObjectOrder('iconP2')+1)
setProperty('iconP2.alpha',0)
setProperty('boyfriend.color',getColorFromHex('000000'))
setProperty('dad.color',getColorFromHex('000000'))
setCharacterX('dad',getCharacterX('dad')+screenWidth)
setCharacterX('bf',getCharacterX('bf')-screenWidth)
OriginalYNote=defaultPlayerStrumY1

end

function onStepHit()
if curStep==20 then
	doTweenX('StartDAD','dad',getCharacterX('dad')-screenWidth,stepCrochet/1000*8,'circOut')
elseif curStep==24 then
    doTweenX('StartBF','boyfriend',getCharacterX('bf')+screenWidth,stepCrochet/1000*8,'circOut')
elseif curStep==32 then
cameraFlash('hud','FFFFFF',stepCrochet/1000*8)
	setProperty('boyfriend.color',getColorFromHex('FFFFFF'))
    setProperty('dad.color',getColorFromHex('FFFFFF'))
	setGlobalFromScript('scripts/Stuff/CameraMove.lua','ForceCamPos',false)
	removeLuaSprite('Black',true)
	removeLuaSprite('White',true)
	playAnim('WigglesQuestClose','glitch')


end
end
function onTweenCompleted(tag)
if tag=='TransitionVigette2' then
	HoverNotes=true
end
if tag=='Rotation7' then
for i=0,7 do 
	setPropertyFromGroup('strumLineNotes',i,'angle',0)
end
end
if tag=='RetryAlphaEnd' then
    restartSong()
end
end
function FlipStrum(separation,Strumline)
    if not middlescroll then
		for i=0,3 do
			local Opp=getPropertyFromGroup('opponentStrums',i,'x')
			local Player=getPropertyFromGroup('playerStrums',i,'x')
			noteTweenX('XTweenOpp'..i,i,Player,(stepCrochet / 1000) * 16,'circInOut')
			OriginalXNotes[i]=Player
			noteTweenX('XTween'..i,4+i,Opp,(stepCrochet / 1000) * 16,'circInOut')
			OriginalXNotes[4+i]=Opp
		end
	else
		for i=0,3 do
			local Opp=getPropertyFromGroup('opponentStrums',i,'x')
		    local Player=getPropertyFromGroup('playerStrums',i,'x')
		    OriginalXNotes[i]=Opp
		    OriginalXNotes[4+i]=Player
		end
	end
end
function onSongStart()
	callScript('custom_events/Vignette Fade.lua','ChangeMaxAlpha',{0.25,'Static'})
	callScript('custom_events/Vignette Fade.lua','ChangeMaxAlpha',{0.6,'StaticOverlay'})
	screenCenter('QuestionareBackground','x')
	screenCenter('WigglesQuest','x')
	screenCenter('WigglesQuestClose','x')
	setProperty('WigglesQuestClose.x',getProperty('WigglesQuestClose.x')+50)

	
end
function onEvent(eventName, value1, value2)
if eventName=='ChangeToTerror' then
	useTerror=true
	setProperty('dad.idleSuffix','-alt')
    characterDance('dad')
	ChangeZoom(0.25,'dad')
end
if eventName=='Amusia Run Away' then
	doTweenAlpha('Vigette1','Static',1,8*(stepCrochet/1000),'linear')
	doTweenAlpha('Vigette2','StaticOverlay',1,8*(stepCrochet/1000),'linear')
	setGlobalFromScript('scripts/Stuff/CameraMove','ForceCamPos',true)
	runningAway=true
end
end
local Among=true
function onGameOver()
	setProperty('paused',true)
	runHaxeCode([[
		FlxG.sound.music.pause();
		game.vocals.pause();
		game.KillNotes()
	]])
    if Among then
		Among=false
		openCustomSubstate('DisabledGameOver',true)
	end
	return Function_Stop
end
function addLuaSpriteSubstate(tag)
	runHaxeCode([[
		CustomSubstate.instance.add(game.getLuaObject("]]..tag..[["));
    ]])
end
local StopPause=false
function onCustomSubstateCreate(name)
    if name=='DisabledGameOver' then	
        StopPause=true
		makeAnimatedLuaSprite('Retry','characters/Death/Retry',280, 200)
		addAnimationByPrefix('Retry','idle', "Retry instance 1", 24, false)
		addLuaSpriteSubstate('Retry')
		playAnim('Retry','idle')
        scaleObject('Retry',0.65, 0.65,false)
		setProperty('Retry.alpha',0)
		runHaxeCode([[
			var CamGM:FlxCamera =new FlxCamera();
            FlxG.cameras.add(CamGM,false);
			CustomSubstate.instance.camera=CamGM;
			setVar("camGameOverAmusia",CamGM);
		]])
		playMusic('gameOver',1,true)	
		doTweenAlpha('RetryAlpha','Retry',1,1,'linear')		
	end
end
function onCustomSubstateUpdate(name, elapsed)
	if name=='DisabledGameOver' then
		if keyJustPressed('accept') then
			setProperty('Retry.visible',false)
			playSound('gameOverEnd')
			doTweenAlpha('RetryAlphaEnd','Retry',0,1,'linear')		
		end
		if keyJustPressed('back') then
			callScript('scripts/Stuff/PlayStuff.lua','toMenu')
		end
		if getProperty('Retry.animation.curAnim.finished') then
            playAnim('Retry','idle')
		end

	end
end
function onPause()
    if StopPause then
        return Function_Stop
	end
end