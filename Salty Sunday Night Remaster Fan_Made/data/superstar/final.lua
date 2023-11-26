function onUpdate(elapsed)
	if gfName == 'city-final' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/500)*(bpm/150)
  
		doTweenY(gfTweenY, 'gf', 600-1000*math.sin((currentBeat*0.25)*math.pi),0.001)

	  end
	end
end
