function onStepHit()

	if curStep== 32 then
	doTweenX('cloudTween1', 'cloud3',getProperty('cloud3.x')-2550, 300, 'linear')

	doTweenX('cloudTween2', 'cloud4',getProperty('cloud4.x')-1850, 300, 'linear')

	doTweenX('cloudTween3', 'cloud5',getProperty('cloud5.x')-1850, 300, 'linear')

	doTweenX('cloudTween4', 'cloud6',getProperty('cloud6.x')-3000, 300, 'linear')

	doTweenX('cloudTween5', 'cloud2',getProperty('cloud2.x')-2650, 300, 'linear')
	end
	end