function onCreate()

	   makeLuaSprite('black', 'monkeystage/black1', -320, -50);
	   setScrollFactor('black', 1, 1);
	
	   makeLuaSprite('BG', 'monkeystage/Snowedin_BG', -320, -50);
	   setScrollFactor('BG', 1, 1);
	   
	   makeLuaSprite('snowshit', 'monkeystage/snowfall', -650, -450);
	   setScrollFactor('showshit', 1, 1);
       scaleObject('snowshit', 1.1, 1.1);
	   
       makeLuaSprite('flash', 'monkeystage/fuck_this', -320, -50);	 
	   
       makeLuaSprite('blizzard', 'monkeystage/blizzard', -720, -400);
       scaleObject('blizzard', 1.2, 1.2);
	   
       makeLuaSprite('fog', 'monkeystage/Blizzard_Fog', -900, -50);
       scaleObject('fog', 1, 1);		   
	   

	   makeAnimatedLuaSprite('bashers', 'monkeystage/BG_Bash_Blizzard', -250, 180);
	   addAnimationByPrefix('bashers', 'idle', 'BG_Bash_Night', 24, true)
	   setScrollFactor('bashers', 1, 1);
	   
	   addLuaSprite('BG', false);
	   addLuaSprite('bashers', false);
       addLuaSprite('black', false);
	   addLuaSprite('snowshit', true);	
       addLuaSprite('blizzard', true);   
       addLuaSprite('fog', true);
       addLuaSprite('flash', true);		 
    end

function onStartCountdown()
	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0)
    setProperty('boyfriend.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('snowshit.alpha', 0)	
	setProperty('fog.alpha', 0)	
	setProperty('flash.alpha', 0)	
	setProperty('blizzard.alpha', 0)		
	doTweenX('snowshit1', 'snowshit', -350, 5, 'linear')
	doTweenY('snowshity', 'snowshit', -250, 5, 'linear')
	doTweenX('blizzardshit1', 'blizzard', -350, 0.2, 'linear')
	doTweenY('blizzardshity', 'blizzard', 50, 0.2, 'linear')	
	doTweenX('blizzardfog', 'fog', -300, 0.2, 'linear')	
	

	return Function_Continue
end

function onStepHit()
	if curStep == 32 then
		doTweenAlpha('dad', 'dad', 1, 1, 'linear')
		doTweenAlpha('iconP2', 'iconP2', 1, 1, 'linear')
	end
		if curStep == 71 then
		doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'linear')
		doTweenAlpha('iconP1', 'iconP1', 1, 1, 'linear')
	end
		if curStep == 192 then
	    setProperty('flash.alpha', 1)	  
		doTweenAlpha('flTw','flash',0,1,'linear')
		setProperty('gf.alpha', 1)
		setProperty('black.alpha', 0)
	    setProperty('snowshit.alpha', 1)
   		doTweenColor('idk1', 'boyfriend', '0xFFe4e4e5', 0.00001, 'linear')    
		doTweenColor('idk2', 'dad', '0xFFe4e4e5', 0.00001, 'linear')	
        doTweenColor('idk3', 'gf', '0xFFe4e4e5', 0.00001, 'linear')			
        goodlordheclapped()		
	end	
		if curStep == 208 or curStep == 224 or curStep == 240 or  curStep == 376 or curStep == 380 or curStep == 452 or curStep == 484 or curStep == 592 or curStep == 624 or curStep == 192 or curStep == 696 or curStep == 700 or curStep == 772 or curStep == 804 then	
		goodlordheclapped()
	end	
        if curStep == 824 then
		endlessCheekClapping()
    end		
end

function onBeatHit()
		playAnim('bashers', 'idle', true);
	end

function onTweenCompleted(tag) --goddamn do i hate this code
     if tag == 'snowshity' then 
	         doTweenY('snowshity2', 'snowshit', -50, 5, 'linear')
			 end
     if tag == 'snowshit1' then 
	         doTweenX('snowshit2', 'snowshit', -550, 5, 'linear')
			 end
     if tag == 'snowshity2' then 
	         doTweenY('snowshityreset', 'snowshit', -500, 0.00001, 'linear')
			 end
     if tag == 'snowshit2' then 
	         doTweenX('snowshitreset', 'snowshit', -550, 0.00001, 'linear')
			 end
     if tag == 'snowshityreset' then 
	         doTweenY('snowshity', 'snowshit', -250, 5, 'linear')
			 end
     if tag == 'snowshitreset' then 
	         doTweenX('snowshit1', 'snowshit', -350, 5, 'linear')
			 end
     if tag == 'blizzardshity' then 
	         doTweenY('blizzardshityreset', 'blizzard', -600, 0.00001, 'linear')
			 end
     if tag == 'blizzardshit1' then 
	         doTweenX('blizzardshitreset', 'blizzard', -720, 0.00001, 'linear')
			 end  
     if tag == 'blizzardshityreset' then 
	         doTweenY('blizzardshity', 'blizzard', -100, 0.2, 'linear')
			 end
     if tag == 'blizzardshitreset' then	
	         doTweenX('blizzardshit1', 'blizzard', -350, 0.2, 'linear')
			 end      
     if tag == 'blizzardfog' then 
	         doTweenX('blizzardfogreset', 'fog', -900, 0.00001, 'linear')
			 end  
     if tag == 'blizzardfogreset' then 
	         doTweenX('blizzardfog', 'fog', -300, 0.2, 'linear')
			 end	
     if tag == 'blizzardfade' then 
	         snowReset()
			 end		 
end		


function goodlordheclapped()
     characterPlayAnim('dad', 'clap');
     characterPlayAnim('gf', 'breeze');
     setProperty('gf.specialAnim', true)	 
	 doTweenAlpha('snowfade', 'snowshit', 0, 0.00001, 'linear')
     setProperty('fog.alpha', 1)
     setProperty('blizzard.alpha', 1)	 
     doTweenAlpha('blizzardfade', 'blizzard', 0, 1.5, 'linear')	
     doTweenAlpha('fogfade', 'fog', 0, 1.5, 'linear')  	 
end	

function snowReset()
     playAnim('gf', 'breeze end');
	 setProperty('gf.specialAnim', true)	
	 doTweenAlpha('snowfade', 'snowshit', 1, 1.5, 'linear') 
end	 

function endlessCheekClapping()
     characterPlayAnim('dad', 'clap');
     characterPlayAnim('gf', 'breeze');
     setProperty('gf.specialAnim', true)	 
	 doTweenAlpha('snowfade', 'snowshit', 0, 0.00001, 'linear')
     setProperty('fog.alpha', 1)
     setProperty('blizzard.alpha', 1) 	 
end	