function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Confusion Note' then
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Confusion_Note_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture.texture', 'Confusion_Splash_assets');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

			end

		end
	end
