local actuallend = false
local dialoguepass = false
local backtoaction = false
function onStartCountdown()
	if isStoryMode and not dialoguepass and not backtoaction and not seenCutscene then
		startDialogue('dialogue', '');
		playSound('flyingboat', 1, 'boats')
		setProperty('camFollow.x', getProperty('camFollow.x') - 100);
		dialoguepass = true;
		return Function_Stop;
		end		
	if isStoryMode and dialoguepass and not seenCutscene and not backtoaction  then	
	pauseSound('boats')
	doTweenZoom('zoomTween', 'camGame', 0.6, 9, 'linear');
	doTweenY('camYTween', 'camFollowPos', getProperty('camFollow.y') - 150, 9, 'linear');

	triggerEvent('Screen Shake', '9, 0.01', '0, 0')
	doTweenAlpha('transitionwhite', 'transitionwhite', 1, 9, 'linear')
	playMusic('dreambreaks', 1)
	runTimer('therealstart', 10)
	seenCutscene = true
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	makeLuaSprite('transitionwhite', nil, -400, -300);
		luaSpriteMakeGraphic('transitionwhite', screenWidth * 2, screenHeight * 2, 'ffffff');	
		setScrollFactor('transitionwhite', 0, 0);
		doTweenAlpha('transitionwhite', 'transitionwhite', 0, 0.01, 'backIn')
		setObjectCamera('transitionwhite', 'other')	
	addLuaSprite('transitionwhite',true)

end

function onBeatHit()
	if curBeat == 32 then
	doTweenAlpha('transitionwhite', 'transitionwhite', 1, 0.1, 'backIn')
	runTimer('thingshappend', 0.2)
	end
	if curBeat == 420 then
	
	seenCutscene = false
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
	
	if tag == 'endcutscene' then
		runTimer('endfix', 51.4);
		startVideo('dreamatch ending');
		end
	
	if tag == 'endfix' then
	actuallend = true
		endSong()
	end
	
	if tag == 'therealstart' then
	doTweenZoom('zoomTween', 'camGame', 0.8, 0.001, 'quadOut');
	startCountdown()
	doTweenAlpha('transitionwhite', 'transitionwhite', 0, 2, 'linear')
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
function onNextDialogue(line)
	if line == 12 then
	pauseSound('boats')
	end
end

	---the end--
	
	
function onEndSong()
	if isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('endcutscene', 1);
		seenCutscene = true;
		return Function_Stop;
	end		
	if isStoryMode and not actuallend then
		return Function_Stop;
		end
	return Function_Continue;
end
