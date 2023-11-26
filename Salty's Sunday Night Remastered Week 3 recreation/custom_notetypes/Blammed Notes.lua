function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do	
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blammed Notes' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Blammed');
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes',i,'missHealth', 0.3)

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				
			end
		end
	end

end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == "Blammed Notes" then
			triggerEvent('Play Animation', 'shoot', 0);
			triggerEvent('Screen Shake', "0.25, 0.0025", 0)
			playSound('gun')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Blammed Notes' then
		playSound('shoot', 0.5)
		end
	if noteType == "Blammed Notes" then
		triggerEvent('Screen Shake', "0.25, 0.0025", 0)
		triggerEvent('Play Animation', 'shoot', 0);
			if direction==0 then
					triggerEvent('Play Animation', 'singLEFT', 1 );
			elseif direction==1 then
					triggerEvent('Play Animation', 'singDOWN', 1);
			elseif direction==2 then
					triggerEvent('Play Animation', 'singUP', 1);
			elseif direction==3 then
					triggerEvent('Play Animation', 'singRIGHT', 1);
			end
	end
end
