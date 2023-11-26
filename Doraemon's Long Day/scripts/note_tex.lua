local notes = 0
local note_counter = nil
local note_tex = "NOTE_assets"
local note_increment = 8

--

function change(tex)
	notes = getProperty("unspawnNotes.length") - 1
	note_counter = 0
	note_tex = tex
	
	for i = 0, 7 do
		setPropertyFromGroup("strumLineNotes", i, "texture", note_tex)
	end
	
	for i = 0, getProperty("notes.length") - 1 do
		setPropertyFromGroup("notes", i, "texture", note_tex)
	end
end

--

function onCreate()
	precacheImage("NOTE_assets")
end

function onUpdatePost()
	if note_counter then
		if note_counter < notes then
			for i = note_counter, note_counter + note_increment do
				setPropertyFromGroup("unspawnNotes", i, "texture", note_tex)
			end
			
			note_counter = note_counter + note_increment
		else
			for i = note_counter, notes do
				setPropertyFromGroup("unspawnNotes", i, "texture", note_tex)
			end
			
			note_counter = nil
		end
	end
end