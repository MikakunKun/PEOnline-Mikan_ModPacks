local makeIt = false
local madeCred = false
local scaleBg = {0.35, 0.45}

local removeHypens = false -- get rid of hypens from the song name | This is ONLY for the song name that shows on the bar
    local captialization = false -- Captialize the first letter from the song name | No real need if you don't use remove hypen

local allUpper = false -- Song name is being shouted at you (All caps)
local showCredit = true -- Shows the "Made By" thing

-- Easier to set colors --
local songTxtColor = 'ffffff'
local nowPlaynColor = 'ffffff'
local credColor = 'ffffff'

local moveOutTime = 3.7 -- How long should it last

function onCreate()
    -- fuck it

    count = string.len(songName)
    toughness = string.upper(difficultyName) -- it was this easy
    toughnessSmal = shrank(difficultyName)   -- smh -_-

    noHypens = fuckHypens(songName)
    properSongName = captialIt(noHypens) -- only for no hypens

    useName = ''

    if removeHypens == true and captialization == true then -- questionable | Is there a better way to do this?
        useName = properSongName
    elseif removeHypens == true then
        useName = noHypens
    elseif allUpper == true then
        useName = string.upper(songName)
    else
        useName = songName
    end

    if showCredit == false then
        scaleBg[2] = 0.36
    end

    name = '' .. getTextFromFile('credits/'..noHypens..'.txt') -- This fixes the need to guess whether the song name has hypens or not for the credits | Not perfect though

   

    --debugPrint(count)
    
    -- literally wont let the text thing pop up is there's nothing there or it can't find the file??? Weird

    -- make a folder called credits, then put a text file in there 
    -- with the song name and the person's or composer's name IN the text file

	makeLuaSprite('bgThing', 'songBG', -550, 470)
    scaleObject('bgThing', scaleBg[1], scaleBg[2])
	setObjectCamera('bgThing', 'other')
    addLuaSprite('bgThing', true)
    setScrollFactor('bgThing', 0, 0)
    setProperty('bgThing.alpha', tonumber(0.7))

    if count < 15 then
        makeLuaText('songText', "".. useName.. " - ".. toughness, 400, getProperty('bgThing.x') + 180, 520) -- 20 letters is the width limit
        setObjectCamera("songText", 'other');
        setTextColor('songText', '0x'..songTxtColor)
        setTextSize('songText', 30);
        addLuaText("songText");
        setTextFont('songText', "vcr.ttf")
        setTextAlignment('songText', 'left')
    else
        makeIt = true
        makeLuaText('songText', "".. useName, 400, getProperty('bgThing.x') + 180, 520) -- Too big song name
        setObjectCamera("songText", 'other');
        setTextColor('songText', '0x'..songTxtColor)
        setTextSize('songText', 30);
        addLuaText("songText");
        setTextFont('songText', "vcr.ttf")
        setTextAlignment('songText', 'left')
    end
    if makeIt == true then -- too big of a song name
        makeLuaText('optionalText', " / ".. toughnessSmal, 400, getProperty('bgThing.x') + 180, 535)
        setObjectCamera("optionalText", 'other');
        setTextColor('optionalText', '0x'..songTxtColor)
        setTextSize('optionalText', 20);
        addLuaText("optionalText");
        setTextFont('optionalText', "vcr.ttf")
        setTextAlignment('optionalText', 'left')
        setObjectOrder('optionalText', 3)
    end
    
    makeLuaText('beforeSongText', "Now Playing... ", 300, getProperty('bgThing.x') + 100 - 40, 480)
    setObjectCamera("beforeSongText", 'other');
    setTextColor('beforeSongText', '0x'..nowPlaynColor)
    setTextSize('beforeSongText', 25);
    addLuaText("beforeSongText");
    setTextFont('beforeSongText', "vcr.ttf")
    setTextAlignment('beforeSongText', 'left')

    if showCredit == true then
        makeLuaText('whoDuntIt', "Made by - ".. name, 400, getProperty('bgThing.x') + 180, 560)
        setObjectCamera("whoDuntIt", 'other');
        setTextColor('whoDuntIt', '0x'..credColor)
        setTextSize('whoDuntIt', 27);
        addLuaText("whoDuntIt");
        setTextFont('whoDuntIt', "vcr.ttf")
        setTextAlignment('whoDuntIt', 'left')
        setObjectOrder('whoDunIt', 3)
        madeCred = true
    end


    setObjectOrder('beforeSongText', 3)
    setObjectOrder('songText', 3)
    setObjectOrder('bgThing', 2)
end

-- still might need the ol' fuckin with if you got a big ass name, but should be better
local countIt = false
local startedIt = false
function onCreatePost()
    if getProperty('inCutscene') == false then
        doTweenX('bgThingMoveIn', 'bgThing', -50, 0.5, 'linear')
        doTweenX('bgThingText', 'songText', 50, 0.5, 'linear') 
        doTweenX('bgThingTextBleb', 'beforeSongText', 20, 0.5, 'linear')

        if madeCred == true then
            doTweenX('bgThingCredit', 'whoDuntIt', 70, 0.5, 'linear')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextIn', 'optionalText', 350, 0.5, 'linear')
        end

        runTimer('moveOut', moveOutTime + (stepCrochet * 0.004), 1)
    else
        countIt = true -- move it to countdown
    end
end

function onStartCountdown(count)
    if countIt == true and startedIt == false then
        startedIt = true
        doTweenX('bgThingMoveInL8', 'bgThing', -50, 0.1, 'linear')
        doTweenX('bgThingTextL8', 'songText', 50, 0.1, 'linear') 
        doTweenX('bgThingTextBlebL8', 'beforeSongText', 20, 0.1, 'linear')
        
        if madeCred == true then
            doTweenX('bgThingCreditL8', 'whoDuntIt', 70, 0.1, 'linear')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextInL8', 'optionalText', 350, 0.1, 'linear')
        end

        runTimer('moveOut', moveOutTime + (stepCrochet * 0.004), 1)
    end 
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveOut' then
        doTweenX('bgThingLeave', 'bgThing', -10000, 2.5, 'linear')
        doTweenX('bgThingLeaveText', 'songText', -10000, 2.5, 'linear')
        doTweenX('bgThingLeavePreText', 'beforeSongText', -10000, 2.5, 'linear')

        if madeCred == true then
            doTweenX('bgThingLeaveCredit', 'whoDuntIt', -10000, 2.5, 'linear')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextBye', 'optionalText', -10000, 2.5, 'linear') -- long ass name
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'bgThingLeave' then
        removeLuaSprite('whoDuntIt', true)
        removeLuaSprite('bgThing', true)
        removeLuaText('songText', true)
        removeLuaText('optionalText', true)
        removeLuaText('beforeSongText', true)
    end
end


function shrank(diff)
    diff = string.upper(diff)

    if diff == 'HARD' then
        return 'HARD'
    elseif diff == 'NORMAL' then
        return 'NRML'
    elseif diff == 'EASY' then
        return 'EASY'
    else
        return diff -- cause unique difficulty names 'n all that jazz
    end
end

function captialIt(song)
    cool = string.lower(song)
    return (cool:gsub("^%l", string.upper))
end

function fuckHypens(song)
    return (song:gsub("%-", " "))
end