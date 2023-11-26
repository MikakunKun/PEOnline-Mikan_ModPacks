--this is an example script, used for modifying rating data

--it uses default values, so change these for whatever you want to

-- 0 is sick
-- 1 is good
-- 2 is bad
-- 3 is shit

-- available variables for ratingsData are

-- name
-- image
-- counter
-- hitWindow
-- ratingMod
-- score
-- noteSplash

function onCreatePost()
  -- set your scoretext size, default is 20
  setProperty('scoreTxt.size', 20)
end

function onUpdate()
  -- setting up rating names for the score bar
  -- jesus this is messy.

  -- FC Ratings

  if ratingFC == 'SFC' then ratingFC = 'SFC'
  elseif ratingFC == 'GFC' then ratingFC = 'GFC'
  elseif ratingFC == 'FC' then ratingFC = 'FC'
  elseif ratingFC == 'SDCB' then ratingFC = 'SDCB'
  elseif ratingFC == 'Clear' then ratingFC = 'Clear'
  end

   -- Ratings

   if ratingName == 'Perfect!!' then ratingName = 'Whoaaa AWESOME!!'
   elseif ratingName == 'Sick!' then ratingName = 'Aw yeahh!!'
   elseif ratingName == 'Great' then ratingName = 'Woohoo!'
   elseif ratingName == 'Good' then ratingName = 'Doin good!'
   elseif ratingName == 'Nice' then ratingName = 'heh nice'
   elseif ratingName == 'Meh' then ratingName = 'Ehh...'
   elseif ratingName == 'Bruh' then ratingName = 'wh'
   elseif ratingName == 'Bad' then ratingName = 'Yikes..'
   elseif ratingName == 'Shit' then ratingName = 'Im speechless'
   elseif ratingName == 'You Suck!' then ratingName = '..How are you not dead??'
   end
end

function onUpdatePost()
  -- set up scoreBar
  if ratingFC == '' then
    setProperty('scoreTxt.text', 'Score: 0 | Misses: 0 | Rating: ?')
  else
    setProperty('scoreTxt.text', 'NPS: ' .. nps .. ' (' .. maxNPS .. ') Score: ' .. score .. ' | Misses: ' .. misses .. ' | Rating: ' ..ratingName.. ' ('..round(rating * 100, 2).. '%) - ' ..ratingFC)
  end

  --change rating images here
  setProperty('ratingsData[0].image', 'sick')
  setProperty('ratingsData[1].image', 'good')
  setProperty('ratingsData[2].image', 'bad')
  setProperty('ratingsData[3].image', 'shit')


  --set rating millisecond hit window for each rating
  setProperty('ratingsData[0].hitWindow', 45)
  setProperty('ratingsData[1].hitWindow', 90)
  setProperty('ratingsData[2].hitWindow', 135)
  setProperty('ratingsData[3].hitWindow', 160)


  --set rating percent (accuracy) gain for each rating
  setProperty('ratingsData[0].ratingMod', 1)
  setProperty('ratingsData[1].ratingMod', 0.7)
  setProperty('ratingsData[2].ratingMod', 0.4)
  setProperty('ratingsData[3].ratingMod', 0)


  --set score gain for each rating
  setProperty('ratingsData[0].score', 350)
  setProperty('ratingsData[1].score', 200)
  setProperty('ratingsData[2].score', 100)
  setProperty('ratingsData[3].score', 50)


  --turn on or off notesplashes for the ratings you want
  setProperty('ratingsData[0].noteSplash', true)
  setProperty('ratingsData[1].noteSplash', false)
  setProperty('ratingsData[2].noteSplash', false)
  setProperty('ratingsData[3].noteSplash', false)
end

-- for rating percentage, don't bother with this one
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end