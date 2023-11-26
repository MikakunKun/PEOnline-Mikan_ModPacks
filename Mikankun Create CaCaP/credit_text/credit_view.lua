local notSongs,createBar={'battle temp'},true
function onCreate()
    luaDebugMode=true
    for i=1,#notSongs do
        if notSongs[i]==string.lower(string.gsub(songName,'-',' ')) then
            createBar=false
        end
    end
    if createBar==true then
        graphicCreate('songName_BG',(screenWidth/3),screenHeight/4,'222222',0.75)
        screenCenter("songName_BG", 'x')
        textCreate('songName',songName,getProperty('songName_BG.x'),0)
        textCreate('text_from_song', 'This Song From',getProperty('songName_BG.x'),53)
        textCreate('from_song', getTextFromFile('credit_text/from_song/'..string.lower(string.gsub(songName,'-',' '))..'.txt'),getProperty('songName_BG.x'),85)
    end
end

function textCreate(tag,text,x,y)
    makeLuaText(tag, text,getProperty('songName_BG.width'), x,y)
	setTextSize(tag, 32)
	addLuaText(tag)
    setProperty(tag..'.scale.x',math.min(1,(getProperty('songName_BG.width')/getTextWidth(tag))))
    setObjectCamera(tag,'other')
end

function graphicCreate(tag,width,height,color,alpha)
    makeLuaSprite(tag, nil, 0,0)
    makeGraphic(tag, width, height, color)
    addLuaSprite(tag)
    setProperty(tag..'.alpha',alpha)
    setObjectCamera(tag,'other')
end

function onSongStart()
    if createBar==true then
        doTweenY('songName_BG_Up', 'songName_BG', -getProperty('songName_BG.height'), 0.6, "")
        doTweenY('songName_Up', 'songName', -getProperty('songName_BG.height')+getProperty('songName.y'), 0.6, "")
        doTweenY('text_from_song_Up', 'text_from_song', -getProperty('songName_BG.height')+getProperty('text_from_song.y'), 0.6, "")
        doTweenY('sfrom_song_Up', 'from_song', -getProperty('songName_BG.height')+getProperty('from_song.y'), 0.6, "")
    end
end

function onTweenCompleted(tag, vars)
    if tag=='songName_BG_Up' then
        removeLuaSprite('songName_BG')
        removeLuaText('songName')
        removeLuaText('text_from_song')
        removeLuaText('from_song')
    end
end