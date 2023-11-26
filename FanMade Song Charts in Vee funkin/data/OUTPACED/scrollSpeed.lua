function onCreate()
    luaDebugMode=true
end
function onSpawnNote(noteIndex, noteData, noteType, isSustainNote, strumTime)
    local randomSpeed=1
    if isSustainNote==false then
        if curBeat >= 210-6 and curBeat <= 280-6 then randomSpeed=getRandomFloat(0.9,1.25)
        elseif curBeat >= 486-6 then randomSpeed=getRandomFloat(0.8,1.35) end
        setProGroup('notes',noteIndex,'multSpeed',randomSpeed)
    end
end

function onUpdatePost(elapsed)
    setProperty('camHUD.zoom',lerp(0.8, getProperty('camHUD.zoom'), bound(1 - (elapsed * 3.125 * getProperty('camZoomingDecay') * getProperty('playbackRate')), 0, 1)))
    for noteIndex=0,getProperty('notes.length')-1 do
        if getProGroup('notes',noteIndex,'isSustainNote')==false then
            if getProperty('notes.members['..noteIndex..'].tail.length')>1 and getProperty('notes.members['..noteIndex..'].tail.length')~=nil then
                for tailIndex=0,getProperty('notes.members['..noteIndex..'].tail.length')-1 do
                    setProperty('notes.members['..noteIndex..'].tail['..tailIndex..'].multSpeed', getProGroup('notes',noteIndex,'multSpeed'))
                end
            end
        end
    end
end

function setProGroup(obj,i,variable,value) setPropertyFromGroup(obj,i,variable,value) end
function getProGroup(obj,i,variable) return getPropertyFromGroup(obj,i,variable) end
function lerp(a, b, t) return a + (b - a) * t end
function bound(value, min, max) return math.min(math.max(value, min), max) end