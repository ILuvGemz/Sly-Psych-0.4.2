function onCreate()
	makeLuaSprite('transitionwhite', nil, -400, -300);
		luaSpriteMakeGraphic('transitionwhite', screenWidth * 2, screenHeight * 2, 'ffffff');	
		setScrollFactor('transitionwhite', 0, 0);
		doTweenAlpha('transitionwhite', 'transitionwhite', 0, 0.01, 'backIn')
		
	makeLuaSprite('effect', 'resonancebg3', -600, -200)
		setScrollFactor('effect', 0.5, 0.5);
		doTweenAlpha('effect', 'effect', 0, 0.01, 'backIn')
		
	addLuaSprite('effect', false);
	addLuaSprite('transitionwhite', false);
		scaleLuaSprite('effect', 0.6, 0.6)
end

function onBeatHit()
	if curBeat == 47 then 
		doTweenAlpha('transitionwhite', 'transitionwhite', 1, 6, 'linear')
	end
	if curBeat == 64 then 
		doTweenAlpha('effect', 'effect', 1, 0.01, 'backIn')
		doTweenAlpha('transitionwhite', 'transitionwhite', 0, 3, 'linear')
	end
end