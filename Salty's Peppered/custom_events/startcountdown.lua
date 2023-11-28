function onEvent(name, value1, value2)

 if name == 'startcountdown' then

  playSound('intro3',0.6)

  runTimer('wait2', crochet/1000)

 end

end

function onTimerCompleted(tag)

 if tag == 'wait2' then

  playSound('intro2',0.6)

  makeLuaSprite('countdownready', 'ready',262,178)

  setObjectCamera('countdownready', 'hud')

  addLuaSprite('countdownready', true)

  doTweenAlpha('readyend','countdownready',0,crochet/1000,'cubeInOut')

  runTimer('wait1', crochet/1000)

 end

 if tag == 'wait1' then

  playSound('intro1',0.6)

  makeLuaSprite('countdownset', 'set',289,199)

  setObjectCamera('countdownset', 'hud')

  addLuaSprite('countdownset', true)

  doTweenAlpha('setend','countdownset',0,crochet/1000,'cubeInOut')

  runTimer('waitgo', crochet/1000)

 end

 if tag == 'waitgo' then

  playSound('introGo',0.6)

  makeLuaSprite('countdowngo', 'go',361,145)

  setObjectCamera('countdowngo', 'hud')

  doTweenAlpha('goend','countdowngo',0,crochet/1000,'cubeInOut')

  addLuaSprite('countdowngo', true)

 end

end

function onCreate()

 setProperty('skipCountdown',true)

end