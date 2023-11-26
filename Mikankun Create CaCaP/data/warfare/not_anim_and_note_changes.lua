local loop,notes=0,{'Pika_Note','Liza_Note'}
function onCreate()
    for i=0,getProperty('eventNotes.length')-1 do
        if getPropertyFromGroup('eventNotes', i-loop, 'event') == 'Play Animation' then
            if getPropertyFromGroup('eventNotes', i-loop, 'value1') == 'guncock' or
            getPropertyFromGroup('eventNotes', i-loop, 'value1') == 'Shoot' then
                removeFromGroup('eventNotes', i-loop)
            end
        end
    end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note' then
            setPropertyFromGroup('unspawnNotes', i, 'noteType',notes[getRandomInt(1,#notes)])
        end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pika_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'vs_reds/PIKANOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
		end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Liza_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'vs_reds/LIZANOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
		end
	end
end

function goodNoteHit(noteID,noteData,noteType,isSustain)
    playPokemon_AttackSound(noteType)
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    playPokemon_AttackSound(noteType)
end

function playPokemon_AttackSound(noteType)
	if (noteType == 'Pika_Note') then
		playSound('Thunder',0.85)
	end
	if (noteType == 'Liza_Note') then
		playSound('Flame',0.85)
	end
end