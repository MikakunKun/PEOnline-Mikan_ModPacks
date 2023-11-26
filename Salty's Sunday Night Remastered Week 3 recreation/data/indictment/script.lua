

function onCreate()
    function onStepHit()
    
    if curStep == 512 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
  
  if curStep == 640 then
  
            removeLuaSprite('Wiu Wiu', true);

  end 
  
  if curStep == 927 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
     
    if curStep == 1056 then
            
            removeLuaSprite('Wiu Wiu', true);

  end 
  
  if curStep == 1312 then
  
            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
  
    if curStep == 1568 then
            
            removeLuaSprite('Wiu Wiu', true);

        end
    end
end

