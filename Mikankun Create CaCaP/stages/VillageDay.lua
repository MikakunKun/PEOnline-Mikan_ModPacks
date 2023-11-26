function onCreate()
	
	   makeLuaSprite('BG', 'monkeystage/Daytime_BG', -320, -50);
	   setScrollFactor('BG', 1, 1);
	   addLuaSprite('BG', false);

	   makeAnimatedLuaSprite('bashers', 'monkeystage/BG_Bash_Day', -170, 200);
	   addAnimationByPrefix('bashers', 'idle', 'BG_Bash_Day', 24, true)
	   setScrollFactor('bashers', 1, 1);
	   addLuaSprite('bashers', false);
    end

function onCountdownTick(c)
	onBeatHit()
        end

function onUpdate(elapsed)

        end

function onBeatHit()
		playAnim('bashers', 'idle', true);
	end