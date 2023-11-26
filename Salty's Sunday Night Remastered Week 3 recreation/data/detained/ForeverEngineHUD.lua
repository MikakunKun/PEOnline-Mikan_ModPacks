
-- settings
local fakeForever = true -- changes the watermark text between forever engine and psych engine, depending on what you wanna make
local miniTimeTxt = false -- adds a little time bar where the diff text is, which isnt forever accurate but is a neat touch

-- data i stole from forever engine
local foreverLetters = {'S+', 'S', 'A', 'B', 'C', 'D', 'E', 'F'}
local foreverPercents = {100, 95, 90, 85, 80, 75, 70, 65}
local foreverRating = {'SFC', 'GFC', 'FC', 'F'}
local foreverHealth = true -- whether to have the default colors for the health bar

local infoX = 515

if miniTimeTxt then
  infoX = 405
end

function onCreatePost()
setHealthBarColors('035202', '16FF26');

  -- hide original psych ui
  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)
  setProperty('scoreRating.visible',false)

  -- setup forever ui
  makeLuaText('foreverScore', 'Score: 0 - Accuracy: N/A - Rank: F', 1280, 0, (downscroll and 0 or 670));
  setTextBorder("foreverScore", 1.5, '000000')
  setTextAlignment('foreverScore', 'CENTER')
  setTextSize('foreverScore', 16)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverScore') end

  makeLuaText("foreverCenterMark",'', 1280, -6, 5)
           setTextSize('foreverCenterMark', 24);
           setProperty('foreverCenterMark.alpha', 1)
           setTextAlignment('foreverCenterMark', 'center') 
           addLuaText('foreverCenterMark')
           setObjectCamera('foreverCenterMark', 'hud');
           setTextBorder('foreverCenterMark',2,'000000')
           setTextString('foreverCenterMark',' - ' .. songName .. ''..' - ')--Este code me tomó 30m aaaa
  
  makeLuaText('foreverCornerMark', (fakeForever and 'Salt Engine v0.3' or 'Forever Engine v' .. version), 1275, 0, 695)
  setTextAlignment('foreverCornerMark', 'RIGHT')
  setTextFont('foreverCornerMark', 'vcr.ttf');
  
  setTextBorder("foreverCornerMark", 1, '000000')
  setTextSize('foreverCornerMark', 16)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverCornerMark') end
end

function onUpdate()
  if miniTimeTxt and getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled' and curStep > 0 then
    setTextString('foreverCenterMark', ' - ' .. songName .. ' ' .. string.upper.. ' - ' .. milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)) .. ' / ' .. milliToHuman(math.floor(songLength)) .. ' -')
  end
end

function onRecalculateRating()
  reloadRating(round((getProperty('ratingPercent') * 100), 2))
  setTextString('foreverScore',
  'Score: '..score.. -- setup score
  ' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'.. --setup accuracy
  (((hits > 0) or (songMisses > 0)) and ' [' .. (not botPlay and ratingFC or 'F') .. ']' or '').. -- figure out fc
  ' - Combo Breaks: '..misses.. -- misses (easy)
  ' - Rank: '..foreverRating) -- rating (dumb)
end

function reloadRating(percent)
  -- figures out your rating
  for i = 1,#foreverLetters do
    if foreverPercents[i] <= percent then
      foreverRating = foreverLetters[i]
      break 
    end
  end
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end