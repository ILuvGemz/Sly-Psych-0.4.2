function onCreate()
	makeLuaSprite('guns_ascencion', 'bgWallsqd', -400, -200)
		scaleLuaSprite('guns_ascencion', 0.6, 0.6)
		setLuaSpriteScrollFactor('guns_ascencion', 0.2, 0.2)
				
	addLuaSprite('guns_ascencion',false);
	
	doTweenAlpha('guns_ascencion', 'guns_ascencion', 0, 0.01, 'backIn')
	
end

function onBeatHit()

	if curBeat == 224 then 
		doTweenAlpha('guns_ascencion', 'guns_ascencion', 1, 11, 'linear')
	end
	
end
	