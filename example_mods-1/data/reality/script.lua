function onCreate()
	makeLuaSprite('transitionwhite', nil, -400, -300);
		luaSpriteMakeGraphic('transitionwhite', screenWidth * 2, screenHeight * 2, 'ffffff');	
		setScrollFactor('transitionwhite', 0, 0);
		doTweenAlpha('transitionwhite', 'transitionwhite', 0, 0.01, 'backIn')

	addLuaSprite('transitionwhite',true)

end

function onBeatHit()
	if curBeat == 32 then
	doTweenAlpha('transitionwhite', 'transitionwhite', 1, 0.1, 'backIn')
	runTimer('thingshappend', 0.2)
	end
end

function onTimerCompleted(tag)
	if tag == 'thingshappend' then
	doTweenAlpha('transitionwhite', 'transitionwhite', 0, 0.5, 'linear')
		objectPlayAnimation('theBackground','state2',false)
		objectPlayAnimation('theEscalator','state2',false)
		objectPlayAnimation('theGround','state2',false)
	removeLuaSprite('bgCharacters',false)
	end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curBeat > 32 then
	triggerEvent('Screen Shake', '0.3, 0.01', '0, 0')
	end
end

function onUpdate(elapsed)
    local currentBeat = (getSongPosition() / 1000)*(bpm/160)
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] + 7 * math.cos((currentBeat + i*0.3) * math.pi));
        setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] + 7 * math.cos((currentBeat + i*0.3) * math.pi));
    end
end