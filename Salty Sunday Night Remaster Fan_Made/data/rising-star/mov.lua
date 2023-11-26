function onUpdate(elapsed)
	if gfName == 'city-mov' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/400)*(bpm/130)
  
		doTweenX(gfTweenX, 'gf', -800-300*math.sin((currentBeat*0.25)*math.pi),0.001)

	  end
	end
end
