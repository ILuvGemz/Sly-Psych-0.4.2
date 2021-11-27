local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('InGame Nightmare Opening');
		allowCountdown = true;
		return Function_Stop;
	end
		runTimer('start', 0.01);
	return Function_Continue;

end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start' then
	noteTweenX('flechusdeletus1', 0, -200, 0.01, 'linear')
        noteTweenX('flechusdeletus2', 1, -200, 0.01, 'linear')
        noteTweenX('flechusdeletus3', 2, -200, 0.01, 'linear')
        noteTweenX('flechusdeletus4', 3, -200, 0.01, 'linear')
	noteTweenX('middletime1', 4, 414, 0.01, 'linear')
        noteTweenX('middletime2', 5, 527, 0.01, 'linear')
        noteTweenX('middletime3', 6, 637, 0.01, 'linear')
        noteTweenX('middletime4', 7, 750, 0.01, 'linear')
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
		setProperty('health', getProperty('health')-0.02);
if getProperty('health') < 0.05 then

    setProperty('health', 0.01);
		
	end
end