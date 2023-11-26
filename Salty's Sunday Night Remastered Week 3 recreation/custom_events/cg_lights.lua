local function noteHit(id, noteData, isSustainNote)
	removeLuaSprite('image', true);
	makeLuaSprite('image', ({"LEFT","DOWN","UP","RIGHT"})[noteData + 1] .. ' LIGHT', -200, -200);
	addLuaSprite('image', false);
	setObjectCamera('image', 'other');
	runTimer('wait', 0.1);
end
function onEvent(name,value1,value2)
	if name ~= 'cg_lights' then return end
	if value2 == "on" then
		if value1 == "dad" then

			opponentNoteHit = noteHit;
		else
			goodNoteHit = noteHit
		end
	end
	if value2 == "off" then
		opponentNoteHit = nil
		goodNoteHit = nil
	end
end
function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 0.8, 'linear');
	end
end
function onTweenCompleted(tag)
	if tag == 'byebye' then
	-- 	doTweenAlpha("byebye but better",'image', 0, 6.2, 'linear'); --this is soo unneccessary and useless starting from 0.5 to 0.3 to 0.1 is same *maybe*
	-- elseif tag == "image" then
		removeLuaSprite('image', true);
	end
end
--Made by Luscious#7798
--Improved by Superpowers04#3887