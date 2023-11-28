--BUDYN--

local white = "ffffff"
local pink = "2D4891"
local blue = "3871F9"
local green = "6881BF"
local red = "151565"
local blue = "2F48EF"
local purple = "3552FF"

function goodNoteHit(id, direction, noteType, isSustainNote)
      if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                doTweenColor('timeBar', 'timeBar', pink, z, 'linear');
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                doTweenColor('timeBar', 'timeBar', red, 1, 'linear');
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                doTweenColor('timeBar', 'timeBar', green, 1, 'linear');
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                doTweenColor('timeBar', 'timeBar', blue, 1, 'linear');
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                doTweenColor('timeBar', 'timeBar', white, 1, 'linear');
		end
function noteMiss(id, direction, noteType, isSustainNote)
	    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
                doTweenColor('timeBar', 'timeBar', purple, 1, 'linear');
		end
	    if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
                doTweenColor('timeBar', 'timeBar', purple, 1, 'linear');
		end
	    if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
                doTweenColor('timeBar', 'timeBar', purple, 1, 'linear');
		end
	    if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
                doTweenColor('timeBar', 'timeBar', purple, 1, 'linear');
		end
end
    end