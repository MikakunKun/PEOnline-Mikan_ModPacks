local playerHealth=2
local healthBar=false
local huds={'iconP1','iconP2','healthBar','healthBar.bg'}
function onCreatePost()
    addLuaScript('custom_events/Cinematics')
    luaDebugMode=true
    onHealthBarsCreate()
    addHaxeLibrary('objects.HealthIcon')
    runHaxeCode([[
        setVar('lDance',false);
        var luaHealthBarBG=game.getLuaObject('luaHealthBarBG');

        var iconBf = new HealthIcon(game.boyfriend.healthIcon, true);
        iconBf.y = luaHealthBarBG.y + (luaHealthBarBG.height/2) - iconBf.height/2;
        iconBf.x = luaHealthBarBG.x + (luaHealthBarBG.width*1.5);
        iconBf.cameras = [game.camGame];
        iconBf.scrollFactor.set(1,1);
        game.add(iconBf);
        setVar('iconBf',iconBf);
    ]])
end

function onUpdate(elapsed)
    for i=1,#huds do setProperty(huds[i]..'.visible',healthBar) end
    if (healthBar==false) then
        setProperty('health',1)
        onHealthBarUpdate()
        addHaxeLibrary('backend.CoolUtil')
        addHaxeLibrary('FlxMath','flixel.math')
        runHaxeCode([[
            var playbackRate = game.playbackRate;
            var nowHealth=]]..playerHealth..[[;
            var elapsed = ]]..elapsed..[[;
            var iconBf=getVar('iconBf');
            
            var mult = FlxMath.lerp(1, iconBf.scale.x, FlxMath.bound(1 - (elapsed * 9 * playbackRate), 0, 1));
            iconBf.scale.set(mult, mult);
            iconBf.updateHitbox();
    
            if (nowHealth*50 < 30) iconBf.animation.curAnim.curFrame = 1; //lose icon
            else iconBf.animation.curAnim.curFrame = 0; // normal icon
        ]])
        if playerHealth<=0 then
            healthBar=true
        end
    end
end

function noteMiss(noteIndex, noteData, noteType, isSustainNote)
    playerHealth=playerHealth-0.024
end
local funky_Beat='normal'

function onEvent(eventName, value1, value2, strumTime)
    if eventName=='Change To Middle Scroll' then
		if value1=='true' then
            funky_Beat='high'
            for i=0,getProperty('playerStrums.length')-1 do noteTweenX('default_playerStrums_Xmove'..i, i+(getProperty('strumLineNotes.length')-4), (_G['defaultPlayerStrumX'..i]+_G['defaultOpponentStrumX'..i])/2, 1, 'backout') end
            for i=0,getProperty('opponentStrums.length')-1 do
                noteTweenX('default_opponentStrums_Xmove'..i, i, 0+(getPropertyFromGroup('opponentStrums',0,'width')*0.50)*i , 1, 'backout')
                noteTweenY('default_opponentStrums_Ymove'..i, i, _G['defaultOpponentStrumY'..i]+100, 1, 'backout')
                doTweenX('default_opponentStrums_scale_X'..i, 'opponentStrums.members['..i..'].scale', 0.50, 1, 'backout')
                doTweenY('default_opponentStrums_scale_Y'..i, 'opponentStrums.members['..i..'].scale', 0.50, 1, 'backout')
            end
		else
            funky_Beat='normal'
            for i=0,getProperty('playerStrums.length')-1 do noteTweenX('default_playerStrums_Xmove'..i, i+(getProperty('strumLineNotes.length')-4), _G['defaultPlayerStrumX'..i], 1, 'backout') end
            for i=0,getProperty('opponentStrums.length')-1 do
                noteTweenX('default_opponentStrums_Xmove'..i, i, _G['defaultOpponentStrumX'..i], 1, 'backout')
                noteTweenY('default_opponentStrums_Ymove'..i, i, _G['defaultOpponentStrumY'..i], 1, 'backout')
                doTweenX('default_opponentStrums_scale_X'..i, 'opponentStrums.members['..i..'].scale', 0.7, 1, 'backout')
                doTweenY('default_opponentStrums_scale_Y'..i, 'opponentStrums.members['..i..'].scale', 0.7, 1, 'backout')
            end
		end
    elseif eventName=='MoveArrowsToMiddle' then
		if value1=='1' then
            funky_Beat='highst'
            for i=0,getProperty('playerStrums.length')-1 do noteTweenX('default_playerStrums_Xmove'..i, i+(getProperty('strumLineNotes.length')-4), (screenWidth/2)+getPropertyFromGroup('playerStrums',0,'width')*i, 1, 'backout') end
            for i=0,getProperty('opponentStrums.length')-1 do noteTweenX('default_opponentStrums_Xmove'..i, i, (screenWidth/2)-(getPropertyFromGroup('opponentStrums',0,'width')*(getProperty('opponentStrums.length')-i)) , 1, 'backout') end
		else
            funky_Beat='normal'
            for i=0,getProperty('playerStrums.length')-1 do noteTweenX('default_playerStrums_Xmove'..i, i+(getProperty('strumLineNotes.length')-4), _G['defaultPlayerStrumX'..i], 1, 'backout') end
            for i=0,getProperty('opponentStrums.length')-1 do noteTweenX('default_opponentStrums_Xmove'..i, i, _G['defaultOpponentStrumX'..i], 1, 'backout') end
		end
    elseif eventName=='Cinematic Bars' then
		if value1=='true' then triggerEvent('Cinematics',1,0)
        else triggerEvent('Cinematics',0,2) end
    end
end

function onBeatHit()
    runHaxeCode([[
        var lDance=!getVar('lDance');
		var playbackRate = game.playbackRate;
        var gfSpeed=game.gfSpeed;
        var iconBf=getVar('iconBf');

        if (']]..funky_Beat..[['=='normal') {
            iconBf.flipX=false;
            if (lDance){
                iconBf.scale.set(1.2, 1);
                FlxTween.angle(iconBf, -30, 0, Conductor.crochet / 1300 / playbackRate * gfSpeed, {ease: FlxEase.quadOut});
            } else { 
                iconBf.scale.set(1.2, 1.4);
                FlxTween.angle(iconBf, 30, 0, Conductor.crochet / 1300 / playbackRate * gfSpeed, {ease: FlxEase.quadOut});
            }
        } else if (']]..funky_Beat..[['=='high') {
            iconBf.flipX=false;
            if (lDance){
                FlxTween.angle(iconBf, -30, 0, Conductor.crochet / 1300 / playbackRate * gfSpeed, {ease: FlxEase.quadOut});
            }
            iconBf.scale.set(1.2, 1.2);
        } else if (']]..funky_Beat..[['=='highst') {
            if (lDance){
                iconBf.flipX=true;
                FlxTween.angle(iconBf, -30, 0, Conductor.crochet / 1300 / playbackRate * gfSpeed, {ease: FlxEase.quadOut});
            } else {
                iconBf.flipX=false;
                FlxTween.angle(iconBf, 30, 0, Conductor.crochet / 1300 / playbackRate * gfSpeed, {ease: FlxEase.quadOut});
            }
            iconBf.scale.set(1.2, 1.2);
        }
        iconBf.updateHitbox();
        setVar('lDance',lDance);
    ]])
end

local lua_bars={}
local barDirectionData={
'LEFT_TO_RIGHT',
'RIGHT_TO_LEFT',
'TOP_TO_BOTTOM',
'BOTTOM_TO_TOP',
'CENTER',
events={
    [0]=function(v)--LEFT_TO_RIGHT
        if (v.get_Property == true) then setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax)
        else setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax) end
        if (getP(v.barName..'_left.scale.x') >= 1) then setP(v.barName..'_left.scale.x',1) end
        updateHitbox(v.barName..'_left')
    end,
    [1]=function(v)--RIGHT_TO_LEFT
        if (v.get_Property == true) then setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax)
        else setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax) end
        if (getP(v.barName..'_left.scale.x') >= 1) then setP(v.barName..'_left.scale.x',1) end
        updateHitbox(v.barName..'_left')
        setP(v.barName..'_left.x',(getP(v.barName..'_right.x')+getP(v.barName..'_right.width'))-getP(v.barName..'_left.width'))
    end,
    [2]=function(v)--TOP_TO_BOTTOM
        if (v.get_Property == true) then setP(v.barName..'_left.scale.y',v.barPrercent()/v.barMax)
        else setP(v.barName..'_left.scale.y',v.barPrercent()/v.barMax) end
        if (getP(v.barName..'_left.scale.y') >= 1) then setP(v.barName..'_left.scale.y',1) end
        updateHitbox(v.barName..'_left')
    end,
    [3]=function(v)--BOTTOM_TO_TOP
        if (v.get_Property == true) then setP(v.barName..'_left.scale.y',v.barPrercent()/v.barMax)
        else setP(v.barName..'_left.scale.y',v.barPrercent()/v.barMax) end
        if (getP(v.barName..'_left.scale.y') >= 1) then setP(v.barName..'_left.scale.y',1) end
        updateHitbox(v.barName..'_left')
        setP(v.barName..'_left.y',(getP(v.barName..'_right.y')+getP(v.barName..'_right.height'))-getP(v.barName..'_left.height'))
    end,
    [4]=function(v)--CENTER
        if (v.get_Property == true) then setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax)
        else setP(v.barName..'_left.scale.x',v.barPrercent()/v.barMax) end
        if (getP(v.barName..'_left.scale.x') >= 1) then setP(v.barName..'_left.scale.x',1) end
    end
}}
-- LEFT_TO_RIGHT
-- RIGHT_TO_LEFT
-- CENTER
function barDirectionCheck(direction)
    for i, v in ipairs(barDirectionData) do
        if (v==string.upper(direction)) then return string.upper(v) end
    end
    return 'LEFT_TO_RIGHT'
end

function onHealthBarsCreate()
    local bfColor,bftextcolor={},''
    bfColor=getProperty('boyfriend.healthColorArray')
    bftextcolor = getColorFromRGB(bfColor[1],bfColor[2],bfColor[3],false)
    barBGCreate('luaHealthBarBG',20,getP('boyfriend.height'),'000000',getObjectOrder('boyfriendGroup'),getP('boyfriend.x')+getP('boyfriend.height'),getP('boyfriend.y'),'game')

    barCreate('luaHealthBar',getObjectOrder('luaHealthBarBG')+1,getP('luaHealthBarBG.x')+4,getP('luaHealthBarBG.y')+4,'BOTTOM_TO_TOP','game',
    getP('luaHealthBarBG.width')-8,(getP('luaHealthBarBG.height')-8),function() return playerHealth end,playerHealth,bftextcolor,'ff0000',
    {function_true=false})
end

function barBGCreate(name,width,height,color,order,x,y,cam)
    makeLuaSprite(name, nil, x, y)
    makeGraphic(name, 1, 1, color)
    setGraphicSize(name, width, height, true)
    setObjectOrder(name, order)
    setObjectCamera(name,cam)
    addLuaSprite(name)
end

function textCreate(name,text,width,aligment,order,x,y,cam)
    makeLuaText(name, text, width, x, y)
    setTextAlignment(name, aligment)
    setObjectOrder(name, order)
    setObjectCamera(name,cam)
    addLuaText(name)
    setProperty(name..'.scrollFactor.x',1) setProperty(name..'.scrollFactor.y',1)
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor,RGBNum='',{"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    if RR>255 then RR="255" end
    if GG>255 then GG="255" end
    if BB>255 then BB="255" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1] end
    if PassFromHex then return getColorFromHex(FinalColor) else return FinalColor end
end

function barCreate(tag,order,x,y,direction,cam,barWidth,barHeight,percent_function,max,leftColor,rightColor,functionOptions)
    local thisBarDirection = barDirectionCheck(direction)
    makeLuaSprite(tag..'_right', nil, 0, 0)
    makeGraphic(tag..'_right', barWidth, barHeight, rightColor)
    setObjectCamera(tag..'_right', cam)

    --lua_version_bar_left create
    makeLuaSprite(tag..'_left', nil, 0, 0)
    makeGraphic(tag..'_left', 1, 1, leftColor)
    makeGraphic(tag..'_left', barWidth, barHeight, leftColor)
    setObjectCamera(tag..'_left', cam)
    
    --lua_version_bar position set
    setP(tag..'_left.x',x)
    setP(tag..'_left.y',y)

    setP(tag..'_right.x',getP(tag..'_left.x'))
    setP(tag..'_right.y',getP(tag..'_left.y'))

    setObjectOrder(tag..'_left',order)
    setObjectOrder(tag..'_right',order)

    --lua_version_bar add game
    addLuaSprite(tag..'_right', false)
    addLuaSprite(tag..'_left', false)

    local tempBarTable={barName=tag,barDirection=thisBarDirection,barMax=max,get_Property=true,barPrercent=percent_function,function_Bool=functionOptions.function_true,function_data=functionOptions.functionData}
    table.insert(lua_bars,tempBarTable)
end

function onHealthBarUpdate(elapsed)
    for i, v in ipairs(lua_bars) do
        for e, d in ipairs(barDirectionData) do
            if (v.function_Bool == true) then v.function_data() end
            if (v.barDirection == d) then barDirectionData.events[e-1](v) break end
        end
    end
end

function getP(tag) return getProperty(tag) end
function setP(tag,value) setProperty(tag,value) end