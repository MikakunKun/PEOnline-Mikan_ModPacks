local onlineOwner=false
local singAnimations={'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function onCreate()
    onlineOwner=getPropertyFromClass('online.GameClient','isOwner')
    for i=0,getProperty("unspawnNotes.length")-1 do
        if onlineOwner==true then
            setPropertyFromGroup("unspawnNotes", i,'noAnimation',true)
            setPropertyFromGroup("unspawnNotes", i,'noMissAnimation',true)
            setPropertyFromGroup("unspawnNotes", i,'mustPress', not getPropertyFromGroup("unspawnNotes", i,'mustPress'))
        end
    end
end

function opponentNoteHit(noteIndex, noteData, noteType, isSustainNote)
    playAnim("boyfriend", singAnimations[(noteData%4)+1], true)
    setProperty('boyfriend.specialAnim',true)
end

function goodNoteHit(noteIndex, noteData, noteType, isSustainNote)
    playAnim("boyfriend", singAnimations[(noteData%4)+1], true)
    setProperty('boyfriend.specialAnim',true)
end