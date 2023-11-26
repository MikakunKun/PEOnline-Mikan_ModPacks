function onCreate()
	makeLuaSprite('Volcan-BG', 'Volcan-BG', -1500, -700);

	makeLuaSprite('Volcan-Cano', 'Volcan-Cano', -1000, -1200);

	makeLuaSprite('Volcan-Ground', 'Volcan-Ground', -1500, 800);

	makeLuaSprite('Volcan-Smoke', 'Volcan-Smoke', -1500, 330);

        makeAnimatedLuaSprite('Volcan-Lava', 'Volcan-Lava', -1000, -470)
	addAnimationByPrefix('Volcan-Lava','Volcan-Lava','Volcan-Lava', 24, true)
	objectPlayAnimation('Volcan-Lava', 'Volcan-Lava', true);

	setLuaSpriteScrollFactor('Volcan-Ground', 1, 1);
        setLuaSpriteScrollFactor('Volcan-Cano', 1.1, 1);
        setLuaSpriteScrollFactor('Volcan-Lava', 1.1, 1);
        setLuaSpriteScrollFactor('Volcan-BG', 1.25, 1);

	makeLuaSprite('Snowysky', 'Snowysky', -850, -300);
        addLuaSprite('Snowysky', false)

	makeLuaSprite('Snowystuff', 'Snowystuff', -800, 100);
        addLuaSprite('Snowystuff', false)

	makeLuaSprite('Snowyfloor', 'Snowyfloor', -1300, 800);
        addLuaSprite('Snowyfloor', false)

	setLuaSpriteScrollFactor('Snowyfloor', 1, 1);
        setLuaSpriteScrollFactor('Snowystuff', 1.1, 1);
        setLuaSpriteScrollFactor('Snowysky', 1.25, 1);


	makeLuaSprite('Trees', 'Trees', -850, -300);

	makeLuaSprite('Grass', 'Grass', -1500, 800);

	makeLuaSprite('Bushes', 'Bushes', -650, 530);

	setLuaSpriteScrollFactor('Grass', 1, 1);
        setLuaSpriteScrollFactor('Bushes', 1.1, 1);
        setLuaSpriteScrollFactor('Trees', 1.25, 1);
        addLuaSprite('Trees', false)
        addLuaSprite('Grass', false)
        addLuaSprite('Bushes', false)


end

function onUpdate(elapsed)
if curBeat >= 128 and curBeat <= 129 then
setProperty('health', 1);
doTweenY('bfmoves', 'Trees', 2500, 0.01)
doTweenY('dadmoves', 'Grass', 2330, 0.01)
doTweenY('gfmoves', 'Bushes', 2300, 0.01)
end

if curBeat >= 208 and curBeat <= 209 then
setProperty('health', 1);
doTweenY('bfmoves', 'Snowysky', 112500, 0.01)
doTweenY('dadmoves', 'Snowystuff', 112330, 0.01)
doTweenY('gfmoves', 'Snowyfloor', 112300, 0.01)
doTweenY('bfmoves', 'Trees', -300, 0.01)
doTweenY('dadmoves', 'Grass', 800, 0.01)
doTweenY('gfmoves', 'Bushes', 530, 0.01)
end

if curBeat >= 320 and curBeat <= 321 then
setProperty('health', 1);
doTweenY('bfmoves', 'Trees', 2500, 0.01)
doTweenY('dadmoves', 'Grass', 2330, 0.01)
doTweenY('gfmoves', 'Bushes', 2300, 0.01)

        addLuaSprite('Volcan-BG', false)
        addLuaSprite('Volcan-Cano', false)
        addLuaSprite('Volcan-Ground', false)
        addLuaSprite('Volcan-Smoke', true)
        addLuaSprite('Volcan-Lava',false);
setProperty('defaultCamZoom', 0.55);

end
end