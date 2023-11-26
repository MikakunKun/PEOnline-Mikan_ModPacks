function onUpdate()
setProperty('scoreTxt.visible', false)
end

function onCreatePost()
setProperty('timeBarBG.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeTxt.visible', false)

makeLuaText('newscore','Score: ' .. score, 551, 390, 680)
setTextAlignment('newscore', 'left')
addLuaText('newscore')
setObjectOrder('newscore', 41)

makeLuaText('newmisses','Misses: 0', 551, 320, 680)
setTextAlignment('newmisses', 'right')
addLuaText('newmisses')
setObjectOrder('newmisses', 41)
end

function onRecalculateRating()
setTextString('newscore','Score: ' .. score)
setTextString('newmisses','Misses: ' .. misses)
end