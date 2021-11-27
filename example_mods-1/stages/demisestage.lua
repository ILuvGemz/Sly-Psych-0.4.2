function onCreate()

	makeLuaSprite('theSpace','bgWallsqd',-700,-400)
	addLuaSprite('theSpace',false)
	setLuaSpriteScrollFactor('theSpace', 0.2, 0.2);
	scaleObject('theSpace', 0.7, 0.7);

end

function onBeatHit()
	objectPlayAnimation('bgCharacters','bop',true)
end

function onStepHit()

end

function onUpdate()

end