local onlineOwner=false
function onCreate()
    if getPropertyFromClass('states.PlayState','isPixelStage') then
        Path='pixel/'
    else
        Path='normal/'
    end
    LuaShowComboNum=getProperty('showComboNum')
    LuaShowRating=getProperty('showRating')
    setProperty('showCombo',false)
    setProperty('showComboNum',false)
    setProperty('showRating',false)
    onlineOwner=not runHaxeCode('return PlayState.playsAsBF();')
    if (onlineOwner==false) then
        Positions={x=screenWidth* 0.55- 40,y=(screenHeight/2)-(163/2)-60}
        PositionNum={x=(screenWidth/2)-(100/2),y=(screenHeight/2)-(140/2)}
    else
        Positions={x=-530,y=(screenHeight/2)-400}
        PositionNum={x=-450,y=(screenHeight/2)-350}
    end
    

    PositionOffsets={x=0,y=0}
    precacheImage("UI/"..Path..'combo')
    precacheImage("UI/"..Path..'judgements')
end
function SetOffsets(X,Y)
    PositionOffsets.x=X
    PositionOffsets.y=Y
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        Popup(membersIndex,false)
    end
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        Popup(membersIndex,true)
    end
end
function GetDataNote(id,var)
    return getPropertyFromGroup('notes',id,var)
end
function GetRating(RatingScore)
    local tag=''
    local EarlyLater=''
    local List={45,90,135,1000}
    if RatingScore<0 then
        EarlyLater='Late'
    else
        EarlyLater='Early'
    end
    RatingScore=math.abs(RatingScore)
    if RatingScore <= List[1] then
        tag=0
    elseif RatingScore <= List[2] then
        tag=1
    elseif RatingScore <= List[3] then
        tag=2
    elseif RatingScore <= List[4] then
        tag=3
    else
        tag=3
    end
    return getProperty('ratingsData['..tag..'].name')..EarlyLater..getProperty('ratingsData['..tag..'].hits')
end
local Negative=0
function Popup(noteID,Miss)
    luaDebugMode=true
    local ratingOffset=getPropertyFromClass('backend.ClientPrefs','data.ratingOffset')
    local Rating= (GetDataNote(noteID,'strumTime') - getSongPosition() + ratingOffset)
    local EarlyLater=''
    if Rating<0 then
        EarlyLater='Late'
    else
        EarlyLater='Early'
    end
    local PopTag=''
    if not Miss then
        PopTag=GetRating(Rating)
    else
        PopTag='Miss'..EarlyLater..misses
    end
    local Anim=0
    if LuaShowRating then
        if stringStartsWith(PopTag,'sick') then
            if getProperty('ratingsData[1].hits')<=0 and getProperty('ratingsData[2].hits')<=0 and getProperty('ratingsData[3].hits')<=0 and misses<=0 then
                MakePerfect(PopTag,Positions.x,Positions.y,EarlyLater)
                Anim=11
            else
                MakeSick(PopTag,Positions.x,Positions.y,EarlyLater)
            end
        elseif stringStartsWith(PopTag,'good') then
            MakeGood(PopTag,Positions.x,Positions.y,EarlyLater)
        elseif stringStartsWith(PopTag,'bad') then
            MakeBad(PopTag,Positions.x,Positions.y,EarlyLater)
        elseif stringStartsWith(PopTag,'shit') then
            MakeShit(PopTag,Positions.x,Positions.y,EarlyLater)
        elseif stringStartsWith(PopTag,'Miss') then
            MakeMiss(PopTag,Positions.x,Positions.y,EarlyLater)
        end
        scaleObject(PopTag,0.7,0.7)
        
        setProperty(PopTag..'.x',getProperty(PopTag..'.x')+PositionOffsets.x)
        setProperty(PopTag..'.y',getProperty(PopTag..'.y')+PositionOffsets.y)
        setProperty(PopTag..'.acceleration.y',550 * playbackRate * playbackRate)
        setProperty(PopTag..'.velocity.y',-(getRandomInt(140, 175)* playbackRate))
        setProperty(PopTag..'.velocity.x',-(getRandomInt(0, 10)* playbackRate))
        runTimer(PopTag,crochet * 0.002 / playbackRate)
    end
    if LuaShowComboNum then
        local Combo=getProperty('combo')
        local SeperatedNum={}
        if Combo<=0 and Miss then
            Negative=Negative+1
            SeperatedNum={'-',Negative}
        else
            Negative=0
            if Combo>= 1000 then
                table.insert(SeperatedNum,math.floor(Combo/1000)%10)
            end
            for i=2,0,-1 do
                table.insert(SeperatedNum,math.floor(Combo/(10^i))%10)
            end
        end
    
        for i=1,#SeperatedNum do
            local Tag=PopTag..Combo..SeperatedNum[i]..i
            
            makeLuaSprite(Tag,"UI/"..Path..'combo',PositionNum.x+(43 * (i-1)) + 20+PositionOffsets.x,PositionNum.y+60+PositionOffsets.y)
            loadGraphic(Tag,"UI/"..Path..'combo',getProperty(Tag..'.width')/11,getProperty(Tag..'.height')/2)
            if SeperatedNum[i]=='-' then
            addAnimation(Tag,'idle',{Anim},24,true)
            else
                addAnimation(Tag,'idle',{1+SeperatedNum[i]+Anim},24,true)
            end
            if Miss then
                setProperty(Tag..'.color',getColorFromRGB(204, 66, 66,true))
            end
            if getPropertyFromClass('states.PlayState','isPixelStage') then
                scaleObject(Tag,getPropertyFromClass('states.PlayState','daPixelZoom'),getPropertyFromClass('states.PlayState','daPixelZoom'))
                setProperty(Tag..'.antialiasing',false)
            else
                scaleObject(Tag,0.5,0.5)
            end
            
            addLuaSprite(Tag,true)
            setProperty(Tag..'.acceleration.y',getRandomInt(200, 300) * playbackRate * playbackRate)
            setProperty(Tag..'.velocity.y',-(getRandomInt(140, 160)* playbackRate))
            setProperty(Tag..'.velocity.x',getRandomFloat(-5, 5)* playbackRate)
            runTimer(Tag,crochet * 0.002 / playbackRate)
    
        end
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if stringStartsWith(tag,'sick') or stringStartsWith(tag,'good') or stringStartsWith(tag,'bad') or stringStartsWith(tag,'shit') or stringStartsWith(tag,'Miss') then
        doTweenAlpha(tag,tag,0,0.2 / playbackRate)
    end
end
function onTweenCompleted(tag)
    if stringStartsWith(tag,'sick') or stringStartsWith(tag,'good') or stringStartsWith(tag,'bad') or stringStartsWith(tag,'shit') or stringStartsWith(tag,'Miss') then
        removeLuaSprite(tag,true)
    end
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=string.format("%02x%02x%02x",RR,GG,BB)
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end
function MakePerfect(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{0},24,true)
    else
        addAnimation(tag,'idle',{1},24,true)
    end
    addLuaSprite(tag,true)
end
function MakeSick(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{2},24,true)
    else
        addAnimation(tag,'idle',{3},24,true)
    end
    addLuaSprite(tag,true)
end
function MakeGood(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{4},24,true)
    else
        addAnimation(tag,'idle',{5},24,true)
    end
    addLuaSprite(tag,true)
end
function MakeBad(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{6},24,true)
    else
        addAnimation(tag,'idle',{7},24,true)
    end
    addLuaSprite(tag,true)
end
function MakeShit(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{8},24,true)
    else
        addAnimation(tag,'idle',{9},24,true)
    end
    addLuaSprite(tag,true)
end
function MakeMiss(tag,x,y,EarlyLater)
    local path=Path
    if songPath=='brimstone' then
        path=Path..'brimstone-'
    end
    makeLuaSprite(tag,"UI/"..path..'judgements',x,y)
    loadGraphic(tag,"UI/"..path..'judgements',getProperty(tag..'.width')/2,getProperty(tag..'.height')/6)
    if EarlyLater=='Early' then
        addAnimation(tag,'idle',{10},24,true)
    else
        addAnimation(tag,'idle',{11},24,true)
    end
    addLuaSprite(tag,true)
end