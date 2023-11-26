local timebwap = 0;
function onUpdate(elapsed)
	  doTweenY('opponentFloatbwap', 'dad', (math.sin(timebwap*5)*40),0.001, 'linear')
	  timebwap = timebwap+0.01
  end