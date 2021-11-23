function onCreate()

	makeLuaSprite('theSpace','nightwallCrack',-700,-400)
	addLuaSprite('theSpace',false)
	setLuaSpriteScrollFactor('theSpace', 0.1, 0.1);
	scaleObject('theSpace', 0.7, 0.7);

	makeLuaSprite('theBackground','bgWallsnightmare',-700,-400)
	addLuaSprite('theBackground',false)
	setLuaSpriteScrollFactor('theBackground', 0.3, 0.3);
	scaleObject('theBackground', 0.7, 0.7);

	makeAnimatedLuaSprite('bgCharacters','upperBopnightmare',-50,20)
	addAnimationByPrefix('bgCharacters','bop','Upper Crowd Bob',24,true)
	addLuaSprite('bgCharacters',false)
	objectPlayAnimation('bgCharacters','bop',false);
	setLuaSpriteScrollFactor('bgCharacters', 0.4, 0.4)
	scaleObject('bgCharacters', 0.7, 0.7);

	makeLuaSprite('theEscalator','bgEscalatornightmare',-900,-500)
	addLuaSprite('theEscalator',false)
	setLuaSpriteScrollFactor('theEscalator', 0.4, 0.4)
	scaleObject('theEscalator', 0.8, 0.8);

	makeLuaSprite('theGround','fgSnownightmare',-400,620)
	addLuaSprite('theGround',false);

end

function onBeatHit()
	objectPlayAnimation('bgCharacters','bop',true)
end

function onStepHit()

end

function onUpdate()

end