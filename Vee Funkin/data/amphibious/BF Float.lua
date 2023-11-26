local timebwap = 200;
function onUpdate(elapsed)
	  doTweenY('boyfriendFloatbwap', 'boyfriend', (math.sin(timebwap*5)*60),0.001, 'linear')
	  timebwap = timebwap+0.01
  end