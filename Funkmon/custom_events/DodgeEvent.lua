local onlineOwner=false
function onCreate()

    Dodged = false;
    canDodge = false;

    precacheImage('warning');
    onlineOwner=runHaxeCode('return PlayState.playerSide();')
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
        characterPlayAnim('dad', 'attack', true);
        setProperty('dad.specialAnim', true);
        if (onlineOwner==false) then
                makeLuaSprite('warning', 'warning', 527, 400);
                addLuaSprite('warning', true);
                setObjectCamera('warning', 'other');
                doTweenAlpha('warningAlpha', 'warning', 0, 0.3, 'linear');
                
                canDodge = true;
                runTimer('Died', 0.87);
                runTimer('flash', 0.4);
                
                end
        end
end

function onUpdate()
   if canDodge == true and keyboardJustPressed("SPACE") then
   
	Dodged = true;
   	canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
        addHaxeLibrary("GameClient", 'online')
        if tag == 'Died' and Dodged == false then
                removeLuaSprite('warning', true);
                characterPlayAnim('boyfriend', 'hurt', true)
                setProperty('boyfriend.specialAnim', true);
                runHaxeCode('GameClient.send("charPlay", ["hurt", false]);')
                health = getProperty('health')
                setProperty('health', health - 0.55);
        
        elseif tag == 'Died' and Dodged == true then
                removeLuaSprite('warning', true);
                characterPlayAnim('boyfriend', 'dodge', true)
                setProperty('boyfriend.specialAnim', true);
                runHaxeCode('GameClient.send("charPlay", ["dodge", false]);')
                Dodged = false
        elseif tag == 'flash' then
                removeLuaSprite('warning', true);
                makeLuaSprite('warning', 'warning', 527, 400);
                addLuaSprite('warning', true);
                setObjectCamera('warning', 'other');
                doTweenAlpha('warningAlpha', 'warning', 0, 0.3, 'linear');
        end
end