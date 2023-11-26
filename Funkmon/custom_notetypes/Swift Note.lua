function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Swift Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Swift Note' then
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Swift_Note_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Swift_Splash_assets');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			end

		end
	end
