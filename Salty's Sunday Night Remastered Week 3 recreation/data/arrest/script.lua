

function onCreate()
    function onStepHit()
    
    if curStep == 128 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
  
  if curStep == 192 then
  
            removeLuaSprite('Wiu Wiu', true);

  end 
  
  if curStep == 448 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
     
    if curStep == 576 then
            
            removeLuaSprite('Wiu Wiu', true);

        end
        
          if curStep == 768 then

            makeLuaSprite('Wiu Wiu', 'Wiu Wiu', -400, -300);
            setLuaSpriteScrollFactor('Wiu Wiu', 0, 0);
            scaleObject('Wiu Wiu', 1.1, 1.1);
            addLuaSprite('Wiu Wiu', true);     
                
  end 
     
    if curStep == 896 then
            
            removeLuaSprite('Wiu Wiu', true);

        end
    end
end

