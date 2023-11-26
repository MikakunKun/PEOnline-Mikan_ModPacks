function onCreate()
    addLuaScript('data/LoadSecondJson')
    addLuaScript('data/voting-time/script/CameraMove')
    setGlobalFromScript('data/voting-time/script/CameraMove','CamMove',false)
    
    makeLuaSprite('otherroom','backer_groung_voting',387.3, 194.1)
    setScrollFactor('otherroom',0.8, 0.8)
    addLuaSprite('otherroom',false)

    makeLuaSprite('votingbg','main_bg_meeting',-315.15, 52.85)
    setScrollFactor('votingbg',0.95, 0.95)
    addLuaSprite('votingbg',false)

    makeLuaSprite('chairs','CHAIRS!!!!!!!!!!!!!!!',-7.9, 644.85)
    setScrollFactor('chairs',1, 1)
    addLuaSprite('chairs',false)

    makeLuaSprite('table','table_voting',209.4, 679.55)
    setScrollFactor('table',1, 1)
    addLuaSprite('table',true)

    makeLuaSprite('vt_light','light_voting',0,0)
    setScrollFactor('vt_light',1, 1)
    if not lowQuality then
    setBlendMode('vt_light','add')
    end
    setProperty('vt_light.alpha',0.46)
    setObjectCamera('vt_light','hud')
    addLuaSprite('vt_light',false)

    makeLuaSprite('Bars','bars',0,0)
    setObjectCamera('Bars','hud')
    addLuaSprite('Bars')
end