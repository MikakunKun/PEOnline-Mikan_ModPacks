local xx = 430;
local yy = 430;
local xx2 = 880;
local yy2 = 380;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

local songlowerName
function onCreate()
	songlowerName = string.lower(songName)
	if songlowerName == 'heartbeat' then
		yy = 480
		yy2 = 530
	elseif songlowerName == 'monotone attack' then
		followchars = false
		addLuaScript('data/LoadSecondJson')
	end

	makeLuaSprite('far back', 'swampert-stage/far back', -950, -600);
	addLuaSprite('far back', false);
	setScrollFactor('far back', 0.6, 0.6);

	makeLuaSprite('back plants', 'swampert-stage/back plants', -950, -550);
	addLuaSprite('back plants', false);
	setScrollFactor('back plants', 0.8, 0.8);

	makeLuaSprite('ground', 'swampert-stage/ground', -880, 220);
	addLuaSprite('ground', false);
	setScrollFactor('ground', 1.0, 1.0);

	makeLuaSprite('front plants', 'swampert-stage/front plants', -870, 480);
	addLuaSprite('front plants', true);
	setScrollFactor('front plants', 0.8, 0.8);

	function onUpdate()
		if del > 0 then
			del = del - 1
		end
		if del2 > 0 then
			del2 = del2 - 1
		end
		if followchars == true then
			if mustHitSection == false then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx-ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx+ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
					triggerEvent('Camera Follow Pos',xx-ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
					triggerEvent('Camera Follow Pos',xx+ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
					triggerEvent('Camera Follow Pos',xx,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
					triggerEvent('Camera Follow Pos',xx,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
				
			else
			
				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
			end
		else
			triggerEvent('Camera Follow Pos','','')
		end
	end
end