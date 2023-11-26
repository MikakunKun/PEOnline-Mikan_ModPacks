--Por AsbelSen y Nickobelit
active = true
activeZoomDebil= false
activeZoomFuerte = true
function onCreatePost()
     if songName == 'finale' then
      active = false
end
     if songName == 'Defeat' then
      active = false
end
if songName == 'Cubism' or songName == 'Kyubism' then
      activeZoomDebil= false
      activeZoomFuerte = false
end
     if songName == 'Who' or songName == 'Voting-Time' or songName ==  'Sussus Nuzzus' or songName ==  'Idk' then
       activeZoomDebil= false
       activeZoomFuerte = false
end
     if songName == 'double-kill' or songName == 'finale' then
       activeZoomDebil= true
       activeZoomFuerte = false
     end
end

function onStepHit()
if songName == 'double-kill' then--Esa parte re lag da xd
if curStep >= 2942 and curStep <= 3008 then
activeZoomDebil= false
active = false
end
if curStep >= 3008 and curStep <= 3408 then
activeZoomDebil= true
active = true
end
if curStep >= 3408 then--Aqui con el zoom se ve raro así que...mejor adiós xdd
activeZoomDebil= false
end
end
end

--Full Offsets Manual por Nickobelit (Re cansado fue hacerlo xd)
--Al final se usó un código que lo hace re facil xd , aún asi aquí se queda mi trabajo
--[[function onUpdate()
if not lowQuality then
--if getProperty('dad.curCharacter') == 'attack' then --Estoestabugnolousenaaaaaa
 --AnimDAD={'left','down','up','right'}
-- offsetsXDAD={82, -7, -131, -78}
-- offsetsYDAD={-141, -191, 20, -118}
-- end

if getProperty('boyfriend.curCharacter') == 'amongbf' then
 AnimBF={'left0','down0','up0','right0'}
 offsetsXBF={-14, 2, -44, -37}
 offsetsYBF={104, 67, 125, 97}
 end

if getProperty('dad.curCharacter') == 'bananungus-alt' then
 AnimDAD={'REALleft','REALdown','REALup','REALright'}
 offsetsXDAD={279, -20 -41, -230}
 offsetsYDAD={-201, -442, -53, -380}
 end

if getProperty('dad.curCharacter') == 'bananungus' then
 AnimDAD={'bleft','bdown','bup','bright'}
 offsetsXDAD={191, -175 -229, -280}
 offsetsYDAD={-317, -439, -139, -527}
 end

if getProperty('boyfriend.curCharacter') == 'bf_turb' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWNh','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={-29, -74, 12, -26}
 offsetsYBF={-18, -21, 7, 31}
 end

if getProperty('boyfriend.curCharacter') == 'bf-defeat-normal' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={-46, -46, -47, -49}
 offsetsYBF={-1, -15, 9, -3}
 end

if getProperty('boyfriend.curCharacter') == 'bf-defeat-scared' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={11, -28, -17, -72}
 offsetsYBF={0, -46, 74, -17}
 end

if getProperty('boyfriend.curCharacter') == 'bf-fall' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={1, 8, -66, -63}
 offsetsYBF={-1, -37, 59, -5}
 end

if getProperty('boyfriend.curCharacter') == 'bf-lava' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -22, -46, -55}
 offsetsYBF={-12, -53, 19, -5}
 end

if getProperty('boyfriend.curCharacter') == 'bf-lavaOld' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -10, -29, -48}
 offsetsYBF={-6, -50, 27, -7}
 end

if getProperty('boyfriend.curCharacter') == 'bf-pixel' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={8, 8, 8, 8}
 offsetsYBF={0, 0, 0, 0}
 end

if getProperty('boyfriend.curCharacter') == 'bf-running' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={84, -23, 43, 3}
 offsetsYBF={-8, -57, 31, -1}
 end

if getProperty('boyfriend.curCharacter') == 'bf-wd' then
 AnimBF={'LEFT','DOWN','UP','RIGHT'}
 offsetsXBF={0, 0, 0, 0}
 offsetsYBF={0, 0, 0, 0}
 end

if getProperty('boyfriend.curCharacter') == 'bf' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -20, -46, -48}
 offsetsYBF={-6, -51, 27, -7}
 end

if getProperty('boyfriend.curCharacter') == 'bfairship' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={14, -12, -36, -44}
 offsetsYBF={-7, -55, 24, -7}
 end

if getProperty('boyfriend.curCharacter') == 'bfg' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -10, -29, -48}
 offsetsYBF={-6, -50, 27, -7}
 end

if getProperty('boyfriend.curCharacter') == 'bfmira' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={11, -21, -42, -56}
 offsetsYBF={-7, -50, 25, -5}
 end

if getProperty('boyfriend.curCharacter') == 'bfpolus' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={15, -10, -40, -51}
 offsetsYBF={-10, -50, 20, -5}
 end

if getProperty('boyfriend.curCharacter') == 'bfr' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={6, -22, -48, -52}
 offsetsYBF={-7, -51, 27, -5}
 end

if getProperty('boyfriend.curCharacter') == 'bfsauce' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={35, 9, -21, -21}
 offsetsYBF={-16, -47, -20, -2}
 end

if getProperty('boyfriend.curCharacter') == 'bfscary' then
 AnimBF={'BF left','BF down','BF up','BF right'}
 offsetsXBF={12, -11, -20, -51}
 offsetsYBF={-185, -219, -167, -193}
 end

if getProperty('boyfriend.curCharacter') == 'bfsus-pixel' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={10, 10, 10, 10}
 offsetsYBF={0, 0, 0, 0}
 end

if getProperty('boyfriend.curCharacter') == 'bfsusreal' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={-57, -60, 34, -68}
 offsetsYBF={-6, -51, 29, -6}
 end

if getProperty('boyfriend.curCharacter') == 'bfTTNormal' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -20, -46, -48}
 offsetsYBF={-6, -51, 27, -7}
 end

if getProperty('boyfriend.curCharacter') == 'bfTTPerspective' then
 AnimBF={'BF left','BF down','BF up','BF right'}
 offsetsXBF={12, -11, -20, -51}
 offsetsYBF={-185, -219, -167, -193}
 end

if getProperty('boyfriend.curCharacter') == 'bfVerde' then
 AnimBF={'BF NOTE LEFT0','BF NOTE DOWN0','BF NOTE UP0','BF NOTE RIGHT0'}
 offsetsXBF={5, -20, -46, -48}
 offsetsYBF={-6, -51, 27, -7}
 end

if getProperty('dad.curCharacter') == 'black-run' then
 AnimDAD={'BLACK LEFT','BLACK DOWN','BLACK UP','BLACK RIGHT'}
 offsetsXDAD={124, -53, 54, 176}
 offsetsYDAD={287, 327, 542, 345}
 end

if getProperty('dad.curCharacter') == 'black' then
 AnimDAD={'black left','black down','black up','black right'}
 offsetsXDAD={580, 571, 684, 352}
 offsetsYDAD={-27, 270, 135, -48}
 end

if getProperty('dad.curCharacter') == 'blackalt' then
 AnimDAD={'left alt','down alt','up alt','right alt'}
 offsetsXDAD={137, 227, 142, -31}
 offsetsYDAD={-103, -184, 88, 25}
 end

if getProperty('dad.curCharacter') == 'blackdk' then
 AnimDAD={'left','down','up','right'}
 offsetsXDAD={48, 72, -111, -267}
 offsetsYDAD={-8, -168, -13, -81}
 end

if getProperty('dad.curCharacter') == 'blackold' then
 AnimDAD={'BLACK LEFT','BLACK DOWN','BLACK UP','BLACK RIGHT'}
 offsetsXDAD={176, 37, 100, -173}
 offsetsYDAD={-80, -111, 13, -100}
 end

if getProperty('boyfriend.curCharacter') == 'blackp' then
 AnimBF={'note left','note down','note up','note right'}
 offsetsXBF={137, -34, 35, -121}
 offsetsYBF={156, 95, 203, 152}
 end

if getProperty('dad.curCharacter') == 'blackpostor' then
 AnimDAD={'imposter left','impostor down','impostor up2','impostor right'}
 offsetsXDAD={180, -193, 75, -176}
 offsetsYDAD={-184, -213, -63, -205}
 end

if getProperty('boyfriend.curCharacter') == 'blue' then
 AnimBF={'blue right','blue down','blue up','blue left'}
 offsetsXBF={47, 36, 24, 17}
 offsetsYBF={-302, -320, -275, -302}
 end

if getProperty('boyfriend.curCharacter') == 'bluehit' then
 AnimBF={'hit right','hit down','hit up','hit left'}
 offsetsXBF={40, 55, 24, 17}
 offsetsYBF={-212, -331, -195, -302}
 end

if getProperty('dad.curCharacter') == 'bluewhonormal' then
 AnimDAD={'normal blue right','normal blue down','normal blue up','normal blue left'}
 offsetsXDAD={-13, -65, -2, -60}
 offsetsYDAD={-241, -221, -193, -231}
 end

if getProperty('dad.curCharacter') == 'bluewho' then
 AnimDAD={'blue right','blue down','blue up','blue left'}
 offsetsXDAD={75, -45, 64, -102}
 offsetsYDAD={-238, -221, -206, -235}
 end

if getProperty('dad.curCharacter') == 'charles' then
 AnimDAD={'left','down','up','right'}
 offsetsXDAD={0, 0, 0, 0}
 offsetsYDAD={0, 0, 0, 0}
 end

if getProperty('dad.curCharacter') == 'chefogus' then
 AnimDAD={'left','down','up','right'}
 offsetsXDAD={51, -41, 30, 91}
 offsetsYDAD={-85, -111, -31, -76}
 end

if getProperty('boyfriend.curCharacter') == 'clowfoe' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={31, 32, -67, -48}
 offsetsYBF={-111, -147, -60, -105}
 end

if getProperty('dad.curCharacter') == 'crewmate' then
 AnimDAD={'green left','green down','green up','green right'}
 offsetsXDAD={164, 46, 61, -89}
 offsetsYDAD={-216, -241, -96, -229}
 end

if getProperty('dad.curCharacter') == 'cval' then
 AnimDAD={'Cval Left','Cval Down','Cval Up','Cval Right'}
 offsetsXDAD={32, -6, 8, -17}
 offsetsYDAD={80, 28, 126, 89}
 end

if getProperty('dad.curCharacter') == 'cvaltorture' then
 AnimDAD={'cval left','cval down','cval up','cval right'}
 offsetsXDAD={87, 21, -12, -60}
 offsetsYDAD={97, 67, 102, 89}
 end

if getProperty('dad.curCharacter') == 'dave' then
 AnimDAD={'Dave Left','Dave Down','Dave Up','Dave Right'}
 offsetsXDAD={156, 163, 160, 159}
 offsetsYDAD={1, 1, 5, 3}
 end

if getProperty('dad.curCharacter') == 'dead' then
 AnimDAD={'left2','down2','up','right'}
 offsetsXDAD={240, 20, 104, -220}
 offsetsYDAD={67, -180, 471, 140}
 end
 
if getProperty('dad.curCharacter') == 'impostor' then
 AnimDAD={'imposter left0','impostor down0','impostor up20','impostor right0'}
 offsetsXDAD={248, 40, -16, -73}
 offsetsYDAD={-285, -235, -234, -294}
 end

if getProperty('dad.curCharacter') == 'impostor2' then
 AnimDAD={'imposter left0','impostor down0','impostor up20','impostor right0'}
 offsetsXDAD={162, 70, 70, 70}
 offsetsYDAD={-275, -347, -255, -283}
 end

if getProperty('dad.curCharacter') == 'henry' then
 AnimDAD={'Henry Left','Henry Down','Henry Up','Henry Right'}
 offsetsXDAD={149, 137, 19, 14}
 offsetsYDAD={-22, -150, 2, -64}
 end

if getProperty('dad.curCharacter') == 'sabotage' then
 AnimDAD={'impostor left0','impostor down0','impostor up0','impostor right0'}
 offsetsXDAD={208, 39, -16, 17}
 offsetsYDAD={-285, -235, -234, -291}
 end

if getProperty('boyfriend.curCharacter') == 'whitewho' then
 AnimBF={'white left','white down','white up','white right'}
 offsetsXBF={385, 103, 214, 37}
 offsetsYBF={-280, -286, -98, -286}
 end

if getProperty('boyfriend.curCharacter') == 'whitemad' then
 AnimBF={'left','down','up','right'}
 offsetsXBF={336, 237, -7, 98}
 offsetsYBF={-297, -280, -301, -279}
 end
end
end]]


function goodNoteHit(id, direction, noteType, isSustainNote)
if not lowQuality then
	if _G['boyfriendGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
    if active == true then
		createGhost('boyfriend')
	end
		if activeZoomDebil == true then
		triggerEvent('Add Camera Zoom','0.015','0.015');
		end
	    if activeZoomFuerte == true then
        triggerEvent('Add Camera Zoom','0.015','0.03');
		end
end
	
	if not isSustainNote then
		_G['boyfriendGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
		updateGData('boyfriend')	
end

	if noteType == 'GF Sing' or gfSection then
if _G['gfGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
  if active == true then
			createGhost('gf')
	end
if activeZoomDebil == true then
		triggerEvent('Add Camera Zoom','0.015','0.015');
		end
	if activeZoomFuerte == true then
        triggerEvent('Add Camera Zoom','0.015','0.03');
		end
end
end

		if not isSustainNote then
			_G['gfGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
			updateGData('gf')	
	end
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
if not lowQuality then
	if _G['dadGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote and noteType == '' and not gfSection then
if active == true then
		createGhost('dad')
		end
	if activeZoomDebil == true then
		triggerEvent('Add Camera Zoom','0.015','0.015');
		end
	if activeZoomFuerte == true then
        triggerEvent('Add Camera Zoom','0.015','0.03');
		end
end


	if not isSustainNote and noteType == '' and not gfSection then
		_G['dadGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
		updateGData('dad')	
end


	if noteType == 'GF Sing' or gfSection then
		if _G['gfGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
      if active == true then
			createGhost('gf')
			end
	if activeZoomDebil == true then
		triggerEvent('Add Camera Zoom','0.015','0.015');
		end
	if activeZoomFuerte == true then
        triggerEvent('Add Camera Zoom','0.015','0.03');
		end
		end
end

		if not isSustainNote then
			_G['gfGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
			updateGData('gf')	
end
end
end

function createGhost(char)
if active == true then
if not lowQuality then
	songPos = getSongPosition() --Esto fue una muy buena idea Asbel
    makeAnimatedLuaSprite(char..'Ghost'..songPos, getProperty(char..'.imageFile'),getProperty(char..'.x'),getProperty(char..'.y'))
    addLuaSprite(char..'Ghost'..songPos, false)
    setProperty(char..'Ghost'..songPos..'.scale.x',getProperty(char..'.scale.x'))
	setProperty(char..'Ghost'..songPos..'.scale.y',getProperty(char..'.scale.y'))
	setProperty(char..'Ghost'..songPos..'.flipX', getProperty(char..'.flipX'))
    setProperty(char..'Ghost'..songPos..'.color',getColorFromRGB(getProperty(char..'.healthColorArray')[1],getProperty(char..'.healthColorArray')[2],getProperty(char..'.healthColorArray')[3],true))
	setProperty(char..'Ghost'..songPos..'.alpha', 0.8)
	setBlendMode(char..'Ghost'..songPos, 'HARDLIGHT')
	doTweenAlpha(char..'Ghost'..songPos..'delete', char..'Ghost'..songPos, 0,0.75,'linear')
	setProperty(char..'Ghost'..songPos..'.animation.frameName', _G[char..'GhostData.frameName'])
	setProperty(char..'Ghost'..songPos..'.offset.x', _G[char..'GhostData.offsetX'])
	setProperty(char..'Ghost'..songPos..'.offset.y', _G[char..'GhostData.offsetY'])
	setObjectOrder(char..'Ghost'..songPos, getObjectOrder(char..'Group')-1)
end
end
end

function onTweenCompleted(tag)
	if (tag:sub(#tag- 5, #tag)) == 'delete' then
		removeLuaSprite(tag:sub(1, #tag - 6), true)
	end
end

function updateGData(char)
	_G[char..'GhostData.frameName'] = getProperty(char..'.animation.frameName')
	_G[char..'GhostData.offsetX'] = getProperty(char..'.offset.x')
	_G[char..'GhostData.offsetY'] = getProperty(char..'.offset.y')
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end