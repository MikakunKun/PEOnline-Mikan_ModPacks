function onCreate()
	-- background shit
	makeLuaSprite('guild', 'guild', -550, -385);
	setScrollFactor('guild', 1.0, 0.9);
	scaleObject('guild', 1.1, 1.1);

makeAnimatedLuaSprite('croagunk-guild', 'croagunk-guild', -550, -370);
	luaSpriteAddAnimationByPrefix('croagunk-guild', 'croagunk-guild', 'croagunk-guild', 6, true);
	objectPlayAnimation('croagunk-guild', 'croagunk-guild', true);
	scaleObject('croagunk-guild', 1.1, 1.1)

makeAnimatedLuaSprite('bidoof-guild', 'bidoof-guild', -5000, -100);
	luaSpriteAddAnimationByPrefix('bidoof-guild', 'bidoof-guild', 'bidoof-guild', 6, true);
	objectPlayAnimation('bidoof-guild', 'bidoof-guild', true);
	scaleObject('bidoof-guild', .9, .9)

makeAnimatedLuaSprite('sunflora-guild', 'sunflora-guild', -1050, -240);
	luaSpriteAddAnimationByPrefix('sunflora-guild', 'sunflora-guild', 'sunflora-guild', 6, true);
	objectPlayAnimation('sunflora-guild', 'sunflora-guild', true);
	scaleObject('sunflora-guild', .9, .9)

	addLuaSprite('guild', false);
	addLuaSprite('croagunk-guild', false);
	addLuaSprite('bidoof-guild', true);
	addLuaSprite('sunflora-guild', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end