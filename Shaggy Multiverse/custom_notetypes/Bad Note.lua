function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bad Note' then
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			local path = 'badnotes/BAD'
			setPropertyFromGroup('unspawnNotes', i, 'texture', path); --Change texture
			
		end
	end
end