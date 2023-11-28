function onEvent(name, value1, value2)

 if name == 'startcountdownwarn' then

  playSound('intro3',0.6)

  runTimer('wait2', crochet/1000)

 end

end

function onTimerCompleted(tag)

 if tag == 'wait2' then

  playSound('2-warning',0.6)

  makeLuaSprite('countdownready', 'ready-warning',262,178)

  setObjectCamera('countdownready', 'hud')

  addLuaSprite('countdownready', true)

  doTweenAlpha('readyend','countdownready',0,crochet/1000,'cubeInOut')

  runTimer('wait1', crochet/1000)

 end

 if tag == 'wait1' then

  playSound('1-warning',0.6)

  makeLuaSprite('countdownset', 'set-warning',289,199)

  setObjectCamera('countdownset', 'hud')

  addLuaSprite('countdownset', true)

  doTweenAlpha('setend','countdownset',0,crochet/1000,'cubeInOut')

  runTimer('waitgo', crochet/1000)

 end

 if tag == 'waitgo' then

  playSound('go-warning',0.6)

  makeLuaSprite('countdowngo', 'go-warning',361,145)

  setObjectCamera('countdowngo', 'hud')

  doTweenAlpha('goend','countdowngo',0,crochet/1000,'cubeInOut')

  addLuaSprite('countdowngo', true)

 end

end

function onCreate()

 setProperty('skipCountdown',true)

end