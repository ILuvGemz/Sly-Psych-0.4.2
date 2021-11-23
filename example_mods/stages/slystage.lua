function onCreate()

	makeLuaSprite('theBackground','bgWalls2',-700,-400)
	addLuaSprite('theBackground',false)
	setLuaSpriteScrollFactor('theBackground', 0.3, 0.3);
	scaleObject('theBackground', 0.7, 0.7);

	makeLuaSprite('theEscalator','bgEscalator2',-900,-500)
	addLuaSprite('theEscalator',false)
	setLuaSpriteScrollFactor('theEscalator', 0.4, 0.4)
	scaleObject('theEscalator', 0.8, 0.8);

	makeLuaSprite('theGround','fgSnow2',-400,620)
	addLuaSprite('theGround',false);

end

function onBeatHit()
	objectPlayAnimation('bgCharacters','bop',true)
end

function onStepHit()

end

function onUpdate()

end