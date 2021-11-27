function onCreate()

	makeLuaSprite('theBackground','bgDreamWalls',-700,-400)
	addLuaSprite('theBackground',false)
	setLuaSpriteScrollFactor('theBackground', 0.3, 0.3);
	scaleObject('theBackground', 0.7, 0.7);

	makeAnimatedLuaSprite('bgCharacters','upperBopslyception',-50,20)
	addAnimationByPrefix('bgCharacters','bop','Upper Crowd Bob',24,true)
	addLuaSprite('bgCharacters',false)
	objectPlayAnimation('bgCharacters','bop',false);
	setLuaSpriteScrollFactor('bgCharacters', 0.4, 0.4)
	scaleObject('bgCharacters', 0.7, 0.7);

	makeLuaSprite('theEscalator','bgDreamEscalator',-900,-500)
	addLuaSprite('theEscalator',false)
	setLuaSpriteScrollFactor('theEscalator', 0.4, 0.4)
	scaleObject('theEscalator', 0.8, 0.8);

	makeLuaSprite('theGround','fgDreamSnow',-400,620)
	addLuaSprite('theGround',false);

end

function onBeatHit()
	objectPlayAnimation('bgCharacters','bop',true)
end

function onStepHit()

end

function onUpdate()

end