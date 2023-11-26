

function onCreate()
    function onStepHit()
    
    if curStep == 256 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
  
  if curStep == 383 then
  
            removeLuaSprite('Wiu Wiu', true);

  end 
  
  if curStep == 511 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
     
    if curStep == 710 then
            
            removeLuaSprite('Wiu Wiu', true);

  end 
  
  if curStep == 1024 then
  
            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
  
    if curStep == 1663 then
            
            removeLuaSprite('Wiu Wiu', true);

        end
    end
end

