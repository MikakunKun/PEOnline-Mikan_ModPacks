function aonPause()
--took this script for sonic.exe ROTD and edited it lol

	makeLuaSprite('antipause', 'antipause', 0, 0);
	setScrollFactor('antipause', 1.0, 1.0);
	scaleObject('antipause', 0.32, 0.32);
	setObjectCamera('antipause', 'other')
	addLuaSprite('antipause', true);

    playSound("cancelMenu");
	return Function_Stop;
end

function aonUpdate()
        doTweenAlpha('antipause','antipause',0,0.7,'linear')
end