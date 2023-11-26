function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow Note' then
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Shadow_Note_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Shadow_Splash_assets');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			end

		end
	end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Shadow Note' then	
		noteTweenAlpha("NoteAlpha5", 4, -1, 3, linear)
		noteTweenAlpha("NoteAlpha6", 5, -1, 3, linear)
		noteTweenAlpha("NoteAlpha7", 6, -1, 3, linear)
		noteTweenAlpha("NoteAlpha8", 7, -1, 3, linear)
		runTimer('wait', 1);


		end
	end


function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		noteTweenAlpha("NoteAlpha5", 4, 1, 2, linear)
		noteTweenAlpha("NoteAlpha6", 5, 1, 2, linear)
		noteTweenAlpha("NoteAlpha7", 6, 1, 2, linear)
		noteTweenAlpha("NoteAlpha8", 7, 1, 2, linear)
	end
end

