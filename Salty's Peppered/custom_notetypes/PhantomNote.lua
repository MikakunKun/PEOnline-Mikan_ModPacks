function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'PhantomNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PhantomNote');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.1');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.1');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
	--debugPrint('Script started!')
end