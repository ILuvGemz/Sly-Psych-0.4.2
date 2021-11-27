function onCreate()

	makeLuaSprite('theSpace','bgWallsqd',-700,-400)
	addLuaSprite('theSpace',false)
	setLuaSpriteScrollFactor('theSpace', 0.1, 0.1);
	scaleObject('theSpace', 0.7, 0.7);

	makeAnimatedLuaSprite('bgCharacters','upperBopdead',100,-100)
	addAnimationByPrefix('bgCharacters','bop','Upper Crowd Bob',24,true)
	addLuaSprite('bgCharacters',false)
	objectPlayAnimation('bgCharacters','bop',false);
	setLuaSpriteScrollFactor('bgCharacters', 0.3, 0.3)
	scaleObject('bgCharacters', 0.7, 0.7);

	makeLuaSprite('theBackground','bgEscalatorquake',-700,-400)
	addLuaSprite('theBackground',false)
	setLuaSpriteScrollFactor('theBackground', 0.3, 0.3);
	scaleObject('theBackground', 0.7, 0.7);

	makeLuaSprite('theGround','fgSnowquake',-400,620)
	addLuaSprite('theGround',false);

end

function onBeatHit()
	objectPlayAnimation('bgCharacters','bop',true)
end

function onStepHit()

end

function onUpdate()

end