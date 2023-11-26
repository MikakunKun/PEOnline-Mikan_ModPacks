function onCreate()
	animationSprite('static','HomeStatic',-75,-100, 1, 1,1.5,1.5,'HomeStatic',false);

	makeAnimatedLuaSprite('ContractBF', 'characters/Beelze/ContractBF', getCharacterX('dad')- 100, getCharacterY('dad')+115)
    setGraphicSize('ContractBF',  getProperty('ContractBF.width')* 0.95, getProperty('ContractBF.height')* 0.95)
    addAnimationByPrefix('ContractBF', 'idle', 'ContractIdle',24,true)
	addAnimationByPrefix('ContractBF', '1', 'Contract_BF_01',24,false)
	addAnimationByPrefix('ContractBF', '2', 'Contract_BF_02',24,false)
	addAnimationByPrefix('ContractBF', '3', 'Contract_BF_03',24,false)
	addAnimationByPrefix('ContractBF', '4', 'Contract_BF_04',24,false)
	addAnimationByPrefix('ContractBF', '5', 'Contract_BF_05',24,false)
	addAnimationByPrefix('ContractBF', '6', 'Contract_BF_06',24,false)
	addAnimationByPrefix('ContractBF', '7', 'Contract_BF_07',24,false)
	addAnimationByPrefix('ContractBF', '8', 'Contract_BF_08',24,false)
	addAnimationByPrefix('ContractBF', '9', 'Contract_BF_09',24,false)
    playAnim('ContractBF','idle')

	contractY=getProperty('ContractBF.y')

	bgSprite('bg','BG',-75,-100, 1, 1,1.5,1.5,false);

    setObjectOrder('gfGroup', getObjectOrder('bg'))
end

function bgSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,front)
	makeLuaSprite(tag, 'DDTO/ruinedclub/'..folder, x, y)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
	addLuaSprite(tag,front)
end

function animationSprite(tag,folder,x,y,scrollx,scrolly,scalex,scaley,animationname,front)
    makeAnimatedLuaSprite(tag, 'DDTO/ruinedclub/'..folder, x, y)
    addAnimationByPrefix(tag, animationname, animationname, 24, true)
	setProperty(tag..'.scrollFactor.x',scrollx)
	setProperty(tag..'.scrollFactor.y',scrolly)
	setProperty(tag..'.scale.x',scalex)
	setProperty(tag..'.scale.y',scaley)
	addLuaSprite(tag,front)
end

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Animation' then
            setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '')
        end
    end
    
end
local ColorHealthBar=nil
function onStartCountdown()
    ColorHealthBar={dad=getProperty('dad.healthColorArray'),dawn=getProperty('boyfriend.healthColorArray'),bf=getProperty('OtherBoyfriend.healthColorArray')}
end


local contractStep=0
local percentage=0
local endalpha=false

function onUpdate(elapsed)
	if luaSpriteExists('ContractBF') and contractStep <= 9 then 
		setProperty('ContractBF.y',contractY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 48)) * 16);
	end
	setProperty('gf.y',defaultGirlfriendY + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 72)) * 32)  
	setProperty('gf.x',defaultGirlfriendX + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor','songPosition') / 1000) / 96)) * 16)  

	percentage =(contractStep * contractStep) / 100
	if contractStep > 4 then
		percentage = percentage+math.sin(((getPropertyFromClass('Conductor','songPosition')) / (stepCrochet  * 16)) * math.pi) * (contractStep / 10) * 0.25;

	end
	if contractStep > 9 then 
		percentage = 1 
	end
    if not endalpha then
        if contractStep~=0 then
            setProperty('boyfriend.alpha',1-percentage)
            setProperty('iconP1.alpha',1-percentage)
        end
        setProperty('OtherBoyfriend.alpha',percentage)
        setProperty('OtherBoyfriendicon.alpha',percentage)
    end
	if ColorHealthBar~=nil then
		local BoyfriendColor={toInt(Lerp(ColorHealthBar.dawn[1],ColorHealthBar.bf[1],percentage)),toInt(Lerp(ColorHealthBar.dawn[2],ColorHealthBar.bf[2],percentage)),toInt(Lerp(ColorHealthBar.dawn[3],ColorHealthBar.bf[3],percentage))}
	    setHealthBarColors(getColorFromRGB(ColorHealthBar.dad[1],ColorHealthBar.dad[2],ColorHealthBar.dad[3]),getColorFromRGB(BoyfriendColor[1],BoyfriendColor[2],BoyfriendColor[3]))
	end
end

function toInt(float)
	if float<=math.floor(float)+0.5 then
		return math.floor(float)
	else
		return math.ceil(float)
	end
end

function Lerp(Min,Max,Ratio)
	return Min + Ratio * (Max - Min)
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
	local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
	if PassFromHex then
		return getColorFromHex(FinalColor)
	else
		return FinalColor
	end
end

function onEvent(tag,value1,value2)
	if tag == 'BongHellBell' then
	playAnim('gf','Bong',true)
	setProperty('gf.specialAnim',true)	
	cameraShake('game',0.015,0.075)
	runTimer('bongF',0.075,1)
	runTimer('bongS',0.15,1)
	end
	if tag=='Contract_Advance' then
		contractStep=contractStep+1
		if contractStep<10 then
            playAnim('ContractBF',tostring(contractStep),true)
		else
			
			doTweenColor('ContractColor','ContractBF','0xFF3131',1.3,'backIn')
            doTweenX('ContractXscale','ContractBF.scale',0.3,1.3,'backIn')
			doTweenY('ContractYscale','ContractBF.scale',0.3,1.3,'backIn')
            doTweenAlpha('ContractAlpha','ContractBF',0,1.3,'backIn')
			
		end
	end
    if tag=='Change Character' then
        if value1=='dad' then
            addLuaSprite('ContractBF', true)
            playAnim('boyfriend','pre-attack',true)
        elseif value1=='bf' and value2=='bf-tabi' then
            endalpha = true
            setProperty('boyfriend.alpha',1)
            setProperty('iconP1.alpha',1)
            setProperty('OtherBoyfriend.alpha',0)
            setProperty('OtherBoyfriendicon.alpha',0)
        end
    end
    if tag=='Morph' then
        playAnim('boyfriend','hurt',true)
    end
end

local flicker=true
function onTimerCompleted(tag, loops, loopsLeft)
	if tag=='bongF' then
		cameraShake('game',0.009,0.15)
	end
	if tag=='bongS' then
		cameraShake('game',0.005,0.3)
	end
end